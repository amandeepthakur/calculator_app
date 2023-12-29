import 'dart:math';

import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;

  CalculatorButton({required this.text, this.onPressed });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
       foregroundColor: Colors.white,
        backgroundColor: Colors.blue[500],
        padding: const EdgeInsets.all(30.0),
        shape: const CircleBorder(),
        textStyle: const TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.w500,
        ),
      ),
      child: Text(text)
    );
  }
}
