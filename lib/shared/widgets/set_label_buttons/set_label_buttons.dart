import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/themes/apptextstyles.dart';
import 'package:payflow/shared/widgets/divider/divider_vertical_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secundaryLabel;
  final VoidCallback secundaryOnPressed;
  final bool enablePrimaryColor;
  final bool enableSecundaryColor;

  const SetLabelButtons({
    required this.primaryLabel,
    required this.primaryOnPressed,
    required this.secundaryLabel,
    required this.secundaryOnPressed,
    this.enablePrimaryColor = false,
    this.enableSecundaryColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 57,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 1,
            height: 1,
            color: AppColors.stroke,
          ),
          Container(
            height: 56,
            child: Row(
              children: [
                Expanded(
                  child: LabelButton(
                    label: primaryLabel,
                    onPressed: primaryOnPressed,
                    style: enablePrimaryColor ? TextStyles.buttonPrimary : null,
                  ),
                ),
                DividerWidgetVertical(),
                Expanded(
                  child: LabelButton(
                    label: secundaryLabel,
                    onPressed: secundaryOnPressed,
                    style:
                        enableSecundaryColor ? TextStyles.buttonPrimary : null,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
