import 'package:ecommerce_app/utils/app_colors.dart';
import 'package:ecommerce_app/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String labelText;
  final Widget? prefixIcon;
  final TextInputType keyboardType;
  final FocusNode focusNode;
  final TextEditingController controller;
  final bool readOnly;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final AutovalidateMode autoValidateMode;
  final int? maxLines;
  final int? maxLength;

  const CustomTextField({
    required this.controller,
    required this.labelText,
    this.prefixIcon,
    this.keyboardType = TextInputType.text,
    required this.focusNode,
    this.readOnly = false,
    this.validator,
    this.onChanged,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.maxLines,
    this.maxLength,
    super.key,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordHide = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: widget.autoValidateMode,
      validator: widget.validator,
      readOnly: widget.readOnly,
      controller: widget.controller,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      style: AppTextStyles.text16.copyWith(color: AppColors.darkGrey),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(left: 2.0, bottom: 12.0),
        border: InputBorder.none,
        hintText: widget.labelText,
        hintStyle: AppTextStyles.text16.copyWith(color: AppColors.darkGrey),
        prefixIcon: widget.prefixIcon,
      ),
    );
  }
}
