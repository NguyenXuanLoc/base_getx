import 'package:docsify/components/app_button.dart';
import 'package:docsify/components/app_dotted_line.dart';
import 'package:docsify/components/app_network_image.dart';
import 'package:docsify/components/app_scalford.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/const/resource.dart';
import 'package:docsify/data/model/rating_response.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/tab_search_controller.dart';

class TabSearchView extends GetView<TabSearchController> {
  const TabSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        padding: EdgeInsets.only(left: 10.w, right: 10.w),
        appbar: AppBar(
          elevation: 1,
          backgroundColor: colorWhite,
          title: titleWidget(),
          toolbarHeight: 50.h,
        ),
        body: RefreshIndicator(
          displacement: 40,
          backgroundColor: colorWhite,
          color: colorBlue80,
          strokeWidth: 2,
          onRefresh: () async => controller.handleRefresh(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                AppText(
                  LocaleKeys.hello_can_i_help_u.tr,
                  style: typoMediumTextRegular,
                ),
                SizedBox(
                  height: 10.h,
                ),
                searchWidget(context),
                suggestionWidget(),
                SizedBox(
                  height: 10.h,
                ),
                AppText(
                  LocaleKeys.featured_doctor.tr,
                  style: typoNormalTextBold,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Obx(() => Visibility(
                      child: const Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 2.0,
                          color: colorBlue80,
                          backgroundColor: colorWhite,
                        ),
                      ),
                      visible: controller.lRating.isEmpty ? true : false,
                    )),
                ratingWidget(),
              ],
            ),
          ),
        ));
  }

  Widget ratingWidget() {
    return Obx(() => ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) =>
              itemRating(controller.lRating[index], index),
          itemCount: controller.lRating.length,
          separatorBuilder: (BuildContext context, int index) {
            return Container(
              height: 10.h,
              alignment: Alignment.center,
              child: const AppDotsLine(),
            );
          },
        ));
  }

  Widget searchWidget(BuildContext context) {
    return MaterialButton(
      height: 40.h,
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: colorGrey80),
          borderRadius: BorderRadius.all(Radius.circular(7.h))),
      color: colorWhite,
      minWidth: MediaQuery.of(context).size.width,
      onPressed: () => controller.openSearchScreen(),
      child: Row(
        children: [
          SvgPicture.asset(
            R.assetsSvgSearchSvg,
            color: colorGrey80,
            width: 20.w,
          ),
          SizedBox(
            width: 30.w,
          ),
          AppText(
            LocaleKeys.category_or_doctor_name.tr,
            style: typoSmallTextRegular.copyWith(color: colorText60),
          ),
        ],
      ),
    );
  }

  Widget itemRating(RatingResponse ob, int index) {
    return InkWell(
      child: Row(
        children: [
          Container(
            child: AppNetworkImage(source: ob.photos![1]),
            alignment: Alignment.topCenter,
            height: 50.h,
            width: 50.w,
            margin: EdgeInsets.only(right: 25.w),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                ob.userName!,
                style: typoSmallTextBold.copyWith(fontSize: 17.sp),
              ),
              RatingBarIndicator(
                rating: double.parse(ob.vote.toString()),
                itemBuilder: (c, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 20.0,
              ),
              AppText(
                ob.rComment!,
                style: typoSmallTextBold.copyWith(fontSize: 15.sp),
                maxLine: 3,
              )
            ],
          )
        ],
      ),
      onTap: () => controller.openDoctorDetail(ob),
    );
  }

  Widget suggestionWidget() {
    return Wrap(
      children: controller.listSuggestion
          .map((e) => Container(
                child: AppButton(
                  padding: EdgeInsets.all(4.h),
                  textStyle: typoSmallTextRegular,
                  title: e,
                  onPress: () => controller.openSearchScreen(suggestion: e),
                  backgroundColor: colorGrey20,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  borderRadius: 5.h,
                  height: 25.h,
                ),
                margin: EdgeInsets.only(top: 6.h, right: 6.w),
              ))
          .toList(),
    );
  }

  Widget titleWidget() {
    return Row(
      children: [
        SvgPicture.asset(R.assetsSvgIconAppBarSvg),
        SizedBox(
          width: 20.w,
        ),
        AppText(
          LocaleKeys.app_name.tr,
          style: typoLargeTextBold,
        ),
        const Spacer(),
        InkWell(
          child: SvgPicture.asset(R.assetsSvgThreeDotsSvg),
        )
      ],
    );
  }
}
