import 'package:docsify/components/app_button.dart';
import 'package:docsify/components/app_scalford.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/components/app_text_field.dart';
import 'package:docsify/const/resource.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:docsify/utils/app_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../components/app_dotted_line.dart';
import '../controllers/register_step1_controller.dart';

class RegisterStep1View extends GetView<RegisterStep1Controller> {
  const RegisterStep1View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.hideKeyboard(context),
      child: AppScaffold(
        backgroundColor: colorBackgroundGrey10,
        appbar: appBarWidget(context),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 15.h,
                  ),
                  AppText(
                    LocaleKeys.create_account.tr,
                    style:
                        typoLargeTextBold.copyWith(fontWeight: FontWeight.w700),
                  ),
                  const Spacer(),
                  AppText(
                    LocaleKeys.step.tr,
                    style: typoSmallTextRegular.copyWith(
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Container(
                    width: 20.w,
                    height: 20.w,
                    alignment: Alignment.center,
                    child: AppText(
                      '1',
                      style: typoSmallTextRegular.copyWith(color: colorText5),
                    ),
                    decoration: BoxDecoration(
                        color: colorBlue40,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.w),
                        )),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    width: 20.w,
                    height: 20.w,
                    alignment: Alignment.center,
                    child: AppText(
                      '2',
                      style: typoSmallTextRegular.copyWith(color: colorText5),
                    ),
                    decoration: BoxDecoration(
                        color: colorGrey80,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.w),
                        )),
                  ),
                  SizedBox(
                    width: 15.h,
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                decoration: BoxDecoration(
                    color: colorWhite,
                    borderRadius: BorderRadius.all(Radius.circular(10.h))),
                padding: EdgeInsets.all(15.w),
                margin: EdgeInsets.only(left: 15.h, right: 15.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    itemTextTitle(LocaleKeys.email_address.tr),
                    SizedBox(
                      height: 5.h,
                    ),
                    Obx(() => itemTextFiled(controller.emailController,
                        controller.errorEmail.value)),
                    itemTextTitle(LocaleKeys.pass.tr),
                    SizedBox(
                      height: 5.h,
                    ),
                    Obx(() => itemTextFiled(
                        controller.passController, controller.errorPass.value,
                        obscureText: controller.isHidePass.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isHidePass.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: colorNeutralDark60,
                          ),
                          onPressed: () => controller.changeHidePass(),
                        ))),
                    itemTextTitle(LocaleKeys.retype_pass.tr),
                    SizedBox(
                      height: 5.h,
                    ),
                    Obx(() => itemTextFiled(controller.rePassController,
                        controller.errorRePass.value,
                        obscureText: controller.isHideRsPass.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isHideRsPass.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: colorNeutralDark60,
                          ),
                          onPressed: () => controller.changeHideRePass(),
                        ))),
                    SizedBox(
                      height: 15.h,
                    ),
                    AppButton(
                      disable: false,
                      borderRadius: 6.h,
                      textStyle: typoNormalTextBold.copyWith(
                          color: colorText5, fontWeight: FontWeight.w700),
                      height: 40.h,
                      width: MediaQuery.of(context).size.width,
                      title: LocaleKeys.ok.tr,
                      onPress: () => controller.handleRegister(context),
                      backgroundColor: colorBlue80,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Stack(
                children: [
                  const Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: AppDotsLine(),
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: AppText(
                        LocaleKeys.register_with.tr,
                        style: typoMediumTextBold.copyWith(
                            backgroundColor: colorBackgroundWhite,
                            fontWeight: FontWeight.w600),
                      ),
                      color: colorBackgroundWhite,
                      padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    child: SvgPicture.asset(
                      R.assetsSvgFacebook2Svg,
                      height: 35.w,
                      width: 35.w,
                      fit: BoxFit.cover,
                    ),
                    onTap: () => controller.handleFacebookSignIn(context),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  InkWell(
                    child: SvgPicture.asset(
                      R.assetsSvgGoogleSvg,
                      height: 40.w,
                      width: 35.w,
                      fit: BoxFit.cover,
                    ),
                    onTap: () => controller.handleGoogleSignIn(context),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemTextTitle(String title) {
    return RichText(
      text: TextSpan(
          text: title,
          style: typoSmallTextBold.copyWith(color: colorText80),
          children: const [
            TextSpan(text: " *", style: TextStyle(color: Colors.red)),
          ]),
    );
  }

  Widget itemTextFiled(TextEditingController controller, String errorText,
      {TextInputAction textInputAction = TextInputAction.next,
      TextInputType textInputType = TextInputType.text,
      bool obscureText = false,
      IconButton? suffixIcon,
      bool readOnly = false,
      VoidCallback? onTap}) {
    return AppTextField(
      onTap: () {
        if (onTap != null) onTap.call();
      },
      readOnly: readOnly,
      obscureText: obscureText,
      suffixIcon: suffixIcon,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      controller: controller,
      errorText: errorText,
      textStyle: typoSmallTextBold.copyWith(color: colorText80),
      hintStyle: styleTextField.copyWith(
          fontWeight: FontWeight.w700, color: colorText80, fontSize: 16.sp),
    );
  }

  AppBar appBarWidget(BuildContext context) {
    return AppBar(
      elevation: 1,
      backgroundColor: colorWhite,
      title: AppText(
        LocaleKeys.register.tr,
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
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.clear,
              color: colorBlack,
            ))
      ],
      toolbarHeight: 50.h,
    );
  }
}
