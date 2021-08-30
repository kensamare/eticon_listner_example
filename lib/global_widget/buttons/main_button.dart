
import 'package:eticon_listner_example/global_utils/project_color.dart';
import 'package:eticon_listner_example/global_widget/texts/project_text_open_sans.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class MainButton extends StatelessWidget {
  final bool isWhite;
  final String text;
  final Function()? onPressed;

  MainButton({required this.text, this.isWhite = false, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        height: 50.w,
        width: 280.w,
        decoration: BoxDecoration(
          color: this.isWhite ? ProjectColors.white : ProjectColors.violet,
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(color: ProjectColors.violet, width: this.isWhite ? 1.w : 0)
        ),
        child: Center(
          child: ProjectTextOpenSans(
            text: this.text,
            size: 20,
            color: this.isWhite ? ProjectColors.violet : ProjectColors.white,
          ),
        ),
      ),
    );
  }
}
