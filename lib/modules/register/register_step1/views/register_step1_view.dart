import 'package:docsify/components/app_button.dart';
import 'package:docsify/components/app_check_box.dart';
import 'package:docsify/components/app_scalford.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/components/app_text_button.dart';
import 'package:docsify/components/app_text_field.dart';
import 'package:docsify/const/resource.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/modules/login/controllers/login_controller.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controllers/register_step1_controller.dart';

class RegisterStep1View extends GetView<RegisterStep1Controller> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: colorBackgroundGrey10,
      appbar: AppBar(
        elevation: 1,
        backgroundColor: colorWhite,
        centerTitle: true,
        title: titleWidget(),
        titleTextStyle:
            typoNormalTextBold.copyWith(fontSize: 17.sp, color: colorBlackGrey),
      ),
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
                  Obx(() => itemTextFiled(
                      controller.emailController, controller.errorEmail.value)),
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
                  Obx(() => itemTextFiled(
                      controller.rePassController, controller.errorRePass.value,
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
                  itemTextTitle(LocaleKeys.business_name.tr),
                  SizedBox(
                    height: 5.h,
                  ),
                  Obx(() => itemTextFiled(
                        controller.businessNameController,
                        controller.errorBusinessName.value,
                      )),
                  itemTextTitle(LocaleKeys.phone_number.tr),
                  SizedBox(
                    height: 5.h,
                  ),
                  Obx(() => itemTextFiled(controller.phoneNumberController,
                      controller.errorPhoneNumber.value,
                      textInputType: TextInputType.phone)),
                  itemTextTitle(LocaleKeys.birth_date.tr),
                  SizedBox(
                    height: 5.h,
                  ),
                  Obx(() => itemTextFiled(controller.birthDateController,
                      controller.errorBirthDate.value,
                      readOnly: true,
                      onTap: () => controller.pickDate(context))),
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
                          value: controller.isAgreeTerm.value,
                          onChanged: (value) => controller.checkTerm())),
                      AppText(
                        LocaleKeys.i_agree_term.tr,
                        style: typoSmallTextRegular,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Obx(() => AppButton(
                        disable: controller.isAgreeTerm.value,
                        borderRadius: 6.h,
                        textStyle: typoNormalTextBold.copyWith(
                            color: colorText5, fontWeight: FontWeight.w700),
                        height: 40.h,
                        width: MediaQuery.of(context).size.width,
                        title: LocaleKeys.create_account.tr,
                        onPress: () => controller.handleRegister(context),
                        backgroundColor: colorBlue80,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            actionWidget()
          ],
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

  Widget actionWidget() {
    return Container(
      color: colorWhite,
      padding: EdgeInsets.all(1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextButton(
              textStyle: typoMediumTextBold.copyWith(
                  fontSize: 12.sp,
                  color: colorBlue100,
                  decoration: TextDecoration.underline),
              buttonTitle: LocaleKeys.contact.tr,
              onPressed: () => controller.handleAction(LoginAction.CONTACT)),
          AppTextButton(
              textStyle: typoMediumTextBold.copyWith(
                  fontSize: 12.sp,
                  color: colorBlue100,
                  decoration: TextDecoration.underline),
              buttonTitle: LocaleKeys.regulation.tr,
              onPressed: () => controller.handleAction(LoginAction.REGULATION)),
          AppTextButton(
              textStyle: typoMediumTextBold.copyWith(
                  fontSize: 12.sp,
                  color: colorBlue100,
                  decoration: TextDecoration.underline),
              buttonTitle: LocaleKeys.cookies.tr,
              onPressed: () => controller.handleAction(LoginAction.COOKIES)),
          AppTextButton(
              textStyle: typoMediumTextBold.copyWith(
                  fontSize: 12.sp,
                  color: colorBlue100,
                  decoration: TextDecoration.underline),
              buttonTitle: LocaleKeys.privacy.tr,
              onPressed: () => controller.handleAction(LoginAction.POLICY))
        ],
      ),
    );
  }

  Widget titleWidget() {
    return Row(
      children: [
        SvgPicture.asset(R.assetsSvgIconAppBarSvg),
        const Spacer(),
        AppText(
          LocaleKeys.how_to_work.tr,
          style:
              typoSmallTextBold.copyWith(decoration: TextDecoration.underline),
        ),
        SizedBox(
          width: 25.w,
        ),
        InkWell(
          child: SvgPicture.asset(R.assetsSvgLoginSvg),
          onTap: () {},
        ),
        AppTextButton(
          onPressed: () {},
          buttonTitle: LocaleKeys.login.tr,
          textStyle:
              typoSmallTextBold.copyWith(decoration: TextDecoration.underline),
        ),
      ],
    );
  }
}
