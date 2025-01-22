
import 'package:buff_lisa/data/config/openapi_config.dart';
import 'package:buff_lisa/data/entity/pin_like_entity.dart';
import 'package:buff_lisa/data/repository/pin_repository.dart';
import 'package:buff_lisa/data/service/like_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'like_service.g.dart';

@riverpod
class LikeService extends _$LikeService {
  @override
  Future<PinLikeDto> build(String pinId) async {
    final pinLikeRepo = ref.watch(pinLikeRepositoryProvider);
    final pinLike = await pinLikeRepo.get(pinId);
    if (pinLike != null) {
      return pinLike.toDto();
    } else {
      final pinLikeDto = await _fetchLike(pinId);
      pinLikeRepo.put(pinId, PinLikeEntity.fromDto(pinLikeDto));
      return pinLikeDto;
    }
  }


  Future<PinLikeDto> _fetchLike(String pinId) async {
    try {
      final likeApi = ref.watch(likeApiProvider);
      final like = await likeApi.getPinLikes(pinId);
      return like!;
    } catch(e) {
      if (kDebugMode) print(e);
      return PinLikeDto();
    }
  }

  Future<void> addLike(String creatorId, CreateLikeDto createLikeDto) async {
    final pinLikeRepo = ref.read(pinLikeRepositoryProvider);
    final currentState = state.value!;
    final pinDto = PinLikeDto(
      likePhotographyCount: _likeUpdate(createLikeDto.likePhotography, currentState.likedPhotographyByUser, currentState.likePhotographyCount ?? 0),
      likeArtCount: _likeUpdate(createLikeDto.likeArt, currentState.likedArtByUser,currentState.likeArtCount ?? 0),
      likeLocationCount: _likeUpdate(createLikeDto.likeLocation, currentState.likedLocationByUser, currentState.likeLocationCount ?? 0),
      likeCount: _likeUpdate(createLikeDto.like, currentState.likedByUser, currentState.likeCount ?? 0),
      likedArtByUser: createLikeDto.likeArt ?? currentState.likedArtByUser ?? false,
      likedPhotographyByUser: createLikeDto.likePhotography ?? currentState.likedPhotographyByUser ?? false,
      likedLocationByUser: createLikeDto.likeLocation ?? currentState.likedLocationByUser ?? false,
      likedByUser: createLikeDto.like ?? currentState.likedByUser ?? false
    );
    state = AsyncData(pinDto);
    pinLikeRepo.put(pinId, PinLikeEntity.fromDto(pinDto));
    try {
      final likeApi = ref.watch(likeApiProvider);
      await likeApi.createOrUpdateLike(pinId, createLikeDto);
      ref.read(userLikeServiceProvider(creatorId).notifier).updateLikeCount(createLikeDto);
    } on ApiException catch (_) {
      state = AsyncData(currentState);
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