import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosLoader extends StatelessWidget {
  final Color color;
  IosLoader({
    Key? key,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: color,
      ),
    );
  }
}
