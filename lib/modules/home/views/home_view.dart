import 'package:docsify/components/app_button.dart';
import 'package:docsify/components/app_check_box.dart';
import 'package:docsify/components/app_rate.dart';
import 'package:docsify/components/app_scalford.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/components/app_text_button.dart';
import 'package:docsify/components/calendar_timeline/calendar_timeline.dart';
import 'package:docsify/components/item_loading.dart';
import 'package:docsify/components/my_listview.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    controller.showDialog(context);
    return AppScaffold(
      body: SingleChildScrollView(
        controller: controller.testController,
        child: Column(
          children: [
            AppRating(
              onRateUpdate: (rating) {
                logE("TAG rating");
              },
              itemCount: 5,
              isRating: true,
            ),
            const AppRating(
              numberRate: 3,
              itemCount: 5,
            ),
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
                    return Container(
                      alignment: Alignment.center,
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
  }
}
