import 'package:aarogyatech/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum ButtonType { PRIMARY, SECONDARY, TEXT }

enum ButtonSize {
  /// Font size - 16
  /// Height - 48
  LARGE,

  /// Font size - 14
  /// Height - 40
  MEDIUM,

  /// Font size - 12
  /// Height - 32
  SMALL;

  double get getButtonSize {
    switch (this) {
      case ButtonSize.LARGE:
        return 48.h;
      case ButtonSize.MEDIUM:
        return 40.h;
      case ButtonSize.SMALL:
        return 32.h;

      default:
        return 48.h;
    }
  }

  TextStyle get getTextStyle {
    switch (this) {
      case ButtonSize.LARGE:
        return AppText.text16w700Button;
      case ButtonSize.MEDIUM:
        return AppText.text14w700Button;
      case ButtonSize.SMALL:
        return AppText.text12w700Button;
      default:
        return AppText.text16w700Button;
    }
  }
}
