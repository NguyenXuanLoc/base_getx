import 'package:docsify/components/app_text.dart';
import 'package:docsify/components/rate_bar_indicator.dart';
import 'package:docsify/const/resource.dart';
import 'package:docsify/data/model/search_response.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:readmore/readmore.dart';

import 'app_network_image.dart';

class ItemSearchWidget extends StatefulWidget {
  final SearchResponse ob;

  const ItemSearchWidget({Key? key, required this.ob}) : super(key: key);

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
    tabController = TabController(
        length: widget.ob.source!.after!.addresses!.length + 1, vsync: this);
    tabController.addListener(() {
      if (currentIndex != tabController.index) {
        currentIndex = tabController.index;
        setState(() {});
      }
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    widget.ob.source!.after!.doctorName!,
                    style: typoMediumTextBold,
                  ),
                  AppText(
                    widget.ob.source!.after!.doctorProfile!.specialization
                        .toString(),
                    style: typoSmallTextRegular.copyWith(
                        fontSize: 13.sp, color: colorText45),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(R.assetsSvgRateSvg)
                      /*         RatingBarIndicator(
                        unratedWidget: SvgPicture.asset(R.assetsSvgUnRateSvg),
                        rating: 1.5 */ /*widget.ob.source!.after!.doctorRateAvg!*/ /*,
                        itemBuilder: (context, _) =>
                            SvgPicture.asset(R.assetsSvgRateSvg),
                        itemCount: 5,
                        itemSize: 20.0,
                      ),*/
                      ,
                      AppText(
                        " (${widget.ob.source!.after!.doctorRateCount.toString()}) ",
                        style: typoSmallTextRegular.copyWith(fontSize: 12.sp),
                      )
                    ],
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
            widget.ob.source!.after!.doctorProfile!.about!,
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
            physics: const NeverScrollableScrollPhysics(),
            isScrollable: true,
            indicatorSize: TabBarIndicatorSize.label,
            controller: tabController,
            labelStyle: typoSmallTextBold.copyWith(fontWeight: FontWeight.w800),
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(color: colorPink100, width: 2.0),
            ),
            unselectedLabelColor: colorText100,
            tabs: allTitleServiceWidget(widget.ob.source!.after!.addresses!),
          ),
          addressWidget(
              widget.ob.source!.after!.addresses![tabController.index])
        ],
      ),
    );
  }

  List<Tab> allTitleServiceWidget(List<Address> listService) {
    var list = <Tab>[];
    for (int i = 0; i < listService.length; i++) {
      list.add(Tab(text: LocaleKeys.address.tr + " ${i + 1}"));
    }
    list.add(Tab(text: LocaleKeys.address.tr + " 2"));
    return list;
  }

  List<Widget> allServiceWidget(List<Address> listService) {
    var list = <Widget>[];
    for (var element in listService) {
      list.add(addressWidget(element));
    }
    return list;
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
