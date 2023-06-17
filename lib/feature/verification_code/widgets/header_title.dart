import 'package:flutter/material.dart';

class HeaderTitleWidget extends StatelessWidget {
  const HeaderTitleWidget({Key? key, required this.title, required this.des})
      : super(key: key);
  final String title;
  final String des;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        Text(
          des,
          style: const TextStyle(color: Colors.black54, fontSize: 13),
        ),
      ],
    );
  }
}
