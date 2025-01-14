
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class RoundCachedImage extends StatelessWidget {
  const RoundCachedImage( {super.key, required this.url, required this.size,});

  final String url;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size * 2,
      child: ClipOval(
        child: CachedNetworkImage(imageUrl: url, fit: BoxFit.cover,),
      ),
    );
  }


}