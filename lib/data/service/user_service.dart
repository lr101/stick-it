import 'dart:convert';
import 'dart:typed_data';

import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/entity/user_entity.dart';
import 'package:buff_lisa/data/repository/image_repository.dart';
import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../dto/global_data_dto.dart';
import '../dto/local_user_dto.dart';
import '../repository/user_repository.dart';
import 'global_data_service.dart';

part 'user_service.g.dart';

@riverpod
class UserService extends _$UserService {
  late UserRepository _repo;
  late GlobalDataDto _global;

  @override
  Future<LocalUserDto> build(String userId) async {
    _repo = ref.watch(userRepositoryProvider);
    _global = ref.watch(globalDataServiceProvider);
    final repo = ref.watch(userRepositoryProvider);
    final user = await repo.get(userId);
    if (user == null) {
      return await _updateRemote();
    } else {
      return LocalUserDto.fromEntity(user);
    }
  }

  Future<LocalUserDto> _updateRemote() async {
    final userApi = ref.watch(userApiProvider);
    final userDto = await userApi.getUser(this.userId);
    await _repo.put(this.userId,
        UserEntity.fromDto(userDto!, keepAlive: this.userId == _global.userId));
    final user = LocalUserDto.fromInfoDto(userDto);
    return user;
  }

  Future<void> updateRemote() async {
    state = AsyncData(await _updateRemote());
  }


  Future<String?> changeUser({
    String? password,
    String? email,
    Uint8List? profilePicture,
    String? description,
    String? username,
    int? selectedBatch
  }) async {
    try {
      final userApi = ref.watch(userApiProvider);
      final result = await userApi.updateUser(
          this.userId,
          UserUpdateDto(
              password: password,
              email: email,
              description: description,
              username: username,
              selectedBatch: selectedBatch,
              image: profilePicture == null ? null : base64Encode(
                  profilePicture))
      );
      final userEntity = await _repo.get(this.userId);
      if (result != null && userEntity != null) {
        final userDto = userEntity.copyUserWith(result, selectedBatch);
        await _repo.put(this.userId, userDto);
        state = AsyncData(LocalUserDto.fromEntity(userDto));
        if (profilePicture != null) {
          ref.read(userImageRepoProvider).overrideUrl(
              this.userId, result.profileImage!, true);
          ref.read(userImageSmallRepoProvider).overrideUrl(
              this.userId, result.profileImageSmall!, true);
        }
      }
      return null;
    } on ApiException catch (e) {
      return e.message ?? "Something unexpected happened";
    }
  }
}

@riverpod
Future<String?> userByIdUsername(Ref ref, String userId) async {
  return await ref.watch(userServiceProvider(userId).selectAsync((e) => e.username));
}

@riverpod
Future<int?> userByIdSelectedBatch(Ref ref, String userId) async {
  return await ref.watch(userServiceProvider(userId).selectAsync((e) => e.selectedBatch));
}

@riverpod
Future<String?> userByIdDescription(Ref ref, String userId) async {
  return await ref.watch(userServiceProvider(userId).selectAsync((e) => e.description));
}

@riverpod
Future<LocalUserDto> currentUser(Ref ref) async {
  final userId = ref.watch(userIdProvider);
  return await ref.watch(userServiceProvider(userId).future);
}


