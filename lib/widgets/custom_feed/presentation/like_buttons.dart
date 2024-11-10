import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:like_button/like_button.dart';
import 'package:openapi/api.dart';

import '../../../data/service/global_data_service.dart';
import '../data/like_service.dart';

class LikeButtons extends ConsumerWidget {

  final String pinId;

  const LikeButtons({super.key, required this.pinId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pinLike = ref.watch(pinLikeProvider(pinId));
    final userId = ref.watch(globalDataServiceProvider).userId!;
    return Row(
          children: [
            LikeButton(
              isLiked: pinLike.valueOrNull?.likedByUser ?? false,
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
            LikeButton(
              isLiked: pinLike.valueOrNull?.likedLocationByUser ?? false,
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
            LikeButton(
              isLiked: pinLike.valueOrNull?.likedPhotographyByUser ?? false,
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
            LikeButton(
              isLiked: pinLike.valueOrNull?.likedArtByUser ?? false,
              likeBuilder: (isLiked) {
                return Icon(
                  Icons.palette,
                  color: isLiked ? Colors.red : Colors.grey,
                  size: 30,
                );
              },
              likeCount: pinLike.valueOrNull?.likeArtCount ?? 0,
              onTap: (isLiked) async {
                final userId = ref.watch(globalDataServiceProvider).userId!;
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

}