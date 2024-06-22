import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  const MyButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          child: Text(
            label,
            style: const TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontFamily: 'Thai',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
