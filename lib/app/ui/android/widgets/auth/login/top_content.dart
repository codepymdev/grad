import 'package:flutter/material.dart';
import 'package:Grad/app/ui/android/widgets/custom/cached_network_image.dart';

class TopContent extends StatelessWidget {
  const TopContent({
    Key? key,
    required this.logo,
    required this.name,
  }) : super(key: key);

  final String logo;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomNetworkImage(
              url: "$logo",
              wd: 40,
              ht: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "$name",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Let's sign you in.",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 40,
            color: Color.fromARGB(255, 49, 47, 47),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Welcome back",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: Color.fromARGB(255, 88, 87, 87),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "You've have missed!",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 28,
            color: Color.fromARGB(255, 88, 87, 87),
          ),
        ),
      ],
    );
  }
}
