//svg image paths

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String logInImage = "assets/log_in.svg";
const String signUpImage = "assets/sign_in.svg";

//Theme data : colors
const Color accentColor = Color(0xff2AA1F6);
const Color mainColor = Color(0xff272A27);
const Color redColor = Color(0xffFF5454);

final themeData = ThemeData(
  textTheme: TextTheme(
    headline1: GoogleFonts.poppins(
      color: Colors.grey,
      fontSize: 21,
    ),
    headline2: GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
);
