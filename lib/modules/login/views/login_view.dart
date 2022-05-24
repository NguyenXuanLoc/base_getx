import 'package:docsify/components/app_button.dart';
import 'package:docsify/components/app_dotted_line.dart';
import 'package:docsify/components/app_scalford.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/components/app_text_button.dart';
import 'package:docsify/components/app_text_field.dart';
import 'package:docsify/const/resource.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:docsify/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.hideKeyboard(context),
      child: AppScaffold(
          backgroundColor: colorBackgroundGrey20,
          appbar: appBarWidget(context),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: colorBackgroundColor,
                      borderRadius: BorderRadius.all(Radius.circular(10.h))),
                  padding: EdgeInsets.only(
                      left: 20.h, right: 20.h, top: 5.h, bottom: 5.h),
                  margin: EdgeInsets.only(
                      left: 12.h, right: 12.h, bottom: 12.h, top: 40.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      AppText(
                        LocaleKeys.have_account.tr,
                        textAlign: TextAlign.center,
                        style: typoNormalTextBold.copyWith(
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          LocaleKeys.email_address.tr,
                          style: typoSmallTextBold.copyWith(
                              fontSize: 14.sp,
                              color: colorText80,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Obx(() => AppTextField(
                            textInputAction: TextInputAction.next,
                            controller: controller.emailController,
                            errorText: controller.errorEmail.value,
                            textStyle: typoSmallTextBold.copyWith(
                                color: colorText80,
                                fontWeight: FontWeight.w400),
                            hintStyle: styleTextField.copyWith(
                                fontWeight: FontWeight.w700,
                                color: colorText80,
                                fontSize: 16.sp),
                          )),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          LocaleKeys.pass.tr,
                          style: typoSmallTextBold.copyWith(
                              fontSize: 14.sp,
                              color: colorText80,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
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
                            textStyle: typoSmallTextBold.copyWith(
                                color: colorText80,
                                fontWeight: FontWeight.w400),
                            hintStyle: styleTextField.copyWith(
                                fontWeight: FontWeight.w700,
                                color: colorText80,
                                fontSize: 16.sp),
                          )),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: AppTextButton(
                          buttonTitle: LocaleKeys.forgot_pass.tr,
                          onPressed: () => controller
                              .handleAction(LoginAction.FORGOT_PASSWORD),
                          textStyle: typoNormalTextBold.copyWith(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w100,
                              color: colorBlue80,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      AppButton(
                        borderRadius: 6.h,
                        textStyle:
                            typoMediumTextBold.copyWith(color: colorText5),
                        height: 43.h,
                        width: MediaQuery.of(context).size.width,
                        title: LocaleKeys.login.tr,
                        onPress: () => controller.handleLoginByAccount(context),
                        backgroundColor: colorBlue80,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Stack(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: 20.h,
                            child: const AppDotsLine(),
                          ),
                          Container(
                            height: 20.h,
                            alignment: Alignment.center,
                            child: AppText(
                              "  ${LocaleKeys.or.tr}  ",
                              style: typoSmallTextRegular.copyWith(
                                  backgroundColor: colorWhite,
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 130.w,
                            child: OutlinedButton.icon(
                              onPressed: () =>
                                  controller.handleFacebookSignIn(context),
                              icon: SvgPicture.asset(
                                R.assetsSvgFacebookSvg,
                                width: 12.w,
                              ),
                              label: AppText(
                                LocaleKeys.facebook.tr,
                                style: typoSmallTextBold,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          SizedBox(
                            width: 130.w,
                            child: OutlinedButton.icon(
                              onPressed: () =>
                                  controller.handleGoogleSignIn(context),
                              icon: SvgPicture.asset(
                                R.assetsSvgGoogleSvg,
                                width: 20.w,
                              ),
                              label: AppText(
                                LocaleKeys.google.tr,
                                style: typoSmallTextBold,
                              ),
                            ),
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
                  margin: EdgeInsets.only(
                      left: 12.h, right: 12.h, top: 5.h, bottom: 5.h),
                  child: Column(
                    children: [
                      AppText(
                        LocaleKeys.here_for_first_time.tr,
                        style: typoMediumTextBold.copyWith(
                            fontWeight: FontWeight.w600, color: colorText80),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      AppButton(
                          disable: false,
                          padding: EdgeInsets.only(
                              left: 20.w, right: 20.r, top: 12.h, bottom: 12.h),
                          borderRadius: 6.h,
                          width: MediaQuery.of(context).size.width,
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
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                              color: colorSemanticRed100),
                          onPress: () =>
                              controller.handleAction(LoginAction.REGISTER)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                // actionWidget()
              ],
            ),
          )),
    );
  }

  Widget titleWidget() {
    return Row(
      children: [
        SizedBox(
          width: 10.w,
        ),
        SvgPicture.asset(
          R.assetsSvgIconAppBarSvg,
          height: 35.h,
        ),
        const Spacer(),
        AppButton(
            borderRadius: 6.h,
            padding: EdgeInsets.only(left: 12.w, right: 10.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.h),
            ),
            textStyle: typoSmallTextBold.copyWith(
                fontSize: 10.sp,
                color: colorPink100,
                fontWeight: FontWeight.w900),
            side: const BorderSide(
              color: colorPink40,
              width: 2,
            ),
            title: LocaleKeys.go_to_provider.tr,
            onPress: () => controller.handleAction(LoginAction.GO_TO_PROVIDER)),
        const Spacer(),
        InkWell(
            onTap: () => Get.back(),
            child: SvgPicture.asset(
              R.assetsSvgBackCircleSvg,
              height: 16.h,
            )),
        AppTextButton(
          onPressed: () {},
          buttonTitle: LocaleKeys.login.tr,
          textStyle: typoSmallTextBold,
        ),
        SizedBox(
          width: 15.w,
        ),
        InkWell(
          onTap: () => Get.back(),
          child: SvgPicture.asset(
            R.assetsSvgThreeDotsSvg,
            width: 17.w,
          ),
        )
      ],
    );
  }

  AppBar appBarWidget(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: colorWhite,
      title: Text(
        LocaleKeys.login.tr,
        style: typoLargeTextBold,
      ),
      centerTitle: true,
      leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            color: colorBlack,
          )),
      actions: [
        IconButton(
            onPressed: () => controller.showQuitDialog(context),
            icon: const Icon(
              Icons.clear,
              color: colorBlack,
            ))
      ],
      toolbarHeight: 50.h,
    );
  }

  Widget actionWidget() {
    return Container(
      color: colorWhite,
      padding: EdgeInsets.all(1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextButton(
              textStyle: typoMediumTextBold.copyWith(
                  fontSize: 13.sp,
                  color: colorBlue100,
                  decoration: TextDecoration.underline),
              buttonTitle: LocaleKeys.contact.tr,
              onPressed: () => controller.handleAction(LoginAction.CONTACT)),
          AppTextButton(
              textStyle: typoMediumTextBold.copyWith(
                  fontSize: 13.sp,
                  color: colorBlue100,
                  decoration: TextDecoration.underline),
              buttonTitle: LocaleKeys.regulation.tr,
              onPressed: () => controller.handleAction(LoginAction.REGULATION)),
          AppTextButton(
              textStyle: typoMediumTextBold.copyWith(
                  fontSize: 13.sp,
                  color: colorBlue100,
                  decoration: TextDecoration.underline),
              buttonTitle: LocaleKeys.cookies.tr,
              onPressed: () => controller.handleAction(LoginAction.COOKIES)),
          AppTextButton(
              textStyle: typoMediumTextBold.copyWith(
                  fontSize: 13.sp,
                  color: colorBlue100,
                  decoration: TextDecoration.underline),
              buttonTitle: LocaleKeys.privacy.tr,
              onPressed: () => controller.handleAction(LoginAction.POLICY))
        ],
      ),
    );
  }
}
