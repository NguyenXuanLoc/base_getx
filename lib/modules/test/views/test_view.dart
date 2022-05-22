import 'package:docsify/components/app_check_box.dart';
import 'package:docsify/components/app_rate.dart';
import 'package:docsify/components/app_scalford.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/components/app_text_button.dart';
import 'package:docsify/components/app_text_field.dart';
import 'package:docsify/components/my_listview.dart';
import 'package:docsify/components/app_button.dart';
import 'package:docsify/components/item_loading.dart';
import 'package:docsify/const/resource.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../components/calendar_timeline/calendar_timeline.dart';
import '../controllers/test_controller.dart';

class TestView extends GetView<TestController> {
  @override
  Widget build(BuildContext context) {
    controller.showDialog(context);
    return AppScaffold(
      body: SingleChildScrollView(
        controller: controller.testController,
        child: Column(
          children: [
          /*  AppRating(
              onRateUpdate: (rating) {
                logD("TAG rating");
              },
              itemCount: 5,
              isRating: true,
            ),
            const AppRating(
              numberRate: 3,
              itemCount: 5,
            ),*/
            AppTextButton(
              buttonTitle: "Textbutton",
              onPressed: () => logD("Bam cc"),
            ),
            AppButton(
              borderRadius: 100.h,
              backgroundColor: Colors.brown,
              title: "Button",
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10.r),
              ),
              height: 60.h,
              width: 100.w,
              onPress: () {
                logD("Button Click");
              },
            ),
            AppText(
              LocaleKeys.ask_existing_page.tr,
              style: typoLargeTextRegular.copyWith(
                  color: Colors.green, fontSize: 30.sp),
            ),
            AppText(
              LocaleKeys.ask_existing_page.tr,
              style: typoLargeTextRegular.copyWith(
                  color: Colors.green, fontSize: 30),
            ),
            Obx(() => AppCheckBox(
                  value: controller.isCheck.value,
                  onChanged: (values) {
                    controller.checkChange(values);
                  },
                  label: "Bam cc",
                )),
            ReadMoreText(
              'The Flutter framework builds its layout via the composition of widgets, everything that you construct programmatically is a widget and these are compiled together to create the user interface. ',
              trimLines: 2,
              style: typoNormalTextRegular,
              colorClickableText: Colors.pink,
              trimMode: TrimMode.Line,
              trimCollapsedText: '...Read more',
              trimExpandedText: ' Less',
            ),
            CalendarTimeline(
              initialDate: DateTime(2020, 4, 20),
              firstDate: DateTime(2019, 1, 15),
              lastDate: DateTime(2020, 11, 20),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              monthColor: Colors.blueGrey,
              dayColor: Colors.teal[200],
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Colors.redAccent[100],
              dotsColor: const Color(0xFF333A47),
              selectableDayPredicate: (date) => date.day != 23,
              locale: 'vi',
            ),
            Obx(() => MyListView(
                  axisCount: 2,
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    if (index >= controller.itemCount.value) {
                      return const ItemLoading();
                    }
                    return SizedBox(
                      width: 30.w,
                      height: 30.h,
                      child: Text("Index: $index"),
                    );
                  },
                  itemCount: controller.itemCount.value + 1,
                ))
          ],
        ),
      ),
    );
    return AppScaffold(
        backgroundColor: colorBlue80,
        padding:
            EdgeInsets.only(left: 10.w, right: 10.w, top: 12.h, bottom: 12.h),
        appbar: AppBar(
          elevation: 1,
          backgroundColor: colorWhite,
          title: titleWidget(),
          toolbarHeight: 50.h,
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  AppButton(
                    backgroundColor: colorWhite,
                    title: LocaleKeys.offline.tr,
                    onPress: () {},
                    textStyle: typoNormalTextBold,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(5.h))),
                  ),
                  AppButton(
                    backgroundColor: colorWhite,
                    title: LocaleKeys.online.tr,
                    onPress: () {},
                    textStyle: typoNormalTextBold,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topRight: Radius.circular(5.h))),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                    top: 10.h, left: 12.w, right: 12.w, bottom: 15.h),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5.h),
                        bottomRight: Radius.circular(5.h),
                        topRight: Radius.circular(5.h))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      LocaleKeys.fill_doctor.tr,
                      textAlign: TextAlign.start,
                      style: typoMediumTextBold,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    AppTextField(
                      hintText: LocaleKeys.category_or_doctor_name.tr,
                      textStyle: typoSmallTextBold.copyWith(
                          color: colorText80, fontWeight: FontWeight.w400),
                      hintStyle: styleTextField.copyWith(
                          fontWeight: FontWeight.w400,
                          color: colorText80,
                          fontSize: 14.sp),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    AppTextField(
                      readOnly: true,
                      hintText: "Address",
                      textStyle: typoSmallTextBold.copyWith(
                          color: colorText80, fontWeight: FontWeight.w400),
                      hintStyle: styleTextField.copyWith(
                          fontWeight: FontWeight.w400,
                          color: colorText80,
                          fontSize: 14.sp),
                      suffixIcon: IconButton(
                        onPressed: () {
                          logE("TAG click");
                        },
                        icon: SvgPicture.asset(R.assetsSvgIcDropDownSvg),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    MaterialButton(
                      height: 40.h,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(7.h))),
                      color: colorBlue80,
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            R.assetsSvgSearchSvg,
                            width: 20.w,
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Text(
                            LocaleKeys.search.tr,
                            style:
                                typoSmallTextBold.copyWith(color: colorText5),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget titleWidget() {
    return Row(
      children: [
        SvgPicture.asset(R.assetsSvgIconAppBarSvg),
        const Spacer(),
        Container(
          padding:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 3.h, bottom: 3.h),
          decoration: BoxDecoration(
            border: Border.all(
              color: colorBlue5,
            ),
            borderRadius: BorderRadius.all(Radius.circular(4.h)),
          ),
          child: AppText(
            LocaleKeys.user_zone.tr,
            style: typoSmallTextBold.copyWith(color: colorBlue80),
          ),
        ),
        SizedBox(
          width: 15.h,
        ),
        AppTextButton(
          onPressed: () {},
          buttonTitle: LocaleKeys.logout.tr,
          textStyle:
              typoSmallTextBold.copyWith(decoration: TextDecoration.underline),
        ),
        InkWell(
            onTap: () {},
            child: SvgPicture.asset(
              R.assetsSvgLogoutSvg,
              height: 15.h,
            )),
        SizedBox(
          width: 20.w,
        ),
        InkWell(
          child: SvgPicture.asset(R.assetsSvgThreeDotsSvg),
        )
      ],
    );
  }
}
