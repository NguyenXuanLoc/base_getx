import 'package:docsify/components/app_button.dart';
import 'package:docsify/components/app_check_box.dart';
import 'package:docsify/components/app_rate.dart';
import 'package:docsify/components/app_scalford.dart';
import 'package:docsify/components/app_text.dart';
import 'package:docsify/components/app_text_button.dart';
import 'package:docsify/components/calendar_timeline/calendar_timeline.dart';
import 'package:docsify/components/item_loading.dart';
import 'package:docsify/components/my_listview.dart';
import 'package:docsify/generated/app_translation.dart';
import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:docsify/utils/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      backgroundColor: colorBackgroundWhite,
      body: Align(
        alignment: Alignment.center,
        child: Column(
          children: [
            AppTextButton(
              buttonTitle: "Google sign in",
              onPressed: () {
                controller.handleGoogleSignIn(context);
              },
            ),
            AppTextButton(
              buttonTitle: "Google sign out",
              onPressed: () {
                controller.handleGoogleSignOut();
              },
            )
          ],
        ),
      ),
    );
  }
}
