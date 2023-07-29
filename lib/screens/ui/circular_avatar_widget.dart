import 'package:flutter/material.dart';
import 'package:shopping_app/data/scrolling_images.dart';

class CircularAvatar_widget extends StatelessWidget {
  const CircularAvatar_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        SizedBox(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: Circular_avatar.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          NetworkImage(Circular_avatar[index]['imageUrl']),
                    ),
                     const SizedBox(height: 5),
                Text(
                  Circular_avatar[index]['subtitle'],
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
                  ],
                ),
               
              );
            },
          ),
        ),
      ],
    );
  }
}
