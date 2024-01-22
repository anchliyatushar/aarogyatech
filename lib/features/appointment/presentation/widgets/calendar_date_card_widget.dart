import 'package:aarogyatech/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarDateCardWidget extends StatelessWidget {
  const CalendarDateCardWidget({
    required this.date,
    super.key,
    this.isSelected = false,
  });

  final DateTime date;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      duration: const Duration(milliseconds: 200),
      width: 68.w,
      decoration: BoxDecoration(
        borderRadius: UIUtils.borderRadius16px,
        boxShadow: isSelected ? UIUtils.boxShadowSmall : null,
        color: isSelected ? AppColors.whiteColor : AppColors.tabBarColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            date.formatDate('MMM'),
            style: AppText.text12w400PrimaryColor,
          ),
          Text(
            date.formatDate('dd'),
            style: AppText.text12w400PrimaryColor,
          ),
          SizedBox(height: 8.h),
          Text(
            date.formatDate('EEE'),
            style: AppText.text12w400PrimaryColor,
          ),
        ],
      ),
    );
  }
}
