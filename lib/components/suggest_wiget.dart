import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SuggestWidget extends StatelessWidget {
  final Set<String> listSuggestion;
  final Function(String) callBack;

  const SuggestWidget(
      {Key? key, required this.listSuggestion, required this.callBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: listSuggestion
          .map((e) => Container(
                child: InkWell(
                  onTap: () => callBack(e),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: e.toString(),
                        style: typoSmallTextRegular.copyWith(
                            color: colorWhite,
                            fontSize: 10.sp,
                            decoration: TextDecoration.underline),
                      ),
                      (e == listSuggestion.elementAt(listSuggestion.length - 1))
                          ? const TextSpan()
                          : TextSpan(
                              text: "   |",
                              style: typoSmallTextRegular.copyWith(
                                  color: colorGrey80, fontSize: 10.sp))
                    ]),
                  ),
                ),
                margin: EdgeInsets.only(left: 2.w, right: 10.w, top: 8.h),
              ))
          .toList(),
    );
  }
}
