import 'package:flutter/material.dart';
import 'package:shopping_app/consts/images.dart';

Widget bgWidget({Widget? child}){
  return Container(
    decoration:const BoxDecoration(image: DecorationImage(image: AssetImage(imgBackgd),fit: BoxFit.fill)),
    child:child ,
  );
}