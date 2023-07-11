import 'package:flutter/material.dart';

const textformfielddeco = InputDecoration(
  hintText: "Enter Email",
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 2.0,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 227, 139, 139),
      width: 2.0,
    ),
  ),
);
