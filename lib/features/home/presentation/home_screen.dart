import 'package:aarogyatech/features/appointment/appointment.dart';
import 'package:aarogyatech/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        borderRadius: BorderRadius.circular(32.r),
        panel: _renderAllServicesSection(),
        isDraggable: false,
        defaultPanelState: PanelState.OPEN,
        maxHeight: _getMaxHeight(),
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset('assets/home/gradient.png'),
            ),
            Container(
              constraints: BoxConstraints(maxHeight: 310.h),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/home/doctor.png',
                ),
              ),
            ),
            _renderHomeTopBanner(),
          ],
        ),
      ),
    );
  }

  Widget _renderAllServicesSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(40.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 32.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Appointment', style: AppText.text16w700PrimaryColor),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const AppointmentList()),
                  );
                },
                child: Text(
                  'See All',
                  style: AppText.text14w700SecondaryButton,
                ),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          const AppointmentCardWidget(),
        ],
      ),
    );
  }

  Widget _renderHomeTopBanner() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AppBarWidget(),
            SizedBox(height: 8.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome!\nRajesh',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                    color: AppColors.textPrimaryColor,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'How is it going today?',
                  style: TextStyle(
                    fontSize: 16.sp,
                    height: 1.5,
                    color: AppColors.textSecondaryColor,
                  ),
                ),
                SizedBox(height: 24.h),
                AppButton(
                  size: ButtonSize.MEDIUM,
                  leftIcon: Icon(
                    Icons.volunteer_activism_rounded,
                    size: 16.r,
                    color: AppColors.whiteColor,
                  ),
                  width: 160,
                  label: 'Urgent Care',
                  onTap: () {
                    _handleUrgetCare();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  double _getMaxHeight() {
    final height = MediaQuery.sizeOf(context).height.h;
    final halfHeight = height / 2;
    if (halfHeight > 310.h) {
      return halfHeight + 20.h;
    }

    return halfHeight;
  }

  void _handleUrgetCare() async {
    context.showLoadingIndicator();

    final resp = await context
        .read<AppointmentNotifier>()
        .fetchAppointments(DateTime.now());

    context.removeLoadingIndicator();

    if (!resp.isSuccess) {
      context.showSnackbar(resp.message ?? '');
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ScheduleAppointmentScreen(data: resp.data!),
      ),
    );
  }
}
