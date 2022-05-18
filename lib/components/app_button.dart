import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:docsify/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  final bool disable;
  final ShapeBorder? shapeBorder;
  final MaterialTapTargetSize? materialTapTargetSize;

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
    this.disable = true,
    this.shapeBorder,
    this.materialTapTargetSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      animationDuration: Duration(seconds: 0),
      splashColor: disable ? Colors.transparent : null,
      highlightColor: disable ? Colors.transparent : null,
      enableFeedback: false,
      materialTapTargetSize: materialTapTargetSize,
      padding: padding,
      height: height,
      minWidth: width,
      color: backgroundColor,
      shape: shapeBorder ??
          RoundedRectangleBorder(
              side: side ?? const BorderSide(color: colorWhite),
              borderRadius: BorderRadius.circular(borderRadius ?? 0)),
      child: Text(
        title,
        textScaleFactor: 1,
        style: textStyle ?? typoNormalTextRegular,
      ),
      onPressed: () {
        Utils.hideKeyboard(context);
        onPress.call();
      },
    );
  }
}
