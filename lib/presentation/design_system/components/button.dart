import 'package:flutter/material.dart';

import '../tokens/colors.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool isLoading;
  const Button({
    required this.label,
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(ColorsTokens.blue),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
          if (isLoading) const SizedBox(width: 10),
          if (isLoading)
            const CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
            ),
        ],
      ),
    );
  }
}
