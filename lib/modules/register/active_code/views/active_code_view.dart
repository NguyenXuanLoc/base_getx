import 'package:docsify/components/app_button.dart';
import 'package:docsify/components/app_scalford.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/components/app_text_button.dart';
import 'package:docsify/components/app_text_field.dart';
import 'package:docsify/const/resource.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/modules/register/active_code/controllers/active_code_controller.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ActiveCodeView extends GetView<ActiveCodeController> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: AppBar(
        elevation: 1,
        backgroundColor: colorWhite,
        centerTitle: true,
        titleTextStyle:
            typoNormalTextBold.copyWith(fontSize: 17.sp, color: colorBlack),
        actions: [
          SizedBox(
            width: 10.w,
          ),
          SvgPicture.asset(R.assetsSvgIconAppBarSvg),
          SizedBox(
            width: 20.w,
          ),
          Align(
            alignment: Alignment.center,
            child: AppText(
              LocaleKeys.app_name.tr,
              textAlign: TextAlign.center,
              style: typoNormalTextBold.copyWith(fontSize: 19.sp),
            ),
          ),
          Spacer()
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(15.h),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            AppText(
              LocaleKeys.register_success.tr,
              textAlign: TextAlign.center,
              style: typoNormalTextBold.copyWith(fontSize: 30.sp),
            ),
            SizedBox(
              height: 30.h,
            ),
            AppText(
              LocaleKeys.message_sent_active_code.tr,
              textAlign: TextAlign.center,
              style: typoNormalTextRegular.copyWith(
                  fontSize: 20.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 30.h,
            ),
            Obx(() => AppTextField(
                  maxLength: 6,
                  controller: controller.codeController,
                  errorText: controller.errorCode.value,
                  keyboardType: TextInputType.number,
                  hintText: LocaleKeys.fill_active_code_here.tr,
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
              title: LocaleKeys.active.tr,
              onPress: () => controller.handleActiveCode(context),
              backgroundColor: colorBlue80,
            ),
            SizedBox(
              height: 40.h,
            ),
            AppText(
              LocaleKeys.dont_receive_email.tr,
              textAlign: TextAlign.center,
              style: typoNormalTextRegular.copyWith(
                  fontSize: 18.sp, fontWeight: FontWeight.w500),
            ),
            AppTextButton(
              onPressed: () => controller.resentActiveEmail(context),
              buttonTitle: LocaleKeys.click_here_to_resend.tr,
              textStyle: typoNormalTextRegular.copyWith(
                  color: colorBlue100,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  decorationColor: colorBlue100,
                  decoration: TextDecoration.underline),
            )
          ],
        ),
      ),
    );
  }
}
