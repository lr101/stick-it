
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'like_service.g.dart';

@Riverpod(keepAlive: true)
class LikeService extends _$LikeService {
  @override
  Map<String, PinLikeDto> build() => {};


  Future<PinLikeDto> fetchLike(String pinId) async {
    final likeApi = ref.watch(likeApiProvider);
    final like = await likeApi.getPinLikes(pinId);
    if (like != null) {
      state[pinId] = like;
      ref.notifyListeners();
      return like;
    } else {
      throw ApiException(400, "Likes could not be fetched");
    }
  }

  Future<void> addLike(String pinId, CreateLikeDto createLikeDto) async {
    final likeApi = ref.watch(likeApiProvider);
    final like = await likeApi.createOrUpdateLike(pinId, createLikeDto);
    if (like != null) {
      state[pinId] = like;
      ref.notifyListeners();
    }
  }
}

@riverpod
Future<PinLikeDto> pinLike(Ref ref, String pinId) async {
  final pinLike = ref.watch(likeServiceProvider.select((e) => e[pinId]));
  if (pinLike == null) {
    return await ref.read(likeServiceProvider.notifier).fetchLike(pinId);
  } else {
    return pinLike;
  }
}