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
  const ForgotPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appbar: AppBar(
          elevation: 1,
          title: AppText(
            LocaleKeys.forgot_pass.tr,
            style: typoMediumTextBold,
          ),
          centerTitle: true,
          titleTextStyle: typoNormalTextBold.copyWith(
              fontSize: 17.sp, color: colorBlackGrey),
          backgroundColor: colorBackgroundColor,
          actions: [
            IconButton(
                onPressed: () => controller.showQuitDialog(context),
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
                height: 60.h,
              ),
              AppText(
                LocaleKeys.input_email_to_reset_pass.tr,
                textAlign: TextAlign.center,
                style: typoNormalTextRegular.copyWith(
                    fontSize: 17.sp, color: colorText100),
              ),
              SizedBox(
                height: 70.h,
              ),
              Obx(() => AppTextField(
                    controller: controller.emailController,
                    hintText: LocaleKeys.email_address.tr,
                    errorText: controller.errorEmail.value,
                    textStyle: typoMediumTextRegular.copyWith(
                        fontWeight: FontWeight.w500, fontSize: 16.sp),
                    hintStyle: typoSmallTextRegular,
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
