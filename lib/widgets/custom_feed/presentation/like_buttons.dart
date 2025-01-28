import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/widgets/custom_feed/data/like_service.dart';
import 'package:buff_lisa/widgets/custom_feed/presentation/like_button_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:openapi/api.dart';

class LikeButtons extends ConsumerWidget {

  final String pinId;
  final String creatorId;

  const LikeButtons({super.key, required this.pinId, required this.creatorId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinLike = ref.watch(likeServiceProvider(pinId));
    final userId = ref.watch(globalDataServiceProvider).userId!;
    return Row(
          children: [
            LikeButtonAnimated(
              isLikedProvider: likeServiceProvider(pinId).select((e) => e.value?.likedByUser),
              isLiked: pinLike.valueOrNull?.likedByUser ?? false,
              likeBuilder: (isLiked) {
                return Icon(
                  Icons.favorite,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: 25,
                );
              },
              likeCount: pinLike.valueOrNull?.likeCount ?? 0,
              onTap: (isLiked) async {
                try {
                  if (isLiked) {
                    await ref.read(likeServiceProvider(pinId).notifier).addLike(creatorId, CreateLikeDto(userId: userId, like: false));
                  } else {
                    await ref.read(likeServiceProvider(pinId).notifier).addLike(creatorId, CreateLikeDto(userId: userId, like: true));
                  }
                } catch(e) {
                  return false;
                }
                return true;
              },
            ),
            const SizedBox(width: 10),
            LikeButtonAnimated(
              isLikedProvider: likeServiceProvider(pinId).select((e) => e.valueOrNull?.likedLocationByUser),
              isLiked: pinLike.valueOrNull?.likedLocationByUser ?? false,
              likeBuilder: (isLiked) {
                return Icon(
                  CupertinoIcons.location_solid,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: 25,
                );
              },
              likeCount: pinLike.valueOrNull?.likeLocationCount ?? 0,
              onTap: (isLiked) async {
                try {
                  if (isLiked) {
                    await ref.read(likeServiceProvider(pinId).notifier).addLike(creatorId, CreateLikeDto(userId: userId, likeLocation: false));
                  } else {
                    await ref.read(likeServiceProvider(pinId).notifier).addLike(creatorId, CreateLikeDto(userId: userId, likeLocation: true));
                  }
                } catch(e) {
                  return false;
                }
                return true;
              },
            ),
            const SizedBox(width: 10),
            LikeButtonAnimated(
              isLikedProvider: likeServiceProvider(pinId).select((e) => e.valueOrNull?.likedPhotographyByUser),
              isLiked: pinLike.valueOrNull?.likedPhotographyByUser ?? false,
              likeBuilder: (isLiked) {
                return Icon(
                  Icons.photo_camera,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: 25,
                );
              },
              likeCount: pinLike.valueOrNull?.likePhotographyCount ?? 0,
              onTap: (isLiked) async {
                try {
                  if (isLiked) {
                    await ref.read(likeServiceProvider(pinId).notifier).addLike(creatorId, CreateLikeDto(userId: userId, likePhotography: false));
                  } else {
                    await ref.read(likeServiceProvider(pinId).notifier).addLike(creatorId, CreateLikeDto(userId: userId, likePhotography: true));
                  }
                } catch(e) {
                  return false;
                }
                return true;
              },
            ),
            const SizedBox(width: 10),
            LikeButtonAnimated(
              isLikedProvider: likeServiceProvider(pinId).select((e) => e.valueOrNull?.likedArtByUser),
              isLiked: pinLike.valueOrNull?.likedArtByUser ?? false,
              likeBuilder: (isLiked) {
                return Icon(
                  Icons.brush,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: 25,
                );
              },
              likeCount: pinLike.valueOrNull?.likeArtCount ?? 0,
              onTap: (isLiked) async {
                try {
                  if (isLiked) {
                    await ref.read(likeServiceProvider(pinId).notifier).addLike(creatorId, CreateLikeDto(userId: userId, likeArt: false));
                  } else {
                    await ref.read(likeServiceProvider(pinId).notifier).addLike(creatorId, CreateLikeDto(userId: userId, likeArt: true));
                  }
                } catch(e) {
                  return false;
                }
                return true;
              },
            ),
          ],
        );
  }

}
