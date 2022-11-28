import 'package:flutter/material.dart';

abstract class StyleDecorationsInput {
  //* esta clase va tener propiedades estaticas

  static InputDecoration loginInputDecoration({ required String hintextArgs, required String labelTextArgs, IconData? prefixIconArgs}) {
    return InputDecoration(
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.green, width: 1)
      ),
      hintText: hintextArgs,
      labelText: labelTextArgs,
      labelStyle: const TextStyle(color: Colors.grey),
      prefixIcon: prefixIconArgs != null ? Icon(prefixIconArgs, color: Colors.green): null
    );
  }
}