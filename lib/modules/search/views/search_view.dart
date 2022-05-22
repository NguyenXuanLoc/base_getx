import 'package:docsify/components/app_button.dart';
import 'package:docsify/components/app_network_image.dart';
import 'package:docsify/components/app_scalford.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/components/app_text_field.dart';
import 'package:docsify/components/item_loading.dart';
import 'package:docsify/components/item_search.dart';
import 'package:docsify/components/suggest_wiget.dart';
import 'package:docsify/const/resource.dart';
import 'package:docsify/data/model/city_response.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/services/globals.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

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
            Obx(
              () => Visibility(
                  visible: controller.isDefaultView.value,
                  child: famousDoctorWidget()),
            ),
            Obx(
              () => Visibility(
                  visible: controller.isDefaultView.value,
                  child: lastSearchWidget()),
            ),
            Obx(
              () => Visibility(
                  visible: controller.isDefaultView.value,
                  child: suggestionWidget()),
            ),
            Obx(() => Visibility(
                  child: sortWidget(context),
                  visible: !controller.isDefaultView.value,
                )),
            // test(context),
            Obx(() => Visibility(
                child: listSearch(), visible: !controller.isDefaultView.value))
          ],
        ));
  }

  Widget famousDoctorWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w, top: 15.h, bottom: 25.h),
          child: AppText(
            LocaleKeys.famous_doctor.tr.toUpperCase(),
            style: typoNormalTextBold.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        Obx(() => Visibility(
              visible: controller.isLoadingFamous.value,
              child: const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: colorBlue80,
                ),
              ),
            )),
        Obx(() => ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              primary: false,
              itemBuilder: (context, index) => Container(
                color: colorWhite,
                padding: EdgeInsets.only(
                    left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
                child: InkWell(
                  child: Row(
                    children: [
                      SizedBox(
                        child: ClipOval(
                          child: AppNetworkImage(
                            source: controller.listFamousDoctor[index]
                                .doctorProfile!.avatar![0],
                            errorSource: urlAvatarError,
                          ),
                        ),
                        height: 40.h,
                        width: 40.h,
                      ),
                      SizedBox(
                        width: 50.w,
                      ),
                      AppText(
                        controller.listFamousDoctor[index].doctorName!,
                        style: typoSmallTextRegular.copyWith(fontSize: 15.sp),
                      )
                    ],
                  ),
                  onTap: () => controller.openDoctorDetail(controller.listFamousDoctor[index]),
                ),
              ),
              itemCount: controller.listFamousDoctor.length,
            ))
      ],
    );
  }

  Widget lastSearchWidget() {
    return Visibility(
      child: Wrap(
        spacing: 15.w,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 15.w, top: 25.h, bottom: 25.h),
            child: AppText(
              LocaleKeys.last_search.tr.toUpperCase(),
              style: typoNormalTextBold.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          Obx(() => ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                primary: false,
                itemBuilder: (context, index) => InkWell(
                  child: Container(
                    color: colorWhite,
                    padding: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
                    child: Row(
                      children: [
                        SizedBox(
                          child: ClipOval(
                            child: AppNetworkImage(
                              source: controller.listLastSearch[index].avatar,
                              errorSource: urlAvatarError,
                            ),
                          ),
                          height: 40.h,
                          width: 40.h,
                        ),
                        SizedBox(
                          width: 50.w,
                        ),
                        AppText(
                          controller.listLastSearch[index].name!,
                          style: typoSmallTextRegular.copyWith(fontSize: 15.sp),
                        )
                      ],
                    ),
                  ),
                  onTap: () => controller
                      .setCategory(controller.listLastSearch[index].name!),
                ),
                itemCount: controller.listLastSearch.length,
              ))
        ],
      ),
      visible: controller.listLastSearch.isNotEmpty ? true : false,
    );
  }

  Widget suggestionWidget() {
    return Wrap(
      runSpacing: 10.w,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.w, top: 25.h, bottom: 15.h),
          child: AppText(
            LocaleKeys.suggestion.tr.toUpperCase(),
            style: typoNormalTextBold.copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          itemBuilder: (context, index) => InkWell(
            child: Container(
              color: colorWhite,
              padding: EdgeInsets.only(
                  left: 20.w, right: 20.w, top: 10.h, bottom: 10.h),
              child: Row(
                children: [
                  SizedBox(
                    child: ClipOval(
                      child: AppNetworkImage(
                        source: controller.listSuggestDoctor[index].avatar,
                        errorSource: urlAvatarError,
                      ),
                    ),
                    height: 40.h,
                    width: 40.h,
                  ),
                  SizedBox(
                    width: 50.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        controller.listSuggestDoctor[index].name!,
                        style: typoSmallTextRegular.copyWith(fontSize: 15.sp),
                      ),
                      AppText(
                        controller.listSuggestDoctor[index].specialization ??
                            '',
                        style: typoSmallTextRegular.copyWith(
                            fontSize: 13.sp, color: colorText60),
                      )
                    ],
                  )
                ],
              ),
            ),
            onTap: () => controller
                .setCategory(controller.listSuggestDoctor[index].name!),
          ),
          itemCount: controller.listSuggestDoctor.length,
        )
      ],
    );
  }

  Widget sortWidget(BuildContext context) {
    return Wrap(
      runSpacing: 10.h,
      spacing: 10.w,
      children: [
        SizedBox(
          width: 5.h,
        ),
        AppText(
          LocaleKeys.activity_list.tr,
          style: typoMediumTextBold,
        ),
        Obx(() => Container(
            margin: EdgeInsets.only(left: 10.w, right: 10.w, bottom: 15.h),
            height: 33.h,
            child: DropdownButtonHideUnderline(
              child: DropdownButton2(
                isExpanded: true,
                items: controller.listSort
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: AppText(
                            item,
                            style: typoSmallTextRegular,
                          ),
                        ))
                    .toList(),
                value: controller.sortValue.value,
                onChanged: (value) {
                  controller.handleSort(value.toString());
                },
                icon: const Icon(Icons.keyboard_arrow_down),
                buttonPadding: EdgeInsets.only(left: 10.w, right: 10.w),
                buttonDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.w),
                  border: Border.all(
                    color: colorGrey20,
                  ),
                  color: colorWhite,
                ),
                itemPadding: EdgeInsets.only(left: 14.w, right: 14.w),
                dropdownWidth: MediaQuery.of(context).size.width,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: colorWhite,
                ),
                scrollbarRadius: Radius.circular(10.w),
                scrollbarThickness: 1,
                scrollbarAlwaysShow: true,
                offset: const Offset(-20, 0),
              ),
            ))),
      ],
    );
  }

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
        : Obx(() => ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              itemBuilder: (context, index) {
                if (index == controller.listSearch.length) {
                  return const ItemLoading();
                }
                return ItemSearchWidget(
                  ob: controller.listSearch[index],
                  callBackOpenDetail: (ob) => controller.openDoctorDetail(ob),
                  callBackFavourite: (id) {},
                );
              },
              separatorBuilder: (context, index) => Container(
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
              Obx(() => AppButton(
                    backgroundColor: (controller.isCity.value == true)
                        ? colorGrey20
                        : colorWhite,
                    title: LocaleKeys.offline.tr,
                    onPress: () => controller.actionSearch(true),
                    textStyle: typoNormalTextBold,
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    shapeBorder: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(5.h))),
                  )),
              Obx(() => AppButton(
                    backgroundColor: (controller.isCity.value == true)
                        ? colorWhite
                        : colorGrey20,
                    title: LocaleKeys.online.tr,
                    onPress: () => controller.actionSearch(false),
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
                Obx(() => Visibility(
                      child: SizedBox(
                        height: 37.h,
                        child: TypeAheadField(
                          hideSuggestionsOnKeyboardHide: false,
                          textFieldConfiguration: TextFieldConfiguration(
                              controller: controller.cityController,
                              autofocus: false,
                              style: typoSmallTextBold.copyWith(
                                  color: colorText80,
                                  fontWeight: FontWeight.w400),
                              decoration: InputDecoration(
                                  focusColor: colorGrey20,
                                  hintText: LocaleKeys.address.tr,
                                  labelStyle: styleTextField.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: colorText80,
                                      fontSize: 10.sp),
                                  hintStyle: styleTextField.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: colorText80,
                                      fontSize: 14.sp),
                                  suffixIcon: const Icon(
                                    Icons.keyboard_arrow_down,
                                    color: colorBlack,
                                    size: 20,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: colorBlack, width: 0.7),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7.h))),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7.h))))),
                          itemBuilder: (context, CityResponse suggestion) {
                            return ListTile(
                              leading: const Icon(Icons.pin_drop_outlined),
                              title: Text(
                                suggestion.city!,
                                style: typoSmallTextRegular,
                              ),
                            );
                          },
                          noItemsFoundBuilder: (c) => AppText(
                            LocaleKeys.not_result.tr,
                            style: typoSmallTextRegular,
                          ),
                          onSuggestionSelected: (CityResponse city) =>
                              controller.setCity(city),
                          suggestionsCallback: (pattern) {
                            return controller.filterCity(pattern);
                          },
                        ),
                      ),
                      visible: controller.isCity.value,
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
      minWidth: MediaQuery.of(context).size.width,
      onPressed: () => controller.handleSearch(
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
