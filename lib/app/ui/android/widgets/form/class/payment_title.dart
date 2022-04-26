import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PaymentTitle extends StatelessWidget {
  TextEditingController c;
  final bool edit;
  final val;
  PaymentTitle({
    required this.c,
    this.edit = false,
    this.val = "",
  });
  @override
  Widget build(BuildContext context) {
    ///edit
    if (edit)
      c = TextEditingController(
        text: val,
      );
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      child: TextField(
        controller: c,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[350]!,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey[350]!,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue[200]!,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          labelText: 'Payment Title',
        ),
      ),
    );
  }
}
