import 'package:docsify/app/routes/app_pages.dart';
import 'package:docsify/components/app_button.dart';
import 'package:docsify/components/app_network_image.dart';
import 'package:docsify/components/app_scalford.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/components/app_text_field.dart';
import 'package:docsify/components/item_loading.dart';
import 'package:docsify/components/suggest_wiget.dart';
import 'package:docsify/const/resource.dart';
import 'package:docsify/data/model/rating_response.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/services/globals.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:docsify/utils/app_utils.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/shims/dart_ui_real.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../controllers/tab_search_controller.dart';

class TabSearchView extends GetView<TabSearchController> {
  const TabSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        backgroundColor: colorBackgroundGrey10,
        appbar: AppBar(
          automaticallyImplyLeading: false,
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
            controller: controller.scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  color: colorBlue85,
                  padding: EdgeInsets.only(
                      left: 10.w, right: 10.w, top: 10.h, bottom: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      AppText(
                        LocaleKeys.hello_can_i_help_u.tr,
                        style:
                            typoMediumTextRegular.copyWith(color: colorWhite),
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      searchWidget(context),
                      SizedBox(
                        height: 10.h,
                      ),
                      SuggestWidget(
                        listSuggestion: controller.listSuggestion,
                        callBack: (text) =>
                            controller.openSearchScreen(suggestion: text),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Obx(() => AppButton(
                          width: 130.w,
                          backgroundColor: (controller.currentIndex.value == 0)
                              ? colorGrey20
                              : colorWhite,
                          title: LocaleKeys.doctors.tr,
                          // onPress: () => controller.actionSearch(),
                          textStyle: typoNormalTextBold,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          shapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5.h),
                                  topLeft: Radius.circular(5.h))),
                          onPress: () => controller.switchTab(),
                        )),
                    Obx(() => AppButton(
                          width: 130.w,
                          backgroundColor: (controller.currentIndex.value == 0)
                              ? colorWhite
                              : colorGrey20,
                          title: LocaleKeys.lastest_rating.tr,
                          // onPress: () => controller.actionSearch(),
                          textStyle: typoNormalTextBold,
                          shapeBorder: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5.h),
                                  bottomRight: Radius.circular(5.h))),
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onPress: () => controller.switchTab(),
                        )),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Obx(() => controller.currentIndex.value == 0
                    ? doctorWidget()
                    : ratingWidget())
              ],
            ),
          ),
        ));
  }

  Widget doctorWidget() {
    return Obx(() => controller.lDoctor.isEmpty
        ? Container(
            child: Text(
              LocaleKeys.not_result.tr,
              style: typoMediumTextRegular,
            ),
            padding: EdgeInsets.only(top: 20.h),
          )
        : ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (index == controller.lDoctor.length) {
                return const ItemLoading();
              }
              return itemDoctors(controller.lDoctor[index], index, context);
            },
            itemCount: controller.isReadEndDoctor.value &&
                    controller.lDoctor.length > 3
                ? controller.lDoctor.length + 1
                : controller.lDoctor.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20.h,
              );
            },
          ));
  }

  Widget ratingWidget() {
    return Obx(() => controller.lRating.isEmpty
        ? Container(
            child: Text(
              LocaleKeys.not_result.tr,
              style: typoMediumTextRegular,
            ),
            padding: EdgeInsets.only(top: 20.h),
          )
        : ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              if (index == controller.lRating.length) {
                return const ItemLoading();
              }
              return itemRating(controller.lRating[index], index, context);
            },
            itemCount: controller.isReadEndLatestRating.value &&
                    controller.lRating.length > 3
                ? controller.lRating.length + 1
                : controller.lRating.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20.h,
              );
            },
          ));
  }

  Widget searchWidget(BuildContext context) {
    return AppTextField(
      onTap: () => controller.openSearchScreen(),
      readOnly: true,
      prefixIcon: Container(
        padding: EdgeInsets.all(10.h),
        child: SvgPicture.asset(
          R.assetsSvgSearch2Svg,
          color: colorGrey80,
          height: 10.h,
          width: 10.w,
        ),
      ),
      hintText: LocaleKeys.input_specialist_or_doctor_name.tr,
      hintStyle: typoSmallTextRegular.copyWith(color: colorText60),
    );
  }

  Widget titleWidget() {
    return Row(
      children: [
        SvgPicture.asset(R.assetsSvgIconAppBarSvg),
        SizedBox(
          width: 10.w,
        ),
        SvgPicture.asset(
          R.assetsSvgAppNameSvg,
          height: 17.h,
        ),
        const Spacer(),
        InkWell(
          child: SvgPicture.asset(
            R.assetsSvgAvatarSvg,
            width: 35.w,
          ),
          onTap: () => Get.toNamed(Routes.LOGIN),
        )
      ],
    );
  }

  Widget itemDoctors(RatingResponse ob, int index, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipOval(
              child: SizedBox(
                height: 40.h,
                width: 40.h,
                child: AppNetworkImage(source: ob.photos![1]),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            AppText(
              ob.userName!,
              style: typoMediumTextBold,
            ),
            SizedBox(
              height: 5.h,
            ),
            AppText(
              ob.rComment.toString(),
              style: typoMediumTextRegular.copyWith(
                  fontSize: 15.sp, color: colorText70),
            ),
            Image.asset(
              Utils.getNumberRating(double.parse(ob.vote.toString())),
              width: 90.w,
            ),
            SizedBox(
              height: 10.h,
            ),
            AppText(
              ob.rComment.toString(),
              style: typoMediumTextRegular.copyWith(fontSize: 17.sp),
            )
          ],
        ),
        onTap: () => controller.openDoctorDetail(ob),
      ),
      padding: EdgeInsets.all(10.h),
      color: colorWhite,
    );
  }

  Widget itemRating(RatingResponse ob, int index, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipOval(
              child: SizedBox(
                height: 40.h,
                width: 40.h,
                child: AppNetworkImage(
                    source: ob.photos![1], errorSource: urlAvatarError),
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    AppText(ob.userName!),
                    const Spacer(),
                    Image.asset(
                      Utils.getNumberRating(double.parse(ob.vote.toString())),
                      width: 90.w,
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: colorBackgroundGrey10,
                        borderRadius: BorderRadius.all(Radius.circular(7.w))),
                    padding: EdgeInsets.all(10.h),
                    width: MediaQuery.of(context).size.width,
                    child: ReadMoreText(
                      ob.rComment.toString(),
                      trimLines: 3,
                      style: typoSmallTextRegular.copyWith(fontSize: 14.3.sp),
                      colorClickableText: colorBlue80,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: '\nMore',
                      trimExpandedText: '\nLess',
                    ))
              ],
            ))
          ],
        ),
        onTap: () => controller.openDoctorDetail(ob),
      ),
      padding: EdgeInsets.all(10.h),
      color: colorWhite,
    );
  }
}
