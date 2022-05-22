import 'package:docsify/components/app_button.dart';
import 'package:docsify/components/app_scalford.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/components/app_text_field.dart';
import 'package:docsify/components/item_loading.dart';
import 'package:docsify/components/item_search.dart';
import 'package:docsify/components/suggest_wiget.dart';
import 'package:docsify/const/resource.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchController> {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.setContext(context);
    return AppScaffold(
        backgroundColor: colorBackgroundGrey10,
        appbar: AppBar(
          elevation: 1,
          backgroundColor: colorWhite,
          title: Text(
            LocaleKeys.search.tr,
            style: typoLargeTextBold,
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.clear,
                  color: colorBlack,
                ))
          ],
          toolbarHeight: 50.h,
        ),
        body: ListView(
          controller: controller.scrollController,
          children: [
            searchGroupWidget(context),
            // for (int i = 0; i < defaultView().length; i++) defaultView()[i],
            Obx(() =>
                Visibility(
                  child: sortWidget(),
                  visible: !controller.isDefaultView.value,
                )),
            Obx(() =>
                Visibility(
                    child: listSearch(),
                    visible: !controller.isDefaultView.value))
          ],
        ));
  }

  List<Widget> defaultView() {
    return <Widget>[];
    logE("TAG default view: ${controller.isDefaultView.value}");
  }

  Widget sortWidget() {
    return Wrap(
      runSpacing: 10.h,
      spacing: 10.w,
      children: [
        SizedBox(
          width: 10.h,
        ),
        AppText(
          LocaleKeys.activity_list.tr,
          style: typoMediumTextBold,
        ),
        Obx(() =>
            Container(
                margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 15.h),
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                height: 33.h,
                decoration: BoxDecoration(
                    border: Border.all(color: colorGrey20, width: 1.h),
                    color: colorWhite,
                    borderRadius: BorderRadius.all(Radius.circular(8.h))),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                      isDense: true,
                      value: controller.sortValue.value,
                      isExpanded: true,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: controller.listSort.map(buildSortItem).toList(),
                      onChanged: (value) {
                        controller.handleSort(value!);
                      }),
                ))),
      ],
    );
  }

  DropdownMenuItem<String> buildSortItem(String item) =>
      DropdownMenuItem(
        child: AppText(item),
        value: item,
      );

  Widget listSearch() {
    return ((controller.listSearch.isEmpty && !controller.isLoading.value)
        ? Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 20.h),
      child: AppText(
        LocaleKeys.not_result.tr,
        style: typoMediumTextRegular,
      ),
    )
        : Obx(() =>
        ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, index) {
            if (index == controller.listSearch.length) {
              return const ItemLoading();
            }
            return ItemSearchWidget(
              ob: controller.listSearch[index],
            );
          },
          separatorBuilder: (context, index) =>
              Container(
                height: 20.h,
              ),
          itemCount: controller.isReadEnd.value
              ? controller.listSearch.length
              : controller.listSearch.length + 1,
        )));
  }

  Widget searchGroupWidget(BuildContext context) {
    return Container(
      color: colorBlue90,
      margin: EdgeInsets.only(
        bottom: 10.h,
      ),
      padding:
      EdgeInsets.only(top: 10.h, left: 12.w, right: 12.w, bottom: 15.h),
      child: Column(
        children: [
          Row(
            children: [
              Obx(() =>
                  AppButton(
                    backgroundColor: (controller.isShowAddress.value == true)
                        ? colorGrey20
                        : colorWhite,
                    title: LocaleKeys.offline.tr,
                    onPress: () => controller.actionSearch(),
                    textStyle: typoNormalTextBold,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(5.h))),
                  )),
              Obx(() =>
                  AppButton(
                    backgroundColor: (controller.isShowAddress.value == true)
                        ? colorWhite
                        : colorGrey20,
                    title: LocaleKeys.online.tr,
                    onPress: () => controller.actionSearch(),
                    textStyle: typoNormalTextBold,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.only(topRight: Radius.circular(5.h))),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  )),
            ],
          ),
          Container(
            padding: EdgeInsets.all(10.h),
            child: Wrap(
              runSpacing: 15.h,
              children: [
                AppText(
                  LocaleKeys.fill_doctor.tr,
                  textAlign: TextAlign.start,
                  style: typoMediumTextBold,
                ),
                AppTextField(
                  controller: controller.queryController,
                  hintText: LocaleKeys.category_or_doctor_name.tr,
                  textStyle: typoSmallTextBold.copyWith(
                      color: colorText80, fontWeight: FontWeight.w400),
                  hintStyle: styleTextField.copyWith(
                      fontWeight: FontWeight.w400,
                      color: colorText80,
                      fontSize: 14.sp),
                ),
                Obx(() =>
                    Visibility(
                      child: AppTextField(
                        readOnly: true,
                        hintText: LocaleKeys.address.tr,
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
                      visible: controller.isShowAddress.value,
                    )),
                searchWidget(context)
              ],
            ),
            decoration: BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.h),
                    bottomRight: Radius.circular(10.h),
                    topRight: Radius.circular(10.h))),
          ),
          SizedBox(
            height: 15.h,
          ),
          SuggestWidget(
              listSuggestion: controller.listSuggestion,
              callBack: (text) => controller.handleSuggest(text))
        ],
      ),
    );
  }

  Widget searchWidget(BuildContext context) {
    return MaterialButton(
      height: 40.h,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.h))),
      color: colorBlue90,
      minWidth: MediaQuery
          .of(context)
          .size
          .width,
      onPressed: () =>
          controller.handleSearch(
            controller.queryController.value.text,
          ),
      child: Wrap(
        runSpacing: 15.w,
        spacing: 15.w,
        children: [
          SvgPicture.asset(
            R.assetsSvgSearchSvg,
            width: 20.w,
            color: colorWhite,
          ),
          Text(
            LocaleKeys.search.tr,
            style: typoSmallTextBold.copyWith(color: colorText5),
          )
        ],
      ),
    );
  }
}
