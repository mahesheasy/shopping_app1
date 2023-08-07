import 'package:flutter/material.dart';
import 'package:shopping_app/consts/consts.dart';

void showGenderBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
    ),
    builder: (context) {
      return Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            height: 130,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              color: Colors.black,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    // Handle male gender selection.
                    Navigator.pop(context); // Close the bottom sheet.
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: const Color.fromARGB(255, 84, 86, 89),
                        child: Image.asset(
                          menImage,
                          width: 24,
                          height: 24,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Men',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          womenImage,
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Women',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Handle male gender selection.
                    Navigator.pop(context); // Close the bottom sheet.
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          boyImage,
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Boy',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Handle female gender selection.
                    Navigator.pop(context); // Close the bottom sheet.
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: Colors.pink,
                        child: Image.asset(
                          girlImage,
                          width: 24,
                          height: 24,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Girl',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 8,
            right: 8,
            child: InkWell(
              onTap: () {
                Navigator.pop(context); // Close the bottom sheet.
              },
              child: const Icon(
                Icons.close,
                color: Colors.red,
                size: 24,
              ),
            ),
          ),
        ],
      );
    },
  );
}
