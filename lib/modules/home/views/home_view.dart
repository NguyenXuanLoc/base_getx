import 'package:docsify/components/app_scalford.dart';
import 'package:docsify/const/resource.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/modules/tab_favourite/views/favourite_view.dart';
import 'package:docsify/modules/tab_reservation/views/reservation_view.dart';
import 'package:docsify/modules/tab_search/views/tab_search_view.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [TabSearchView(), ReservationView(), FavouriteView()],
      ),
      bottomNavigationBar: bottomNavigationWidget(),
    );
  }

  Widget _buildIcon(String assetName, String text, int index) => SizedBox(
        width: double.infinity,
        height: 55.h,
        child: Material(
          color: controller.index.value == index ? colorGrey20 : colorWhite,
          child: InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  assetName,
                  color: colorBlack,
                  width: 18.w,
                  height: 18.h,
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text(text,
                    style: typoSmallTextRegular.copyWith(fontSize: 12.sp)),
              ],
            ),
            onTap: () => controller.changeTabIndex(index),
          ),
        ),
      );

  Widget bottomNavigationWidget() {
    return Obx(() => BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          iconSize: 0,
          items: [
            BottomNavigationBarItem(
              backgroundColor: colorBlue80,
              icon: _buildIcon(R.assetsSvgSearchSvg, LocaleKeys.search.tr, 0),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: _buildIcon(
                    R.assetsSvgCalendarSvg, LocaleKeys.reservation.tr, 1),
                label: ''),
            BottomNavigationBarItem(
                icon:
                    _buildIcon(R.assetsSvgHeartSvg, LocaleKeys.favourite.tr, 2),
                label: ''),
          ],
          currentIndex: controller.index.value,
        ));
  }
}
