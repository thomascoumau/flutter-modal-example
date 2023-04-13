import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
            backgroundColor: MaterialStateProperty.all(Colors.white),
            side: MaterialStateProperty.all(const BorderSide(
                color: Color.fromARGB(255, 39, 52, 58), width: 2))),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(color: Color.fromARGB(255, 39, 52, 58)),
        ));
  }
}
