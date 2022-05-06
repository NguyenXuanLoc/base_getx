import 'package:docsify/components/app_button.dart';
import 'package:docsify/components/app_scalford.dart';
import 'package:docsify/components/app_text_button.dart';
import 'package:docsify/components/app_text_field.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        backgroundColor: colorBackgroundGrey20,
        appbar: AppBar(
          toolbarHeight: 50.h,
          backgroundColor: colorWhite,
          centerTitle: true,
          title: Text(
            LocaleKeys.login.tr,
            style: typoMediumTextBold.copyWith(
                fontSize: 25.sp, color: colorText80),
          ),
          leading: const Icon(
            Icons.adb_outlined,
            color: colorBlackGrey,
          ),
          actions: [
            IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(
                  Icons.close,
                  color: colorBlackGrey,
                ))
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: colorBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.h))),
              padding: EdgeInsets.only(
                  left: 20.h, right: 20.h, top: 20.h, bottom: 10.h),
              margin: EdgeInsets.all(12.h),
              child: Column(
                children: [
                  Text(
                    LocaleKeys.have_account.tr,
                    style: typoMediumTextBold.copyWith(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w900,
                        color: colorText80),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      LocaleKeys.email_address.tr,
                      style: typoNormalTextBold.copyWith(color: colorText80),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Obx(() => AppTextField(
                        // autofocus: true,
                        textInputAction: TextInputAction.next,
                        controller: controller.emailController,
                        errorText: controller.errorEmail.value,
                        hintText: "Place holder",
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      LocaleKeys.pass.tr,
                      style: typoNormalTextBold.copyWith(color: colorText80),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(() => AppTextField(
                        controller: controller.passController,
                        errorText: controller.errorPass.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isHidePass.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: colorNeutralDark60,
                          ),
                          onPressed: () => controller.showHidePass(),
                        ),
                        obscureText: controller.isHidePass.value,
                        hintText: "Place holder",
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppTextButton(
                      buttonTitle: LocaleKeys.forgot_pass.tr,
                      onPressed: () =>
                          controller.handleAction(LoginAction.FORGOT_PASSWORD),
                      textStyle: typoNormalTextBold.copyWith(
                          fontWeight: FontWeight.w800, color: colorBlue80),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  AppButton(
                    borderRadius: 6.h,
                    textStyle: typoMediumTextBold.copyWith(color: colorText5),
                    height: 40.h,
                    width: MediaQuery.of(context).size.width,
                    title: LocaleKeys.login.tr,
                    onPress: () => controller.handleLoginByAccount(context),
                    backgroundColor: colorBlue80,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppTextButton(
                        onPressed: () =>
                            controller.handleFacebookSignIn(context),
                        buttonTitle: "Facebook",
                      ),
                      AppTextButton(
                        onPressed: () => controller.handleGoogleSignIn(context),
                        buttonTitle: "Google",
                      )
                    ],
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: colorBackgroundColor,
                  borderRadius: BorderRadius.all(Radius.circular(10.h))),
              padding: EdgeInsets.only(
                  left: 20.h, right: 20.h, top: 25.h, bottom: 25.h),
              margin: EdgeInsets.all(12.h),
              child: Column(
                children: [
                  Text(
                    LocaleKeys.here_for_first_time.tr,
                    style: typoMediumTextBold.copyWith(
                        fontWeight: FontWeight.w900, color: colorText80),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  AppButton(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.r, top: 12.h, bottom: 12.h),
                      borderRadius: 6.h,
                      side: const BorderSide(
                          color: colorSemanticRed100, width: 1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.h),
                          ),
                          border: Border.all(
                              width: 100.h, color: colorSemanticRed100)),
                      title: LocaleKeys.create_account.tr,
                      textStyle: typoMediumTextBold.copyWith(
                          color: colorSemanticRed100),
                      onPress: () =>
                          controller.handleAction(LoginAction.REGISTER)),
                ],
              ),
            ),
            const Spacer(),
            Container(
              color: colorBackgroundWhite,
              padding: EdgeInsets.all(1.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextButton(
                      textStyle: typoMediumTextBold.copyWith(
                          fontSize: 13.sp, color: colorBlue100),
                      buttonTitle: LocaleKeys.contact.tr,
                      onPressed: () =>
                          controller.handleAction(LoginAction.CONTACT)),
                  AppTextButton(
                      textStyle: typoMediumTextBold.copyWith(
                          fontSize: 13.sp, color: colorBlue100),
                      buttonTitle: LocaleKeys.regulation.tr,
                      onPressed: () =>
                          controller.handleAction(LoginAction.REGULATION)),
                  AppTextButton(
                      textStyle: typoMediumTextBold.copyWith(
                          fontSize: 13.sp, color: colorBlue100),
                      buttonTitle: LocaleKeys.cookies.tr,
                      onPressed: () =>
                          controller.handleAction(LoginAction.COOKIES)),
                  AppTextButton(
                      textStyle: typoMediumTextBold.copyWith(
                          fontSize: 13.sp, color: colorBlue100),
                      buttonTitle: LocaleKeys.privacy.tr,
                      onPressed: () =>
                          controller.handleAction(LoginAction.POLICY))
                ],
              ),
            )
          ],
        ));
  }
}
