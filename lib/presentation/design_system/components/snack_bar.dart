import 'dart:async';

import 'package:flutter/material.dart';

abstract class Snackbar {
  Snackbar({required this.context, required this.label, this.onTap});

  BuildContext context;

  OverlayEntry? entry;

  String label;

  Widget? iconDecoration;

  Widget? iconAction;

  void Function()? onTap;

  void onComplete(BuildContext context, OverlayEntry entry);

  OverlayEntry show();
}

class ErrorSnackbar extends Snackbar {
  ErrorSnackbar({required super.context, required super.label}) {
    iconDecoration = const Icon(Icons.error, color: Colors.white);
    iconAction = const Icon(Icons.close, color: Colors.white);
    entry = show();
    Overlay.of(context).insert(entry!);
    onComplete(context, entry!);
  }

  @override
  void onComplete(BuildContext context, OverlayEntry entry) {
    Timer(const Duration(seconds: 3), () => _dispose(entry));
  }

  @override
  OverlayEntry show() {
    return OverlayEntry(
      builder: (context) => Positioned(
        bottom: 64,
        right: 0,
        left: 0,
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () => _dispose(entry!),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.all(8),
                      child: iconDecoration,
                    ),
                    Container(
                      color: Colors.red.withAlpha(80),
                      height: double.infinity,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          spacing: 8,
                          children: [
                            Expanded(
                              child: Text(
                                label,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 8, child: iconAction),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _dispose(OverlayEntry entry) {
    if (entry.mounted) {
      entry.remove();
    }
  }
}

class SuccessSnackbar extends Snackbar {
  SuccessSnackbar({required super.context, required super.label}) {
    iconDecoration = const Icon(Icons.check, color: Colors.white);
    iconAction = const Icon(Icons.close, color: Colors.white);
    entry = show();
    Overlay.of(context).insert(entry!);
    onComplete(context, entry!);
  }

  @override
  void onComplete(BuildContext context, OverlayEntry entry) {
    Timer(const Duration(seconds: 3), () => _dispose(entry));
  }

  @override
  OverlayEntry show() {
    return OverlayEntry(
      builder: (context) => Positioned(
        bottom: 64,
        right: 0,
        left: 0,
        child: Material(
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () => _dispose(entry!),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.all(8),
                      child: iconDecoration,
                    ),
                    Container(
                      color: Colors.green.withAlpha(80),
                      height: double.infinity,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          spacing: 8,
                          children: [
                            Expanded(
                              child: Text(
                                label,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(width: 8, child: iconAction),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _dispose(OverlayEntry entry) {
    if (entry.mounted) {
      entry.remove();
    }
  }
}
