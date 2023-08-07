import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, String message) {
  final overlay = Overlay.of(context);

  OverlayEntry overlayEntry;
  overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
      bottom: MediaQuery.of(context).size.height *
          0.1, // Adjust the position as needed
      left: 15,
      right: 15,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.black, // Customize the background color
            borderRadius: BorderRadius.circular(8),
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 10,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
  );

  overlay.insert(overlayEntry);

  // Remove the SnackBar after some duration
  Future.delayed(const Duration(seconds: 2), () {
    overlayEntry.remove();
  });
}
