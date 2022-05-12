import 'package:docsify/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemLoading extends StatelessWidget {
  const ItemLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 20.w,
      width: 20.w,
      child: const CircularProgressIndicator(
        strokeWidth: 2,
        color: colorBlue80,
      ),
    );
  }
}
