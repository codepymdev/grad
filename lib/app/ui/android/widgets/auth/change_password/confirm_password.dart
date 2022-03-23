import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class ConfirmPassword extends StatelessWidget {
  final c, c2;
  ConfirmPassword({
    required this.c,
    required this.c2,
  });
  @override
  Widget build(BuildContext context) {
    return Obx(() => TextField(
          controller: c2,
          keyboardType: TextInputType.visiblePassword,
          obscureText: c.toggleOff2.value,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[350]!,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey[350]!,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue[200]!,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
            labelText: '',
            suffix: c.toggleOff2.value
                ? GestureDetector(
                    onTap: () => c.toggle2(),
                    child: Icon(FeatherIcons.eyeOff),
                  )
                : GestureDetector(
                    onTap: () => c.toggle2(),
                    child: Icon(
                      FeatherIcons.eye,
                    ),
                  ),
          ),
        ));
  }
}
