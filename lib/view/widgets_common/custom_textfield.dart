import 'package:flutter/material.dart';
import 'package:shopping_app/consts/colors.dart';
import 'package:shopping_app/consts/strings.dart';
import 'package:shopping_app/consts/styles.dart';

Widget customTextField({String? hint, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextFormField(
        controller: TextEditingController(),
        decoration: const InputDecoration( 
          hintStyle: TextStyle(fontFamily: semibold, color: textfieldGrey),
          hintText: emailHint,
          isDense: true,
          fillColor: lightGrey,
          filled: true,
          border: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: redColor),
            borderRadius: BorderRadius.vertical(top:Radius.circular(10),bottom: Radius.circular(10))
          ),
        ),
      ),
    ],
  );
}
