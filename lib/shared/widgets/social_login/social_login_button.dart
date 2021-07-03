import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/appcolors.dart';
import 'package:payflow/shared/themes/appimages.dart';
import 'package:payflow/shared/themes/apptextstyles.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;
  const SocialLoginButton({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: AppColors.shape,
          borderRadius: BorderRadius.circular(5),
          border: Border.fromBorderSide(
            BorderSide(
              color: AppColors.stroke,
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.google,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    height: 56,
                    width: 1,
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Entrar com o Google',
                    style: TextStyles.buttonGray,
                  ),
                ],
              ),
            ),
            //Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
