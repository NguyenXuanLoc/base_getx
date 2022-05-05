import 'package:docsify/components/app_button.dart';
import 'package:docsify/components/app_scalford.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/components/app_text_field.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../controllers/forgot_pass_controller.dart';

class ForgotPassView extends GetView<ForgotPassController> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appbar: AppBar(
          elevation: 1,
          title: Text(LocaleKeys.forgot_pass.tr),
          centerTitle: true,
          titleTextStyle: typoNormalTextBold.copyWith(
              fontSize: 17.sp, color: colorBlackGrey),
          backgroundColor: colorBackgroundColor,
          actions: [
            IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.clear,
                  color: colorBlackGrey,
                ))
          ],
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: colorBlue80,
            ),
            onPressed: () => Get.back(),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              AppText(
                LocaleKeys.app_name.tr.toUpperCase(),
                textAlign: TextAlign.center,
                style: typoLargeTextBold.copyWith(fontSize: 30.sp),
              ),
              SizedBox(
                height: 30.h,
              ),
              AppText(
                LocaleKeys.input_email_to_reset_pass.tr,
                textAlign: TextAlign.center,
                style: typoNormalTextRegular.copyWith(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: colorBlackGrey),
              ),
              SizedBox(
                height: 70.h,
              ),
              Obx(() => AppTextField(
                    controller: controller.emailController,
                    hintText: LocaleKeys.email_address.tr,
                    errorText: controller.errorEmail.value,
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
                title: LocaleKeys.sent.tr,
                onPress: () => controller.handleForgotPass(context),
                backgroundColor: colorBlue80,
              ),
            ],
          ),
        ));
  }
}
