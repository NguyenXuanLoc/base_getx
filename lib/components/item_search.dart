import 'package:docsify/components/app_network_image.dart';
import 'package:docsify/components/app_rate.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/const/resource.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:docsify/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';

import 'expanded_pageview.dart';

class ItemSearchWidget extends StatefulWidget {
  const ItemSearchWidget({Key? key}) : super(key: key);

  @override
  _ItemSearchWidgetState createState() => _ItemSearchWidgetState();
}

class _ItemSearchWidgetState extends State<ItemSearchWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  late PageController pageController;
  var currentIndex = 0;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    tabController.addListener(() {
      if (currentIndex != tabController.index) {
        currentIndex = tabController.index;
        pageController.jumpToPage(currentIndex);
        setState(() {});
      }
      Utils.sentEventBus(tabController.index);
    });
    super.initState();
  }

  void switchPage() {
    pageController.addListener(() {
      var _newPage = pageController.page!.round();
      if (currentIndex != _newPage) {
        currentIndex = _newPage;
        tabController.index = currentIndex;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(top: 10.h, bottom: 10.h, left: 10.w, right: 10.w),
      color: colorWhite,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Container(
                  color: colorBlack,
                  width: 46.w,
                  height: 46.w,
                  child: const AppNetworkImage(
                    source:
                        'https://platform-static-files.s3.amazonaws.com/premierleague/photos/players/250x250/Photo-Missing.png',
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'Denisa Green',
                    style: typoMediumTextBold,
                  ),
                  AppText(
                    'Dentis,Psychologis,Surgeon',
                    style: typoSmallTextRegular.copyWith(fontSize: 12.sp),
                  ),
                  const AppRating(
                    itemCount: 5,
                    isRating: false,
                    numberRate: 4,
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                onTap: () {},
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
          ReadMoreText(
            'She graduated in nursing at the University of Health, then in addictology at the 1st    Faculty of Medicine, Charles University. She graduat...',
            trimLines: 3,
            style: typoSmallTextRegular.copyWith(fontSize: 14.3.sp),
            colorClickableText: colorBlue80,
            trimMode: TrimMode.Line,
            trimCollapsedText: '\nMore',
            trimExpandedText: '\nLess',
          ),
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
          TabBar(
            controller: tabController,
            labelStyle: typoSmallTextBold.copyWith(fontWeight: FontWeight.w800),
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(color: colorPink100, width: 2.0),
            ),
            unselectedLabelColor: colorText100,
            tabs: const [
              Tab(
                text: 'Online',
              ),
              Tab(
                text: 'Address 1',
              ),
              Tab(
                text: 'Address 2',
              ),
            ],
          ),
          ExpandablePageView(
            currentIndex: currentIndex,
            pageController: (controller) {
              pageController = controller;
              switchPage();
            },
            children: [
              statusWidget(),
              addressWidget(),
              addressWidget(),
            ],
          )
        ],
      ),
    );
  }

  Widget addressWidget() {
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
                '88 Nguyen Xien, Thanh Xuan, Ha Noi Medlatech',
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
                'Dental examination - 300.000 VND Couple psychotherapy - 400.000 VND Psychological counseling - 200.000 VND',
                trimLines: 3,
                style: typoSmallTextRegular.copyWith(fontSize: 14.3.sp),
                colorClickableText: colorBlue80,
                trimMode: TrimMode.Line,
                trimCollapsedText: '\nMore',
                trimExpandedText: '\nLess',
              )),
            ],
          ),
        ],
      ),
    );
  }

  Widget statusWidget() {
    return Container(
        padding:
            EdgeInsets.only(left: 10.w, right: 10.w, top: 15.h, bottom: 20.h),
        child: Row(
          children: [
            SvgPicture.asset(
              R.assetsSvgBagSvg,
              width: 20.w,
            ),
            SizedBox(
              width: 15.w,
            ),
            AppText(
              'Online consultation - 300.000 VND',
              style: typoSmallTextRegular,
            )
          ],
        ));
  }
}
