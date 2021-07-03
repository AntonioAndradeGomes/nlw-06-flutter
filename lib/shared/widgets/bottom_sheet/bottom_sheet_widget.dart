import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/themes/apptextstyles.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BottomSheetWidget extends StatelessWidget {
  final String primaryLabel, title, subtitle, secundaryLabel;
  final VoidCallback primaryOnPressed, secundaryOnPressed;

  const BottomSheetWidget({
    required this.primaryLabel,
    required this.title,
    required this.subtitle,
    required this.secundaryLabel,
    required this.primaryOnPressed,
    required this.secundaryOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text.rich(
                        TextSpan(
                          text: title,
                          style: TextStyles.buttonBoldHeading,
                          children: [
                            TextSpan(
                              text: "\n$subtitle",
                              style: TextStyles.buttonHeading,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    /*Divider(
                      thickness: 1,
                      color: AppColors.stroke,
                      
                    ),*/
                    Container(
                      height: 1,
                      color: AppColors.stroke,
                    ),
                    SetLabelButtons(
                      enablePrimaryColor: true,
                      primaryLabel: primaryLabel,
                      primaryOnPressed: primaryOnPressed,
                      secundaryLabel: secundaryLabel,
                      secundaryOnPressed: secundaryOnPressed,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
