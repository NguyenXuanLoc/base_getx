import 'package:docsify/theme/app_styles.dart';
import 'package:docsify/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? errorText;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? autofocus;
  final bool? readOnly;
  final Function()? onEditingComplete;
  final Function(String)? onChanged;
  final Function()? onTap;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final InputDecoration? decoration;
  final FocusNode? focusNode;
  final Function(String)? onSubmitted;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool? enable;
  final double? height;

  const AppTextField(
      {this.controller,
      this.hintText,
      this.errorText,
      this.obscureText,
      this.keyboardType,
      this.textInputAction,
      this.maxLength,
      this.prefixIcon,
      this.suffixIcon,
      this.autofocus,
      this.readOnly,
      this.onEditingComplete,
      this.onChanged,
      this.onTap,
      Key? key,
      this.textStyle,
      this.hintStyle,
      this.decoration,
      this.focusNode,
      this.onSubmitted,
      this.maxLengthEnforcement,
      this.enable,
      this.height})
      : super(key: key);

  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: widget.enable,
      readOnly: widget.readOnly ?? false,
      maxLengthEnforcement: widget.maxLengthEnforcement,
      focusNode: widget.focusNode,
      controller: widget.controller,
      style: widget.textStyle?.copyWith(height: widget.height) ??
          styleTextField.copyWith(height: widget.height),
      obscureText: widget.obscureText ?? false,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      maxLength: widget.maxLength,
      autofocus: widget.autofocus ?? false,
      autocorrect: false,
      maxLines: widget.keyboardType == TextInputType.multiline ? 4 : 1,
      onEditingComplete: widget.onEditingComplete,
      onChanged: widget.onChanged,
      onSubmitted: (text) {
        if (widget.onSubmitted != null) widget.onSubmitted!(text);
      },
      onTap: widget.onTap,
      decoration: decorTextField.copyWith(
          hintText: widget.hintText,
          errorText: widget.errorText,
          errorStyle: typoNormalTextRegular.copyWith(
              color: colorSemanticRed100, fontSize: 11.sp),
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          hintStyle: widget.hintStyle),
    );
  }
}
