import 'package:counter/app/helpers/color-helper.dart';
import 'package:flutter/material.dart';

class TextStyleHelper {
  // Brand Title
  static TextStyle brandTitle(double fontSize) => TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        color: ColorHelper.primaryPurple,
        letterSpacing: 2.0,
      );

  // Order Number
  static TextStyle orderNumber(double fontSize) => TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w900,
        color: ColorHelper.primaryPurple,
        letterSpacing: 1.0,
      );

  // Order Label
  static TextStyle orderLabel(double fontSize) => TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: ColorHelper.secondaryText,
      );

  // Price
  static TextStyle price(double fontSize) => TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: ColorHelper.secondaryText,
      );

  // Cart Title
  static TextStyle cartTitle(double fontSize) => TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: ColorHelper.primaryText,
      );

  // Product Name
  static TextStyle productName(double fontSize) => TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: ColorHelper.primaryText,
      );

  // Product Weight
  static TextStyle productWeight(double fontSize) => TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w400,
        color: ColorHelper.secondaryText,
      );

  // Product Price
  static TextStyle productPrice(double fontSize) => TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: ColorHelper.whiteText,
      );

  // Button Text
  static TextStyle buttonText(double fontSize) => TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: ColorHelper.whiteText,
      );
}
