import 'package:aarogyatech/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIUtils {
  UIUtils._();
  static BorderRadius get borderRadius8px => BorderRadius.circular(8.r);

  ///Very Small Corner Radius
  ///4px with a 60% corner smoothing is used for widgets whose height is
  ///less than or equal to 64px. Example:
  static BorderRadius get borderRadius4px => BorderRadius.circular(4.r);

  ///Small Corner Radius
  ///12px with a 60% corner smoothing is used for widgets whose height is
  ///less than or equal to 64px. Example: Notification Cards
  static BorderRadius get borderRadius12px => BorderRadius.circular(12.r);

  ///Medium Corner Radius
  /// 16px with a 60% corner smoothing is used for components like cards, banners, etc.,
  static BorderRadius get borderRadius16px => BorderRadius.circular(16.r);
  static BorderRadius get borderRadius20px => BorderRadius.circular(20.r);

  ///Large Corner Radius
  ///24px with a 60% corner smoothing is used for components like main cards in the screen. Eg: Salary card and Loan card
  static BorderRadius get borderRadius24px => BorderRadius.circular(24.r);
  static BorderRadius get borderRadius32px => BorderRadius.circular(32.r);
  static BorderRadius get borderRadiusButtonCircular =>
      BorderRadius.circular(56.r);

  ///Full Corner Radius
  /// only for buttons
  static BorderRadius get borderRadiusCircular => BorderRadius.circular(120.r);

  static List<BoxShadow> get boxShadowSmall => [
        BoxShadow(
          blurRadius: 1.r,
          color: AppColors.black.withOpacity(0.2),
        ),
        BoxShadow(
          blurRadius: 24.r,
          spreadRadius: -8.r,
          offset: Offset(0, 4.h),
          color: AppColors.black.withOpacity(0.2),
        )
      ];
  static BoxShadow get boxShadowLarge => BoxShadow(
        blurRadius: 24.r,
        offset: Offset(2.w, 4.h),
        color: AppColors.black.withOpacity(0.04),
      );
  static BoxShadow get boxShadowLargeNegative => BoxShadow(
        blurRadius: 24.r,
        offset: Offset(-2.w, -4.h),
        color: AppColors.black.withOpacity(0.04),
      );
}
