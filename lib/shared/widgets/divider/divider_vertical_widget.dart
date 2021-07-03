import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/appcolors.dart';

class DividerWidgetVertical extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: double.maxFinite,
      color: AppColors.stroke,
    );
  }
}
