// ignore: file_names
import 'package:flutter/material.dart';

class ResponsiveHelper {
  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < 900;
  
  static bool isTablet(BuildContext context) => 
      MediaQuery.of(context).size.width >= 900 && MediaQuery.of(context).size.width < 1200;
  
  static bool isLargeTablet(BuildContext context) => MediaQuery.of(context).size.width >= 1200;

  static double getWidth(BuildContext context) => MediaQuery.of(context).size.width;
  
  static double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

  // Responsive font sizes
  static double getResponsiveFontSize(BuildContext context, double baseSize) {
    double width = getWidth(context);
    if (width < 900) return baseSize * 0.8;
    if (width < 1200) return baseSize * 1.0;
    return baseSize * 1.2;
  }

  // Responsive padding
  static double getResponsivePadding(BuildContext context, double basePadding) {
    double width = getWidth(context);
    if (width < 900) return basePadding * 0.8;
    if (width < 1200) return basePadding * 1.0;
    return basePadding * 1.2;
  }

  // Grid columns based on device
  static int getGridColumns(BuildContext context) {
    if (isMobile(context)) return 2;
    if (isTablet(context)) return 2;
    return 3;
  }
}
