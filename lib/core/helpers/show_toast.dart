import 'package:flutter/material.dart';

void showToast(
  BuildContext context, {
  required String message,
  Color? backgroundColor,
}) {
  // Get the overlay context
  OverlayState? overlayState = Overlay.of(context);
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (BuildContext context) {
      return Positioned(
        top: MediaQuery.of(context).size.height * 0.9,
        left: MediaQuery.of(context).size.width * 0.1,
        right: MediaQuery.of(context).size.width * 0.1,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 12.0,
            ),
            decoration: BoxDecoration(
              color: backgroundColor ?? Colors.black.withValues(alpha: 0.7),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Center(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
            ),
          ),
        ),
      );
    },
  );

  // Insert the toast into the overlay
  overlayState.insert(overlayEntry);

  // Remove the toast after a duration
  Future.delayed(const Duration(seconds: 5), () {
    overlayEntry.remove();
  });
}
