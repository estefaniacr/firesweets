import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  hintStyle: TextStyle(fontSize: 13, color: Colors.grey),
    contentPadding: EdgeInsets.all(15.0),
    fillColor: Color(0xFFFAFAFA),
    filled: true,
    enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFEEEEEE), width: 2.0)),
    focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFF3E5F5), width: 2.0)));
