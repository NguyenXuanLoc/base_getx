import 'package:docsify/theme/colors.dart';
import 'package:flutter/material.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appbar;
  final Color? backgroundColor;

  const AppScaffold(
      {Key? key, required this.body, this.appbar, this.backgroundColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? colorBackgroundColor,
      resizeToAvoidBottomInset: false,
      appBar: appbar,
      body: SafeArea(
        child: body,
      ),
    );
  }
}
