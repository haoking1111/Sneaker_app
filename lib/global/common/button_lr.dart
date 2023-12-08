import 'package:flutter/material.dart';

Widget buttonLR(Function() nameFuntion, String nameButton) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: GestureDetector(
      onTap: nameFuntion,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(12)
        ),
        child: Center(
          child: Text(
            nameButton,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18
            ),
          ),
        ),
      ),
    ),
  );
}