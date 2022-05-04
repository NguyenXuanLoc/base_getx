import 'package:flutter/material.dart';

import '../theme/app_styles.dart';
import '../theme/colors.dart';

class AppTextButton extends StatelessWidget {
  final String? buttonTitle;
  final Color? color;
  final VoidCallback? onPressed;

  const AppTextButton({Key? key, this.buttonTitle, this.onPressed, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        buttonTitle ?? '',
        style:
            typoNormalTextBold.copyWith(color: color ?? colorPrimaryBrand100),
      ),
    );
  }
}
