import 'package:aarogyatech/shared/shared.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentCardWidget extends StatelessWidget {
  const AppointmentCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [UIUtils.boxShadowLarge],
      ),
      child: Row(
        children: [
          Container(
            color: AppColors.blueColor,
            width: 4.w,
            height: 150.h,
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Appointment date', style: AppText.text12w400PrimaryColor),
                SizedBox(height: 6.h),
                Row(
                  children: [
                    Icon(Icons.access_time_rounded, size: 24.r),
                    SizedBox(width: 8.w),
                    Text(
                      'Wed Nov 20',
                      style: AppText.text12w600PrimaryColor,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '•',
                      style: AppText.text16w700PrimaryColor,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '8:00 - 8:30 AM',
                      style: AppText.text12w600PrimaryColor,
                    )
                  ],
                ),
                SizedBox(height: 18.h),
                Container(
                  width: double.maxFinite,
                  margin: EdgeInsets.only(left: 8.w, right: 16.w),
                  height: 1.h,
                  color: AppColors.dividerColor,
                ),
                SizedBox(height: 18.h),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 24.r,
                      backgroundImage: const CachedNetworkImageProvider(
                        'https://xsgames.co/randomusers/avatar.php?g=male',
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Dr. Prem Tiwari',
                          style: AppText.text16w600PrimaryColor,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Orthopedic',
                          style: AppText.text14w400SecondaryColor,
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
