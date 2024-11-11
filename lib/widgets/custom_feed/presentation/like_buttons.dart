import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';

import '../../../data/service/global_data_service.dart';
import '../data/like_service.dart';
import 'like_button_animated.dart';

class LikeButtons extends ConsumerWidget {

  final String pinId;

  const LikeButtons({super.key, required this.pinId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinLike = ref.watch(pinLikeProvider(pinId));
    final userId = ref.watch(globalDataServiceProvider).userId!;
    return Row(
          children: [
            LikeButtonAnimated(
              isLikedProvider: pinLikeProvider(pinId).select((e) => e.valueOrNull?.likedByUser ?? false),
              isLiked: pinLike.valueOrNull?.likedByUser ?? false,
              postFrameCallback: (state) => addLikeState(state, pinLike.valueOrNull?.likedByUser ?? false),
              likeBuilder: (isLiked) {
                return Icon(
                  Icons.favorite,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: 30,
                );
              },
              likeCount: pinLike.valueOrNull?.likeCount ?? 0,
              onTap: (isLiked) async {
                try {
                  if (isLiked) {
                    await ref.read(likeServiceProvider.notifier).addLike(pinId, CreateLikeDto(userId: userId, like: false));
                  } else {
                    await ref.read(likeServiceProvider.notifier).addLike(pinId, CreateLikeDto(userId: userId, like: true));
                  }
                } catch(e) {
                  return false;
                }
                return true;
              },
            ),
            SizedBox(width: 10),
            LikeButtonAnimated(
              isLikedProvider: pinLikeProvider(pinId).select((e) => e.valueOrNull?.likedLocationByUser ?? false),
              isLiked: pinLike.valueOrNull?.likedLocationByUser ?? false,
              postFrameCallback: (state) => addLikeState(state, pinLike.valueOrNull?.likedLocationByUser ?? false),
              likeBuilder: (isLiked) {
                return Icon(
                  CupertinoIcons.location_solid,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: 30,
                );
              },
              likeCount: pinLike.valueOrNull?.likeLocationCount ?? 0,
              onTap: (isLiked) async {
                try {
                  if (isLiked) {
                    await ref.read(likeServiceProvider.notifier).addLike(pinId, CreateLikeDto(userId: userId, likeLocation: false));
                  } else {
                    await ref.read(likeServiceProvider.notifier).addLike(pinId, CreateLikeDto(userId: userId, likeLocation: true));
                  }
                } catch(e) {
                  return false;
                }
                return true;
              },
            ),
            SizedBox(width: 10),
            LikeButtonAnimated(
              isLikedProvider: pinLikeProvider(pinId).select((e) => e.valueOrNull?.likedPhotographyByUser ?? false),
              isLiked: pinLike.valueOrNull?.likedPhotographyByUser ?? false,
              postFrameCallback: (state) => addLikeState(state, pinLike.valueOrNull?.likedPhotographyByUser ?? false),
              likeBuilder: (isLiked) {
                return Icon(
                  Icons.photo_camera,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: 30,
                );
              },
              likeCount: pinLike.valueOrNull?.likePhotographyCount ?? 0,
              onTap: (isLiked) async {
                try {
                  if (isLiked) {
                    await ref.read(likeServiceProvider.notifier).addLike(pinId, CreateLikeDto(userId: userId, likePhotography: false));
                  } else {
                    await ref.read(likeServiceProvider.notifier).addLike(pinId, CreateLikeDto(userId: userId, likePhotography: true));
                  }
                } catch(e) {
                  return false;
                }
                return true;
              },
            ),
            SizedBox(width: 10),
            LikeButtonAnimated(
              isLikedProvider: pinLikeProvider(pinId).select((e) => e.valueOrNull?.likedArtByUser ?? false),
              isLiked: pinLike.valueOrNull?.likedArtByUser ?? false,
              postFrameCallback: (state) => addLikeState(state, pinLike.valueOrNull?.likedArtByUser ?? false),
              likeBuilder: (isLiked) {
                return Icon(
                  Icons.palette,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: 30,
                );
              },
              likeCount: pinLike.valueOrNull?.likeArtCount ?? 0,
              onTap: (isLiked) async {
                try {
                  if (isLiked) {
                    await ref.read(likeServiceProvider.notifier).addLike(pinId, CreateLikeDto(userId: userId, likeArt: false));
                  } else {
                    await ref.read(likeServiceProvider.notifier).addLike(pinId, CreateLikeDto(userId: userId, likeArt: true));
                  }
                } catch(e) {
                  return false;
                }
                return true;
              },
            )
          ],
        );
  }

  void addLikeState(LikeButtonAnimatedState state, bool isLiked) {
    if (isLiked) {
      state.controller!.reset();
      state.controller!.forward();
    }
  }

}