import 'package:docsify/components/app_button.dart';
import 'package:docsify/components/app_scalford.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/components/app_text_field.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/generated/resource.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/register_step1_controller.dart';

class RegisterStep1View extends GetView<RegisterStep1Controller> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: AppBar(
        backgroundColor: colorWhite,
        centerTitle: true,
        title: Text(
          LocaleKeys.register_step1.tr,
          style: typoNormalTextBold.copyWith(
              color: colorBlackGrey, fontSize: 17.sp),
        ),
        titleTextStyle:
            typoNormalTextBold.copyWith(fontSize: 17.sp, color: colorBlackGrey),
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
                  controller: controller.emailController,
                  errorText: controller.errorEmail.value,
                  onSubmitted: (text) => controller.focusPass.requestFocus(),
                  textInputAction: TextInputAction.next,
                  hintText: LocaleKeys.email_address.tr,
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
                  obscureText: true,
                  maxLength: 50,
                  errorText: controller.errorPass.value,
                  controller: controller.passController,
                  focusNode: controller.focusPass,
                  textInputAction: TextInputAction.next,
                  hintText: LocaleKeys.pass.tr,
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
                  obscureText: true,
                  maxLength: 50,
                  controller: controller.rePassController,
                  errorText: controller.errorRePass.value,
                  focusNode: controller.focusRePass,
                  hintText: LocaleKeys.retype_pass.tr,
                  textStyle: styleTextFieldBold.copyWith(
                      fontWeight: FontWeight.w500, fontSize: 16.sp),
                  hintStyle: styleTextField.copyWith(
                      fontWeight: FontWeight.w700,
                      color: colorText80,
                      fontSize: 16.sp),
                )),
            SizedBox(
              height: 30.h,
            ),
            AppButton(
              borderRadius: 6.h,
              textStyle: typoMediumTextBold.copyWith(color: colorText5),
              height: 40.h,
              width: MediaQuery.of(context).size.width,
              title: LocaleKeys.enter.tr,
              onPress: () => controller.handleRegister(context),
              backgroundColor: colorBlue80,
            ),
            SizedBox(
              height: 30.h,
            ),
            Stack(
              children: [
                Container(
                  height: 30.h,
                  alignment: Alignment.center,
                  child: DottedLine(
                    direction: Axis.horizontal,
                    dashColor: Colors.black,
                    dashGapGradient: const [Colors.black, Colors.black],
                  ),
                ),
                Container(
                    height: 30.h,
                    margin: EdgeInsets.only(right: 10.h),
                    alignment: Alignment.center,
                    child: AppText(
                      "  ${LocaleKeys.register_with.tr}  ",
                      textAlign: TextAlign.center,
                      style: typoNormalTextRegular.copyWith(
                          fontWeight: FontWeight.w600,
                          backgroundColor: colorWhite),
                    )),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 40.w,
                  height: 40.h,
                  child: SvgPicture.asset(
                    R.assetsSvgFacebook,
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                SizedBox(
                  width: 35.w,
                  height: 35.h,
                  child: SvgPicture.asset(
                    R.assetsSvgGoogle,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
