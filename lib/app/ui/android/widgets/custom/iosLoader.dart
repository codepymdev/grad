import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IosLoader extends StatelessWidget {
  final Color color;
  const IosLoader({
    this.color = Colors.black,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoActivityIndicator(
        color: Colors.white,
      ),
    );
  }
}
