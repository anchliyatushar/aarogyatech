import 'package:aarogyatech/shared/shared.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Image.asset('assets/home/gradient.png'),
          ),
          Container(
            constraints: BoxConstraints(maxHeight: 320.h),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Image.asset(
                'assets/home/doctor.png',
              ),
            ),
          ),
          _renderHomeTopBanner(),
          Positioned(
            left: 0,
            right: 0,
            top: 310.h,
            child: _renderAllServicesSection(),
          ),
        ],
      ),
    );
  }

  Widget _renderAllServicesSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 12.r,
            offset: Offset(-2.w, -2.h),
            color: AppColors.black.withOpacity(0.2),
          )
        ],
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(20.r),
          right: Radius.circular(20.r),
        ),
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
                onTap: () {},
                child: Text(
                  'See All',
                  style: AppText.text14w700SecondaryButton,
                ),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          Container()
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
            _renderAppBar(),
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
                  label: 'Urgent Care',
                  onTap: () {},
                  width: 160,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _renderAppBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 22.r,
          backgroundImage: const CachedNetworkImageProvider(
            'https://xsgames.co/randomusers/assets/avatars/male/76.jpg',
          ),
        ),
        CircleAvatar(
          radius: 22.r,
          backgroundColor: AppColors.whiteColor,
          child: const Icon(Icons.notifications_none_rounded),
        ),
      ],
    );
  }
}
