import 'package:docsify/theme/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

import '../theme/colors.dart';

class AppReadMoreWidget extends StatelessWidget {
  final String message;

  const AppReadMoreWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      message,
      trimLines: 3,
      style: typoSmallTextRegular.copyWith(fontSize: 14.3.sp),
      colorClickableText: colorBlue80,
      trimMode: TrimMode.Line,
      lessStyle: typoSmallTextBold.copyWith(
          color: colorBlue90, decoration: TextDecoration.underline),
      moreStyle: typoSmallTextBold.copyWith(
          color: colorBlue90, decoration: TextDecoration.underline),
      trimCollapsedText: '\nMore',
      trimExpandedText: '\nLess',
    );
  }
}
