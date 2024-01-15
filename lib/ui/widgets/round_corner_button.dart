import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class RoundCornerButton extends StatelessWidget {
  String buttonText;
  String? icon;
  Color? color, borderColor, textColor, iconColor;
  VoidCallback? onPressed;
  double? height;
  double? width;
  final double borderRadius;
  final double fontSize;

  RoundCornerButton(
      {Key? key,
      required this.buttonText,
      this.icon,
      this.iconColor,
      this.color = AppColors.primary,
      this.borderColor,
      this.textColor = AppColors.white,
      this.onPressed,
      this.height,
      this.fontSize = 16.0,
      this.borderRadius = 8.0,
      this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: height ?? 40,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(borderRadius)),
        child: Center(
          child: Text(
            buttonText,
            style: AppTextStyles.text14
                .copyWith(color: AppColors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
