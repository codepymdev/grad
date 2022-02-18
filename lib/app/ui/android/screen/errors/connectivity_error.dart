import 'package:flutter/material.dart';

class ConnectivityError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Container(
          child: Text("Connectivity Error"),
        ),
      ),
    );
  }
}
