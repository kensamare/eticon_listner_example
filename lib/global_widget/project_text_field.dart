
import 'package:eticon_listner_example/global_utils/project_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectTextField extends StatefulWidget { // Некоректное название
  final TextEditingController? controllerForm;
  final String? hintText;
  final double hintTextFontSize;
  final String? Function(String?)? validate;
  final TextInputType keyboard;
  final Function(String)? onChange;
  final bool autoFocus;
  final Function()? onTapSuffixSvg;
  final Color? suffixSvgColor;
  final bool errorText;
  final Function()? onTap;
  final FocusNode? focusNode;
  final bool enabled;
  final int maxLines;
  final int minLines;
  final double borderRadius;
  final double textFontSize;
  final double contentPaddingVertical;
  final double contentPaddingHorizontal;
  final Function(String)? onFieldSubmitted;
  final TextCapitalization textCapitalization;


  ProjectTextField({
    this.focusNode,
    this.controllerForm,
    this.validate,
    this.hintText,
    this.keyboard = TextInputType.text,
    this.onChange,
    this.autoFocus = false,
    this.onTapSuffixSvg,
    this.suffixSvgColor,
    this.errorText = true,
    this.onTap,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines = 1,
    this.borderRadius = 1,
    this.textFontSize = 17,
    this.contentPaddingHorizontal = 0,
    this.contentPaddingVertical = 12,
    this.hintTextFontSize = 17,
    this.onFieldSubmitted,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  _ProjectTextFieldState createState() => _ProjectTextFieldState();
}

class _ProjectTextFieldState extends State<ProjectTextField> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textCapitalization: widget.textCapitalization,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      onTap: widget.onTap,
      enabled: widget.enabled,
      autofocus: widget.autoFocus,
      focusNode: widget.focusNode,
      onFieldSubmitted: widget.onFieldSubmitted,
      style: TextStyle(
          fontSize: 16.w,
          fontWeight: FontWeight.w400,
          fontFamily: 'OpenSans',
          color: ProjectColors.black),
      onChanged: widget.onChange,
      keyboardType: widget.keyboard,
      controller: widget.controllerForm,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyle(
            fontSize: 16.w,
            fontWeight: FontWeight.w400,
            fontFamily: 'OpenSans',
            color: ProjectColors.grey),
        isDense: true,
        contentPadding:
        EdgeInsets.symmetric(vertical: 10.w, horizontal: 15.w),
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(1.w)),
          borderSide: BorderSide(color: ProjectColors.borderGrey, width: 1.0.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(1.w)),
          borderSide: BorderSide(color: ProjectColors.borderGrey, width: 1.0.w),
        ),
        disabledBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(
                1.w)),
            borderSide: BorderSide(
                color: ProjectColors.borderGrey, width: 1.0.w)),
        focusedBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(1.w)),
            borderSide: BorderSide(
                color: ProjectColors.borderGrey, width: 1.0.w)),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(1.w)),
            borderSide: BorderSide(
                color: ProjectColors.red, width: 1.0.w)),
        errorBorder: OutlineInputBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(1.w)),
            borderSide: BorderSide(
                color: ProjectColors.red, width: 1.0.w)),
        errorStyle: widget.errorText
            ? TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 12.w,
          fontWeight: FontWeight.w400,
          color: ProjectColors.red,
        )
            : TextStyle(
          height: 0,
        ),
      ),
      validator: widget.validate,
    );
  }
}