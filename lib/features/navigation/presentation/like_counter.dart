import 'package:buff_lisa/data/repository/global_data_repository.dart';
import 'package:buff_lisa/data/service/global_data_service.dart';
import 'package:buff_lisa/data/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LikeCounter extends ConsumerStatefulWidget {
  @override
  ConsumerState<LikeCounter> createState() => _LikeCounterState();
}

class _LikeCounterState extends ConsumerState<LikeCounter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true); // Makes the animation loop
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final likes = ref.watch(
        userLikesByIdProvider(ref.watch(globalDataServiceProvider).userId!));
    final totalPoints = likes.whenOrNull(
            data: (data) => (data.likeCount * 5 +
                    data.likePhotographyCount * 7 +
                    data.likeLocationCount * 6 +
                    data.likeArtCount * 8)
                .toString()) ??
        "---";
    return Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color:  Colors.grey.withOpacity(0.4),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ScaleTransition(
                scale: Tween<double>(begin: 1.0, end: 1.2).animate(
                  CurvedAnimation(
                    parent: _controller,
                    curve: Curves.easeInOut,
                  ),
                ),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 24,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                '$totalPoints',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey.shade800,
                ),
              ),
            ],
          ),
        ));
  }
}
