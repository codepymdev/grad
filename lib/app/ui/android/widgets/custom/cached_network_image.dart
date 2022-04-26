import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:grad/app/ui/android/widgets/custom/default_avatar.dart';

class CustomNetworkImage extends StatelessWidget {
  final String? url;
  final double? wd;
  final double? ht;
  CustomNetworkImage({
    required this.url,
    this.ht = 50,
    this.wd = 50,
  });
  @override
  Widget build(BuildContext context) {
    if (url != "") {
      return CachedNetworkImage(
        imageUrl: "$url",
        width: wd,
        height: ht,
        fit: BoxFit.cover,
        progressIndicatorBuilder: (context, url, downloadProgress) => Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            shape: BoxShape.circle,
          ),
        ),
        errorWidget: (context, url, error) => new Icon(Icons.error),
      );
    } else {
      return DefaultAvatar(
        wd: wd,
        ht: ht,
      );
    }
  }
}
