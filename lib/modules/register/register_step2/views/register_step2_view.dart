import 'package:docsify/components/app_button.dart';
import 'package:docsify/components/app_check_box.dart';
import 'package:docsify/components/app_scalford.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/components/app_text_button.dart';
import 'package:docsify/components/app_text_field.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:docsify/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../const/resource.dart';
import '../controllers/register_step2_controller.dart';

class RegisterStep2View extends GetView<RegisterStep2Controller> {
  const RegisterStep2View({Key? key}) : super(key: key);

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
                    child: const Icon(
                      Icons.check,
                      size: 13,
                      color: colorWhite,
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
                        color: colorBlue40,
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
                    itemTextTitle(LocaleKeys.full_name.tr),
                    SizedBox(
                      height: 5.h,
                    ),
                    Obx(() => itemTextFiled(
                          controller.fullNameController,
                          controller.errorFullName.value,
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
                    SizedBox(
                      height: 15.h,
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
                          style: typoSmallTextRegular,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Obx(() => AppButton(
                          disable: !controller.isAgree.value,
                          borderRadius: 6.h,
                          textStyle: typoNormalTextBold.copyWith(
                              color: colorText5, fontWeight: FontWeight.w700),
                          height: 40.h,
                          width: MediaQuery.of(context).size.width,
                          title: LocaleKeys.create_account.tr,
                          onPress: () => controller.updateProfile(context),
                          backgroundColor: controller.isAgree.value
                              ? colorBlue80
                              : colorBlue100,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
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
      title: Text(
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
            onPressed: () => controller.showQuitDialog(context),
            icon: const Icon(
              Icons.clear,
              color: colorBlack,
            ))
      ],
      toolbarHeight: 50.h,
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
