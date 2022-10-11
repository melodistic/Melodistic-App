import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF101010);

const Color kSecondaryColor = Color(0xFFFA8B44);

const Color kGrayScaleColorBlack = Color(0xFF000000);
const Color kGrayScaleColor800 = Color(0xFF424242);
const Color kGrayScaleColor700 = Color(0xFF616161);
const Color kGrayScaleColor600 = Color(0xFF858D93);
const Color kGrayScaleColor500 = Color(0xFFA9B5BC);
const Color kGrayScaleColor400 = Color(0xFFCAD0D4);
const Color kGrayScaleColor300 = Color(0xFFE0E0E0);
const Color kGrayScaleColor200 = Color(0xFFEDF2F6);
const Color kGrayScaleColor100 = Color(0xFFF5F5F5);
const Color kGrayScaleColorWhite = Color(0xFFFFFFFF);
const Color kTransparent = Color(0x00000000);

const Color kSuccessColor = Color(0xFF55BD6C);
const Color kWarningColor = Color(0xFFF9B54F);
const Color kErrorColor = Color(0xFFFA5A5A);

const Color kGradientBlackStart = Color(0xFF585858);
const LinearGradient kGradientBlack = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: <Color>[
    kGradientBlackStart,
    kGrayScaleColorBlack,
  ],
);
