import 'package:flutter/material.dart';

// This is to avoid duplication and stepping on the standard fonts.
const Color purpleTextColor = const Color.fromRGBO(46, 10, 86, 1.0);

const Color accentBlue = const Color.fromRGBO(202, 221, 239, 1.0);
const Color backgroundBlue = const Color.fromRGBO(221, 233, 243, 1.0);
const Color mediumBlue = const Color.fromRGBO(54, 76, 114, 1.0);

final Color controlShadowColor = Color.fromRGBO(167, 170, 187, 0.9);

const TextStyle nameStyle = TextStyle(
  fontSize: 80.0,
  fontWeight: FontWeight.bold,
  color: purpleTextColor,
);

const TextStyle mainButtonStyle = TextStyle(
  fontSize: 32.0,
  fontWeight: FontWeight.w800,
  color: purpleTextColor,
);

const TextStyle buttonLabelStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w500,
  color: purpleTextColor,
);

const TextStyle welcomeStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w500,
  color: purpleTextColor,
);

const TextStyle earningsLabelStyle = TextStyle(
  fontSize: 12.0,
  fontWeight: FontWeight.w500,
  color: purpleTextColor,
);

const TextStyle earningsValueStyle = TextStyle(
  fontSize: 48.0,
  fontWeight: FontWeight.w700,
  color: purpleTextColor,
);

// Style used for the headers of the secondary pages
const TextStyle titleStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w700,
  letterSpacing: 2,
  color: mediumBlue,
);

// Style used for action items on the secondary pages
const TextStyle actionStyle = TextStyle(
  fontSize: 14.0,
  fontWeight: FontWeight.w500,
  color: mediumBlue,
);
