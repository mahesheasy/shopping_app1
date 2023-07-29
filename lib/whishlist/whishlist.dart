
import 'package:flutter/material.dart';

class MyWhishList extends StatefulWidget {
  const MyWhishList({super.key});

  @override
  State<MyWhishList> createState() => _MyWhishListState();
}

class _MyWhishListState extends State<MyWhishList> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Mywishlist'),),
    );
  }
}