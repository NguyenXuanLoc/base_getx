import 'package:docsify/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final styleButtonWhite = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: const BorderSide(color: Colors.transparent),
    ),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(colorWhite),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? colorNeutralDark40
        : colorPrimaryBrand100;
  }),
  // shadowColor: MaterialStateProperty.all<Color>(colorNeutralDark20),
  overlayColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.pressed) ? colorNeutralDark5 : null;
  }),
  padding:
      MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoNormalTextBold),
);

final styleButtonPrimary = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
      side: const BorderSide(color: Colors.transparent),
    ),
  ),
  backgroundColor:
      MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return colorNeutralDark10;
    }
    return colorPrimaryBrand100;
  }),
  padding:
      MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoNormalTextBold),
);

final styleButtonOrange = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(24.0),
      side: const BorderSide(color: Colors.transparent),
    ),
  ),
  backgroundColor: MaterialStateProperty.all<Color>(colorPrimaryOrange100),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? colorNeutralDark40
        : colorPrimaryOrange100;
  }),
  // shadowColor: MaterialStateProperty.all<Color>(colorNeutralDark20),
  overlayColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.pressed)
        ? colorPrimaryOrange100
        : null;
  }),
  padding:
      MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoNormalTextBold),
);

final styleButtonWhiteBorder = ButtonStyle(
  shape: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: colorNeutralDark10, width: 2),
          )
        : RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
            side: const BorderSide(color: colorPrimaryBrand100, width: 2),
          );
  }),
  backgroundColor: MaterialStateProperty.all<Color>(colorWhite),
  foregroundColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.disabled)
        ? colorNeutralDark40
        : colorPrimaryBrand100;
  }),
  // shadowColor: MaterialStateProperty.all<Color>(colorNeutralDark20),
  overlayColor: MaterialStateProperty.resolveWith((states) {
    return states.contains(MaterialState.pressed) ? colorNeutralDark5 : null;
  }),
  padding:
      MaterialStateProperty.all<EdgeInsetsGeometry>(const EdgeInsets.all(12)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoNormalTextBold),
);

final styleButtonChip = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: const BorderSide(color: Colors.transparent),
    ),
  ),
  backgroundColor:
      MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return colorNeutralDark10;
    }
    return colorPrimaryBrand5;
  }),
  foregroundColor: MaterialStateProperty.all<Color>(colorNeutralDark100),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(horizontal: 12, vertical: 0)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoNormalTextBold),
);

final styleButtonChipActive = ButtonStyle(
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
      side: const BorderSide(color: colorPrimaryGreen100, width: 1.0),
    ),
  ),
  backgroundColor:
      MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
    if (states.contains(MaterialState.disabled)) {
      return colorNeutralDark10;
    }
    return colorPrimaryBrand5;
  }),
  foregroundColor: MaterialStateProperty.all<Color>(colorPrimaryBrand100),
  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.symmetric(horizontal: 12, vertical: 0)),
  textStyle: MaterialStateProperty.all<TextStyle>(typoNormalTextBold),
);

final styleTextField =
    typoMediumTextRegular.copyWith(color: colorNeutralDark100);

final styleTextFieldBold =
    typoNormalTextBold.copyWith(color: colorNeutralDark100);

final decorTextField = InputDecoration(
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorGreyBorder, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(7)),
  ),
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorGreyBorder, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(7)),
  ),
  errorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorGreyBorder, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(7)),
  ),
  focusedErrorBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: colorGreyBorder, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(7)),
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
  hintStyle: typoNormalTextRegular.copyWith(
      color: colorNeutralDark40.withOpacity(0.4)),
  errorStyle: typoSmallTextRegular.copyWith(color: colorSemanticRed100),
  counterText: '',
  fillColor: Colors.white,
  filled: true,
);

final decorScreenContainerSelect = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(20)),
  boxShadow: boxShadowSelectBox,
  color: colorWhite,
);

final decorScreenContainer = BoxDecoration(
  borderRadius: const BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
  ),
  boxShadow: boxShadow,
  color: colorWhite,
);

const decorScreenContainerNoShadow = BoxDecoration(
  borderRadius: BorderRadius.only(
    topRight: Radius.circular(20),
    topLeft: Radius.circular(20),
  ),
  color: colorWhite,
);

final decorContainerBox = BoxDecoration(
  borderRadius: const BorderRadius.all(Radius.circular(10)),
  boxShadow: boxShadow,
  color: colorWhite,
);

final boxShadow = [
  BoxShadow(
    color: colorBlack.withOpacity(0.05),
    spreadRadius: 0,
    blurRadius: 10,
    offset: const Offset(0, 0),
  ),
];

final boxShadowFocus = [
  BoxShadow(
    color: colorBlack.withOpacity(0.15),
    spreadRadius: 0,
    blurRadius: 40,
    offset: const Offset(0, 10),
  ),
];

final boxShadowSelectBox = [
  BoxShadow(
    color: colorBlack.withOpacity(0.2),
    spreadRadius: 0,
    blurRadius: 5,
    offset: const Offset(0, 4),
  ),
];

final typoHeading2 = GoogleFonts.josefinSans(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w800,
  fontSize: 48,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoHeading4 = GoogleFonts.josefinSans(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 32,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoHeading5 = GoogleFonts.josefinSans(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 24,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoHeading6 = GoogleFonts.josefinSans(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 20,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoSuperLargeTextBold = GoogleFonts.josefinSans(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 24,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoLargeTextBold = GoogleFonts.josefinSans(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 20,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoLargeTextRegular = GoogleFonts.josefinSans(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 20,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoMediumTextBold = GoogleFonts.josefinSans(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 18,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoMediumTextRegular = GoogleFonts.josefinSans(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 18,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoNormalTextBold = GoogleFonts.josefinSans(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 16,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoNormalTextBEBold = GoogleFonts.josefinSans(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 16,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoNormalTextRegular = GoogleFonts.josefinSans(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 16,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoNormalTextRegularNoSpacing = GoogleFonts.josefinSans(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 16,
  color: colorBlack,
);

final typoNormalBETextRegularNoSpacing = GoogleFonts.josefinSans(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w100,
  fontSize: 16,
  color: colorBlack,
);

final typoNormalTextThinRegular = GoogleFonts.josefinSans(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w200,
  fontSize: 16,
  color: colorBlack,
);

final typoSmallTextBold = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 14,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoSmallTextRegular = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoSmallTextRegularNoSpacing = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: colorBlack,
);

final typoExtraSmallTextBold = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 12,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoExtraSmallTextRegular = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 12,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoSuperSmallTextBold = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w700,
  fontSize: 10,
  letterSpacing: 1.02,
  color: colorBlack,
);

final typoSuperSmallTextRegular = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 10,
  letterSpacing: 1.02,
  color: colorBlack,
);
final typoregular14infor = GoogleFonts.beVietnamPro(
  color: colorInfo100,
  fontStyle: FontStyle.normal,
  fontSize: 14,
  letterSpacing: 1.02,
);
final typoregular14orange = GoogleFonts.beVietnamPro(
    fontStyle: FontStyle.normal,
    fontSize: 14,
    letterSpacing: 1.02,
    color: colorPrimaryOrange100);

final typoSuperSmallTextRegularNoSpacing = GoogleFonts.mulish(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 10,
  color: colorBlack,
);

final typoVietNamProH1 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize: 20,
  color: colorBlack,
);

final typoVietNamProRegular14 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w300,
  fontSize: 14,
  color: colorBlack,
);
final typoVietNamProRegular14four = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w400,
  fontSize: 14,
  color: colorBlack,
);
final typoVNregular14Green = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w300,
  color: colorSuccess100,
);

final typoVietNamProRegular16 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w300,
  fontSize: 16,
  color: colorBlack,
);
final typoVietNamProRegular16Orange = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w300,
  fontSize: 16,
  color: colorPrimaryOrange100,
  letterSpacing: 1.02,
);

final typoVietNamProRegular18 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w300,
  fontSize: 18,
  color: colorBlack,
);

final typoVietNamProRegular20 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w300,
  fontSize: 20,
  color: colorBlack,
);

final typoVietNamProBold12 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
  fontSize: 12,
  color: colorBlack,
);

final typoVietNamProBold11 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
  fontSize: 11,
  color: colorBlack,
);

final typoVietNamProBold18 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize: 18,
  color: colorBlack,
);
final typoVietNamProBold18orange = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize: 18,
  color: colorPrimaryOrange100,
);
final typoVietNamProBold20 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize: 20,
  color: colorBlack,
);

final typoVietNamProBold24 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize: 24,
  color: colorBlack,
);

final typoVietNamProBold36 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize: 36,
  color: colorBlack,
);

final typoVietNamProBold30 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize: 30,
  color: colorBlack,
);

final typoVietNamProBold16 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize: 16,
  color: colorBlack,
);
final typoVietNamProBold16Orange = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize: 16,
  color: colorPrimaryOrange100,
);

final typoVietNamProBold15 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize: 15,
  color: colorBlack,
);

final typoVietNamProBold14 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize: 14,
  color: colorBlack,
);

final typoVietNamProBold13 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w600,
  fontSize: 13,
  color: colorBlack,
);

final typoVietNamProRegular13 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w300,
  fontSize: 13,
  color: colorBlack,
);

final typoVietNamProRegular12 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w300,
  fontSize: 12,
  color: colorBlack,
);

final typoVietNamProRegular11 = GoogleFonts.beVietnamPro(
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.w300,
  fontSize: 11,
  color: colorBlack,
);
