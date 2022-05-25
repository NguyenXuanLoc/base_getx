import 'package:docsify/app/routes/app_pages.dart';
import 'package:docsify/components/app_button.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/components/app_text_button.dart';
import 'package:docsify/components/app_text_field.dart';
import 'package:docsify/components/dialogs.dart';
import 'package:docsify/config/constant.dart';
import 'package:docsify/const/resource.dart';
import 'package:docsify/data/provider/user_provider.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:docsify/utils/app_utils.dart';
import 'package:docsify/utils/toast_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:docsify/services/globals.dart' as globals;

class ActiveCodeDialog extends StatefulWidget {
  final String email;

  const ActiveCodeDialog({Key? key, required this.email}) : super(key: key);

  @override
  _ActiveCodeDialogState createState() => _ActiveCodeDialogState();
}

class _ActiveCodeDialogState extends State<ActiveCodeDialog> {
  final userProvider = UserProvider();
  final codeController = TextEditingController();
  var errorCode = '';
  var isActiveCodeSuggest = false;

  @override
  void initState() {
    getActiveEmail();
    super.initState();
  }

  bool isValid() {
    var code = codeController.text;
    var isValid = true;
    if (code.isEmpty) {
      isValid = false;
      errorCode = LocaleKeys.please_input_your_code.tr;
    } else if (code.length < 6) {
      isValid = false;
      errorCode = LocaleKeys.please_input_valid_code.tr;
    } else {
      errorCode = '';
    }
    setState(() {});
    return isValid;
  }

  void handleActiveCode(BuildContext context) async {
    if (isValid()) {
      var code = codeController.text;
      Dialogs.showLoadingDialog(context);
      var result = await userProvider.activeCode(code);
      await Dialogs.hideLoadingDialog();
      if (result.error != null) {
        toast(result.error.toString());
      } else {
        if (result.message != MessageKey.egCodeIsValid &&
            result.message != MessageKey.plCodeIsValid) {
          setState(() {
            isActiveCodeSuggest = true;
          });
        } else {
          toast(result.message!);
        }
      }
    }
  }

  Future<void> getActiveEmail() async {
    if (globals.accountId.isNotEmpty) {
      var result = await userProvider.sentActiveEmail(globals.accountId);
      if (result.error != null) {
        toast(result.error.toString());
      }
    } else {
      resentActiveEmail(context);
    }
  }

  Future<void> resentActiveEmail(BuildContext context) async {
    Dialogs.showLoadingDialog(context);
    var result = await userProvider.resentActiveEmail(widget.email);
    await Dialogs.hideLoadingDialog();
    if (result.error != null) {
      toast(result.error.toString());
    } else {
      toast(result.message.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Material(
            child: Container(
          width: MediaQuery.of(context).size.width - 5.w,
          padding:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
          color: Colors.white,
          child:
              isActiveCodeSuggest ? activeSuccessWidget() : activeCodeWidget(),
        )),
      ),
      onTap: () => Utils.hideKeyboard(context),
    );
  }

  Widget activeCodeWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () => Dialogs.showQuitForgotPassDialog(
                context, () => Get.offAllNamed(Routes.HOME)),
            icon: SvgPicture.asset(R.assetsSvgClearCircleSvg),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        AppText(
          LocaleKeys.register_success.tr,
          textAlign: TextAlign.center,
          style: typoNormalTextBold.copyWith(
              fontWeight: FontWeight.w700, fontSize: 18.sp),
        ),
        SizedBox(
          height: 10.h,
        ),
        AppText(
          LocaleKeys.message_sent_active_code.tr,
          textAlign: TextAlign.center,
          style: typoNormalTextRegular.copyWith(
              fontSize: 15.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 15.h,
        ),
        TextField(
          controller: codeController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(7.w),
            focusedErrorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: colorGrey80)),
            errorBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: colorGrey80)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: colorGrey80)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: colorGrey80)),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: colorGrey20)),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Align(
          child: Text(errorCode.toString().isNotEmpty ? errorCode : ' ',
              style: typoNormalTextRegular.copyWith(
                  color: colorSemanticRed100, fontSize: 11.sp)),
          alignment: Alignment.centerLeft,
        ),
        SizedBox(
          height: 3.h,
        ),
        AppButton(
          borderRadius: 6.h,
          textStyle: typoMediumTextBold.copyWith(color: colorText5),
          height: 40.h,
          width: MediaQuery.of(context).size.width,
          title: LocaleKeys.active.tr,
          onPress: () => handleActiveCode(context),
          backgroundColor: colorBlue80,
        ),
        SizedBox(
          height: 20.h,
        ),
        AppText(
          LocaleKeys.dont_receive_email.tr,
          textAlign: TextAlign.center,
          style: typoNormalTextRegular.copyWith(
              fontSize: 15.sp, fontWeight: FontWeight.w500),
        ),
        AppTextButton(
          onPressed: () => resentActiveEmail(context),
          buttonTitle: LocaleKeys.click_here_to_resend.tr,
          textStyle: typoNormalTextRegular.copyWith(
              color: colorBlue100,
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              decorationColor: colorBlue100),
        )
      ],
    );
  }

  Widget activeSuccessWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            onPressed: () => Dialogs.showQuitForgotPassDialog(
                context, () => Get.offAllNamed(Routes.HOME)),
            icon: SvgPicture.asset(R.assetsSvgClearCircleSvg),
          ),
        ),
        SizedBox(
          height: 60.h,
        ),
        AppText(
          LocaleKeys.active_success.tr,
          textAlign: TextAlign.center,
          style: typoNormalTextBold.copyWith(
              fontWeight: FontWeight.w700, fontSize: 18.sp),
        ),
        SizedBox(
          height: 30.h,
        ),
        AppText(
          LocaleKeys.you_has_been_activated_success.tr,
          textAlign: TextAlign.center,
          style: typoNormalTextRegular.copyWith(
              fontSize: 15.sp, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 15.h,
        ),
        AppButton(
          borderRadius: 6.h,
          textStyle: typoMediumTextBold.copyWith(color: colorText5),
          height: 40.h,
          width: MediaQuery.of(context).size.width,
          title: LocaleKeys.login.tr,
          onPress: () {
            Get.offAllNamed(Routes.HOME, arguments: true);
          },
          backgroundColor: colorBlue80,
        ),
      ],
    );
  }
}
