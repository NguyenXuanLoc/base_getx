import 'package:docsify/components/app_read_more_widget.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/const/resource.dart';
import 'package:docsify/data/model/search_response.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/services/globals.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:readmore/readmore.dart';

import '../utils/app_utils.dart';
import 'app_network_image.dart';

class ItemSearchWidget extends StatefulWidget {
  final DoctorResponse ob;
  final Function(int) callBackFavourite;
  final Function(DoctorResponse) callBackOpenDetail;

  const ItemSearchWidget(
      {Key? key,
      required this.ob,
      required this.callBackFavourite,
      required this.callBackOpenDetail})
      : super(key: key);

  @override
  _ItemSearchWidgetState createState() => _ItemSearchWidgetState();
}

class _ItemSearchWidgetState extends State<ItemSearchWidget>
    with SingleTickerProviderStateMixin {
  var currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.callBackOpenDetail(widget.ob),
      child: Container(
        padding:
            EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w, right: 10.w),
        color: colorWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: SizedBox(
                    width: 46.w,
                    height: 46.w,
                    child: AppNetworkImage(
                        source: widget.ob.doctorProfile!.avatar,
                        errorSource: urlAvatarError),
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      widget.ob.doctorName!,
                      style: typoMediumTextBold,
                    ),
                    AppText(
                      widget.ob.doctorProfile!.specialization.toString(),
                      style: typoSmallTextRegular.copyWith(
                          fontSize: 13.sp, color: colorText45),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 100.w,
                          child: Image.asset(Utils.getNumberRating(double.parse(
                              widget.ob.doctorRateAvg!.toString()))),
                        ),
                        AppText(
                          " (${widget.ob.doctorRateCount.toString()}) ",
                          style: typoSmallTextRegular.copyWith(fontSize: 12.sp),
                        )
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () =>
                      widget.callBackFavourite(widget.ob.doctorProfile!.id!),
                  child: SvgPicture.asset(
                    R.assetsSvgHeartSvg,
                    width: 21.w,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            AppReadMoreWidget(message: widget.ob.doctorProfile!.about ?? ''),
            SizedBox(
              height: 20.h,
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.h),
                  color: colorBackgroundGrey10),
              padding: EdgeInsets.only(top: 7.h, bottom: 7.h),
              child: Row(
                children: [
                  SvgPicture.asset(R.assetsSvgCalendarSvg),
                  AppText(
                    '  Available Calendar: Today ',
                    style: typoSmallTextBold.copyWith(fontSize: 13.sp),
                  )
                ],
                mainAxisSize: MainAxisSize.min,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 40.h,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: titleAddressWidget(),
              ),
            ),
            addressWidget(widget.ob.addresses![currentIndex])
          ],
        ),
      ),
    );
  }

  List<Widget> titleAddressWidget() {
    var result = <Widget>[];
    for (int i = 0; i < widget.ob.addresses!.length; i++) {
      result.add(InkWell(
          onTap: () {
            setState(() => currentIndex = i);
          },
          child: Container(
            child: AppText(LocaleKeys.address.tr + " ${i + 1}",
                style: typoMediumTextBold.copyWith(
                  fontSize: 15.sp,
                  shadows: [
                    const Shadow(color: colorText100, offset: Offset(0, -8))
                  ],
                  color: Colors.transparent,
                  decoration: TextDecoration.underline,
                  decorationColor:
                      (currentIndex == i) ? colorSemanticRed100 : colorWhite,
                  decorationThickness: 2,
                )),
            margin: EdgeInsets.all(10.w),
          )));
    }
    return result;
  }

  Widget addressWidget(Address address) {
    return Container(
      padding:
          EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h, bottom: 20.h),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(R.assetsSvgLocationSvg),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                  child: AppText(
                "${address.street}, ${address.district}, ${address.city}",
                style: typoSmallTextRegular,
                maxLine: 3,
              ))
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(R.assetsSvgBagSvg),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                  child: ReadMoreText(
                getAllService(address.services!),
                trimLines: 3,
                style: typoSmallTextRegular.copyWith(fontSize: 14.3.sp),
                colorClickableText: colorBlue80,
                trimMode: TrimMode.Line,
                trimCollapsedText: '\n${LocaleKeys.more.tr}',
                trimExpandedText: '\n${LocaleKeys.less.tr}',
              )),
            ],
          ),
        ],
      ),
    );
  }

  String getAllService(List<Service> services) {
    var result = '';
    for (var element in services) {
      result +=
          "${element.serviceName} - ${element.price} ${element.currencyUnit!}";
    }
    return result;
  }
}
