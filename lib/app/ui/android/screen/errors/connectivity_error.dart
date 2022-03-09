import 'package:flutter/material.dart';

class ConnectivityError extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            child: Text("Connectivity Error"),
          ),
        ),
      ),
    );
  }
}
