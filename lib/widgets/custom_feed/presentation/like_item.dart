import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LikeItem extends StatelessWidget {
  final IconData iconLiked;
  final IconData iconNotLiked;
  final int count;
  final bool liked;

  LikeItem({required this.iconLiked, required this.iconNotLiked, required this.count, required this.liked});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          liked ? iconLiked : iconNotLiked,
          color: liked ? Colors.red : Colors.grey,
          size: 30,
        ),
        SizedBox(height: 4),
        Text(
          count.toString(),
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}