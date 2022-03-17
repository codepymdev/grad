import 'package:flutter/material.dart';
import 'package:grad/app/core/constants/asset_path.dart';

class DefaultAvatar extends StatelessWidget {
  final wd;
  final ht;
  DefaultAvatar({
    required this.wd,
    required this.ht,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      DEFAULT_AVATAR,
      width: wd,
      height: ht,
      fit: BoxFit.cover,
    );
  }
}
