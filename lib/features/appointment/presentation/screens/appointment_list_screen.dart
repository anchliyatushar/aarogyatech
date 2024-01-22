import 'package:aarogyatech/features/appointment/appointment.dart';
import 'package:aarogyatech/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({super.key});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Column(
            children: [
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: const AppBarWidget(
                  label: 'Schedule',
                  showBack: true,
                ),
              ),
              SizedBox(height: 24.h),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                decoration: BoxDecoration(
                  borderRadius: UIUtils.borderRadiusButtonCircular,
                  color: AppColors.tabBarColor,
                ),
                padding: EdgeInsets.all(4.r),
                child: TabBar(
                  indicatorColor: AppColors.black,
                  indicatorWeight: 1,
                  dividerHeight: 0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: EdgeInsets.symmetric(vertical: 16.h),
                  labelColor: AppColors.textPrimaryColor,
                  unselectedLabelColor: AppColors.textPrimaryColor,
                  labelStyle: AppText.text14w700PrimaryColor,
                  unselectedLabelStyle: AppText.text14w400SecondaryColor,
                  indicator: BoxDecoration(
                    borderRadius: UIUtils.borderRadiusButtonCircular,
                    color: AppColors.whiteColor,
                  ),
                  tabs: const [
                    Text('Upcoming'),
                    Text('Past'),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Expanded(
                child: TabBarView(
                  children: [
                    ListView.separated(
                      itemCount: 5,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      separatorBuilder: (_, __) => SizedBox(height: 16.h),
                      itemBuilder: (_, index) => const AppointmentCardWidget(),
                    ),
                    ListView.separated(
                      itemCount: 5,
                      shrinkWrap: true,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      separatorBuilder: (_, __) => SizedBox(height: 16.h),
                      itemBuilder: (_, index) => const AppointmentCardWidget(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
