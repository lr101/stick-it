
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

class RoundCachedImage extends StatelessWidget {
  const RoundCachedImage( {Key? key, required this.url, required this.size,}) : super(key: key);

  final String url;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size * 2,
      child: ClipOval(
        child: CachedNetworkImage(imageUrl: this.url, fit: BoxFit.cover,),
      ),
    );
  }


}