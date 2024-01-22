import 'package:aarogyatech/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextFormField extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final String? prefixText;

  const AppTextFormField({
    super.key,
    this.labelText,
    this.hintText,
    this.validator,
    this.inputFormatters,
    this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: ValueKey(labelText),
      style: AppText.text12w400PrimaryColor,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters:
          inputFormatters ?? [FilteringTextInputFormatter.allow(allowAll)],
      decoration: InputDecoration(
        labelText: labelText,
        prefixText: prefixText,
        fillColor: AppColors.tabBarColor,
        filled: true,
        hintText: hintText,
        hintStyle: AppText.text12w400PrimaryColor,
        labelStyle: AppText.text12w400PrimaryColor,
        border: OutlineInputBorder(borderRadius: UIUtils.borderRadius16px),
        focusColor: AppColors.blueColor,
      ),
    );
  }
}
