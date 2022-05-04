import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ItemLoading extends StatelessWidget {
  const ItemLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30.h,
      width: 30.w,
      child: const CircularProgressIndicator(
        strokeWidth: 2,
      ),
    );
  }
}
