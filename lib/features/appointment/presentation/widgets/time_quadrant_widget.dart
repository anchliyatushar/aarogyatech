import 'package:aarogyatech/shared/shared.dart';
import 'package:dashed_circular_progress_bar/dashed_circular_progress_bar.dart';
import 'package:flutter/material.dart';

class AppointmentQuadrantWidget extends StatelessWidget {
  final Widget child;
  const AppointmentQuadrantWidget({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return DashedCircularProgressBar.square(
      dimensions: 74,
      progress: 180,
      maxProgress: 360,
      foregroundColor: AppColors.blueColor,
      backgroundColor: AppColors.tabBarColor,
      foregroundStrokeWidth: 7,
      backgroundStrokeWidth: 7,
      child: child,
    );
  }
}
