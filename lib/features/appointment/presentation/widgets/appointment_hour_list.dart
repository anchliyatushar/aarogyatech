import 'package:aarogyatech/features/appointment/appointment.dart';
import 'package:aarogyatech/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentHourList extends StatelessWidget {
  final AppointmentSlotEnum timeSlot;
  const AppointmentHourList({super.key, required this.timeSlot});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 74.h,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: timeSlot.hoursList.length,
        separatorBuilder: (_, __) => SizedBox(width: 8.w),
        itemBuilder: (_, index) {
          return AppointmentQuadrantWidget(
            child: Center(
              child: Text(
                timeSlot.hoursList[index].toString(),
                style: AppText.text12w400PrimaryColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
