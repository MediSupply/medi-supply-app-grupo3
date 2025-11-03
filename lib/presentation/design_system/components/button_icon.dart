import 'package:flutter/material.dart';

import '../tokens/colors.dart';

class ButtonIcon extends StatelessWidget {
  final String? label;
  final VoidCallback onPressed;
  final bool isLoading;
  final Widget icon;
  const ButtonIcon({
    this.label,
    required this.onPressed,
    this.isLoading = false,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          label != null ? ColorsTokens.blue : ColorsTokens.background,
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(vertical: 32, horizontal: 32),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          if (label != null) ...[
            const SizedBox(width: 10),
            Text(
              label!,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
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
