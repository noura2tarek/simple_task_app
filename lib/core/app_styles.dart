import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_task_app/core/app_colors.dart';

String fontFamily = GoogleFonts.poppins().fontFamily ?? 'Poppins';

abstract class AppStyles {
  //------------------Regular
  // Body
  static TextStyle styleRegular10(
    BuildContext context, {
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      height: 1.35,
      color: color ?? AppColors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      decoration: decoration ?? TextDecoration.none,
    );
  }
  //------------------Medium
  //labels medium, semi bold

  static TextStyle styleMedium14(BuildContext context, {Color? color}) {
    return TextStyle(
      color: color ?? AppColors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
    );
  }

  //--------------Semi Bold

  static TextStyle styleSemiBold16(BuildContext context, {Color? color}) {
    return TextStyle(
      color: color ?? AppColors.white,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle styleSemiBold9(BuildContext context, {Color? color}) {
    return TextStyle(
      color: color ?? AppColors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 9),
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
    );
  }
  //----------------------- Bold ------
  // Headlines

  static TextStyle styleBold12(
    BuildContext context, {
    Color? color,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      color: color ?? AppColors.black,
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: fontFamily,
      fontWeight: FontWeight.w700,
      decoration: decoration ?? TextDecoration.none,
    );
  }
}

//---------------------------------------
// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    // 500 --599
    // mobile
    return width / 400;
  } else if (width < 900) {
    //800
    // tablet
    return width / 700;
  } else {
    // desktop
    return width / 1000;
  }
}

//
double calculateResPadding(BuildContext context) {
  double screenWidth = MediaQuery.of(context).size.width;
  if (screenWidth < 600) {
    return 40;
  } else if (screenWidth < 900 && screenWidth >= 600) {
    return 10;
  } else {
    return 11;
  }
}
