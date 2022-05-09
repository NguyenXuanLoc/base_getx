import 'package:docsify/components/app_button.dart';
import 'package:docsify/components/app_check_box.dart';
import 'package:docsify/components/app_scalford.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/components/app_text_field.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/register_step2_controller.dart';

class RegisterStep2View extends GetView<RegisterStep2Controller> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: AppBar(
        elevation: 1,
        backgroundColor: colorWhite,
        centerTitle: true,
        title: Text(
          LocaleKeys.register_step2.tr,
          style:
              typoNormalTextBold.copyWith(color: colorBlack, fontSize: 17.sp),
        ),
        titleTextStyle:
            typoNormalTextBold.copyWith(fontSize: 17.sp, color: colorBlack),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: colorBlue80,
          ),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.clear,
                color: colorBlackGrey,
              ))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15.h),
        child: Column(
          children: [
            SizedBox(
              height: 40.h,
            ),
            AppText(
              LocaleKeys.app_name.tr,
              style: typoNormalTextBold.copyWith(fontSize: 30.sp),
            ),
            SizedBox(
              height: 30.h,
            ),
            Obx(() => AppTextField(
                  controller: controller.fullNameController,
                  errorText: controller.errorFullName.value,
                  textInputAction: TextInputAction.next,
                  hintText: LocaleKeys.business_name.tr,
                  textStyle: styleTextFieldBold.copyWith(
                      fontWeight: FontWeight.w500, fontSize: 16.sp),
                  hintStyle: styleTextField.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorText80,
                      fontSize: 16.sp),
                )),
            SizedBox(
              height: 20.h,
            ),
            Obx(() => AppTextField(
                  maxLength: 50,
                  errorText: controller.errorPhoneNumber.value,
                  controller: controller.phoneNumberController,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.next,
                  hintText: LocaleKeys.phone_number.tr,
                  textStyle: styleTextFieldBold.copyWith(
                      fontWeight: FontWeight.w500, fontSize: 16.sp),
                  hintStyle: styleTextField.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorText80,
                      fontSize: 16.sp),
                )),
            SizedBox(
              height: 20.h,
            ),
            Obx(() => AppTextField(
                  readOnly: true,
                  controller: controller.birthDateController,
                  errorText: controller.errorBirthDate.value,
                  autofocus: false,
                  onTap: () => controller.pickDate(context),
                  hintText: LocaleKeys.birth_date.tr,
                  textStyle: styleTextFieldBold.copyWith(
                      fontWeight: FontWeight.w500, fontSize: 16.sp),
                  hintStyle: styleTextField.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorText80,
                      fontSize: 16.sp),
                )),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Obx(() => AppCheckBox(
                    icon: const Icon(
                      Icons.check,
                      size: 15,
                      color: colorBlue80,
                    ),
                    value: controller.isAgree.value,
                    onChanged: (value) => controller.handleTerm())),
                AppText(
                  LocaleKeys.i_agree_term.tr,
                  style: typoNormalTextBold.copyWith(fontSize: 16.sp),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Obx(() => AppButton(
                  disable: controller.isAgree.value,
                  borderRadius: 6.h,
                  textStyle: typoMediumTextBold.copyWith(color: colorText5),
                  height: 40.h,
                  width: MediaQuery.of(context).size.width,
                  title: LocaleKeys.register.tr,
                  onPress: () => controller.updateProfile(context),
                  backgroundColor: colorBlue80,
                )),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
      ),
    );
  }
}
