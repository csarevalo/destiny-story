import 'package:flutter/material.dart';

class SelectPathButton extends StatelessWidget {
  const SelectPathButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
  });

  final void Function() onPressed;
  final String text;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
        vertical: 8.0,
      ),
      child: FilledButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
