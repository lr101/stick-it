
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/service/user_service.dart';
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

  Future<void> addLike(String pinId, String creatorId, CreateLikeDto createLikeDto) async {
    final currentLikes = state[pinId];
    state[pinId] = PinLikeDto(
      likePhotographyCount: _likeUpdate(createLikeDto.likePhotography,state[pinId]?.likedPhotographyByUser, state[pinId]?.likePhotographyCount ?? 0),
      likeArtCount: _likeUpdate(createLikeDto.likeArt, state[pinId]?.likedArtByUser,state[pinId]?.likeArtCount ?? 0),
      likeLocationCount: _likeUpdate(createLikeDto.likeLocation, state[pinId]?.likedLocationByUser, state[pinId]?.likeLocationCount ?? 0),
      likeCount: _likeUpdate(createLikeDto.like, state[pinId]?.likedByUser, state[pinId]?.likeCount ?? 0),
      likedArtByUser: createLikeDto.likeArt ?? state[pinId]?.likedArtByUser ?? false,
      likedPhotographyByUser: createLikeDto.likePhotography ?? state[pinId]?.likedPhotographyByUser ?? false,
      likedLocationByUser: createLikeDto.likeLocation ?? state[pinId]?.likedLocationByUser ?? false,
      likedByUser: createLikeDto.like ?? state[pinId]?.likedByUser ?? false
    );
    ref.notifyListeners();
    try {
      final likeApi = ref.watch(likeApiProvider);
      await likeApi.createOrUpdateLike(pinId, createLikeDto);
      ref.watch(userServiceProvider.notifier).updateLikeCount(creatorId, createLikeDto);
    } on ApiException catch (_) {
      state[pinId] = currentLikes ?? PinLikeDto();
      ref.notifyListeners();
    }
  }

  int _likeUpdate(bool? like, bool? likeCurrent, int current) {
    if (like == true && likeCurrent == false) {
      return current + 1;
    } else if (like == false && likeCurrent == true) {
      return current -1;
    } else {
      return current;
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