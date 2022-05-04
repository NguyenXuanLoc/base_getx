import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_styles.dart';
import '../theme/colors.dart';

class AppCheckBox extends StatelessWidget {
  const AppCheckBox(
      {required this.value,
      required this.onChanged,
      this.avatar = "",
      this.label,
      this.isOnLeft = true,
      Key? key})
      : super(key: key);
  final bool value;
  final String? avatar;
  final String? label;
  final bool isOnLeft;
  final void Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!value),
      child: Row(
        children: [
          if (isOnLeft) ...[
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: value ? colorPrimaryBrand100 : colorNeutralDark40,
                    width: 2.w),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: value ? colorPrimaryBrand100 : colorWhite,
                ),
                width: 16.w,
                height: 16.h,
                margin: const EdgeInsets.all(2),
              ),
            ),
          ],
          Visibility(
              visible: avatar!.isNotEmpty, child: Image.asset(avatar ?? '')),
          SizedBox(
            width: 8.w,
          ),
          Text(
            label ?? '',
            style: typoNormalTextRegularNoSpacing,
          ),
          if (!isOnLeft) ...[
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                    color: value ? colorPrimaryBrand100 : colorNeutralDark40,
                    width: 2.w),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: value ? colorPrimaryBrand100 : colorWhite,
                ),
                width: 16.w,
                height: 16.h,
                margin: const EdgeInsets.all(2),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
