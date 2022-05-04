import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String title;
  final TextStyle? textStyle;
  final Decoration? decoration;
  final VoidCallback onPress;
  final Color? backgroundColor;
  final double? borderRadius;
  final BorderSide? side;
  final EdgeInsets? padding;

  const AppButton({
    Key? key,
    required this.title,
    required this.onPress,
    this.height,
    this.width,
    this.textStyle,
    this.decoration,
    this.backgroundColor,
    this.borderRadius,
    this.side,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: padding,
      height: height,
      minWidth: width,
      color: backgroundColor,
      shape: RoundedRectangleBorder(
          side: side ?? const BorderSide(color: colorWhite),
          borderRadius: BorderRadius.circular(borderRadius ?? 0)),
      child: Text(
        title,
        textScaleFactor: 1,
        style: textStyle ?? typoNormalTextRegular,
      ),
      onPressed: () => onPress.call(),
    );
  }
}
