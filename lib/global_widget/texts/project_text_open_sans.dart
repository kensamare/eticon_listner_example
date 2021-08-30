
import 'package:eticon_listner_example/global_utils/project_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProjectTextOpenSans extends StatelessWidget {
  final String text;
  final double size;
  final double? height;
  final FontWeight fontWeight;
  final TextAlign align;
  final Color color;

  ProjectTextOpenSans(
      {this.text = '',
      this.fontWeight = FontWeight.w700,
      this.align = TextAlign.center,
      this.height,
      this.color = ProjectColors.black,
      this.size = 14});

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      textAlign: this.align,
      style: TextStyle(
        fontFamily: "OpenSans",
        fontSize: this.size.w,
        fontWeight: this.fontWeight,
        color: this.color,
        height: this.height,
      ),
    );
  }
}
