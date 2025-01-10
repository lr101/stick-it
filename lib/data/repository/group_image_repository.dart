
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dto/group_image_dto.dart';
import '../entity/database.dart';
import '../service/global_data_service.dart';

part 'group_image_repository.g.dart';

class GroupImageRepository {
  final Ref ref;
  late Database _db;

  GroupImageRepository({required this.ref}) {
    _db = ref.watch(databaseProvider);
  }

  Future<GroupImageDto> fetchImage(String pinId, bool userGroup) async {
    final cachedImage = await (_db.select(_db.groupImageEntity)..where((tbl) => tbl.groupId.equals(pinId))).getSingleOrNull();
    if (cachedImage != null) {
      return GroupImageDto.fromEntity(cachedImage);
    }
    return await _fetchAndCacheImage(pinId, userGroup);
  }

  Future<Map<String, GroupImageDto>> fetchAllCashedImages() async {
    final images = <String, GroupImageDto>{};
    final cachedImages = await (_db.select(_db.groupImageEntity)).get();
    for (var image in cachedImages) {
      images[image.groupId] = GroupImageDto.fromEntity(image);
    }
    return images;
  }

  // Fetch the image from the API and cache it
  Future<GroupImageDto> _fetchAndCacheImage(String groupId, bool userGroup) async {
    try {
      final global = ref.watch(globalDataServiceProvider);
      final profileImageSmall = await http.get(Uri.parse("${global.minioHost}/groups/${groupId}/group_profile_small.png"));
      final profileImage = await http.get(Uri.parse("${global.minioHost}/groups/${groupId}/group_profile.png"));
      final groupPin = await http.get(Uri.parse("${global.minioHost}/groups/${groupId}/group_pin.png"));
     if (userGroup) {
       _addImageToCache(GroupImageEntityCompanion( // run async
         groupId: Value(groupId),
         profileImage: Value(profileImage.bodyBytes),
         pinImage: Value(groupPin.bodyBytes),
         profileImageSmall: Value(profileImageSmall.bodyBytes),
       ));
     }
     return GroupImageDto(
         profileImage: profileImage.bodyBytes,
         pinImage: groupPin.bodyBytes, 
         profileImageSmall: profileImageSmall.bodyBytes
     );
    } catch (e) {
      throw e;
    }
  }

  Future<void> addImage(String groupId, GroupImageDto image) async {
    await _addImageToCache(GroupImageEntityCompanion(
      groupId: Value(groupId),
      pinImage: Value(image.pinImage),
      profileImage: Value(image.profileImage),
      profileImageSmall: Value(image.profileImageSmall),
    ));
  }

  Future<void> _addImageToCache(GroupImageEntityCompanion cachedImage) async {
    await _db.into(_db.groupImageEntity).insertOnConflictUpdate(cachedImage);
  }

  Future<void> deleteGroupImage(String groupId) async {
    await (_db.delete(_db.groupImageEntity)..where((tbl) => tbl.groupId.equals(groupId))).go();
  }

}

@riverpod
GroupImageRepository groupImageRepository(Ref ref) => GroupImageRepository(ref: ref);