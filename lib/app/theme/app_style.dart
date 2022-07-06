import 'package:flutter/material.dart';

class AppStyle {
  // ? Buttom style
  static ButtonStyle primaryButton = ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      const Color.fromARGB(255, 32, 113, 122),
    ),
    minimumSize: MaterialStateProperty.all<Size>(const Size(200, 50)),
  );

  // ? Text Style
  static const TextStyle textBody =
      TextStyle(color: Color.fromARGB(255, 190, 190, 190));

  static const TextStyle textPrimary = TextStyle(
    color: Color.fromARGB(255, 255, 255, 255),
    fontWeight: FontWeight.w600,
  );
}
