import 'package:aarogyatech/features/appointment/appointment.dart';
import 'package:aarogyatech/features/appointment/presentation/widgets/time_quadrant_widget.dart';
import 'package:aarogyatech/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduleAppointmentScreen extends StatefulWidget {
  const ScheduleAppointmentScreen({super.key});

  @override
  State<ScheduleAppointmentScreen> createState() =>
      _ScheduleAppointmentScreenState();
}

class _ScheduleAppointmentScreenState extends State<ScheduleAppointmentScreen> {
  final now = DateTime.now();
  final lastDate = DateTime(
    DateTime.now().year,
    DateTime.now().month + 1,
    DateTime.now().day,
  );

  final listOfDays = <DateTime>[];

  final selectedIndex = ValueNotifier(0);
  final timeToggleValue = ValueNotifier([true, false]);

  @override
  void initState() {
    super.initState();

    _getMonthList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Column(
            children: [
              const AppBarWidget(
                label: 'Appointments',
                showBack: true,
                showNotification: false,
              ),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Pick a Date',
                    style: AppText.text16w400PrimaryColor,
                  ),
                  GestureDetector(
                    onTap: _handleDatePicker,
                    child: Icon(
                      Icons.calendar_month_rounded,
                      size: 24.r,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              _renderDates(),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _renderDrSelection(),
                  _renderToggle(),
                ],
              ),
              _renderTimeSlotSelection(),
              SizedBox(height: 40.h),
              _renderTimeSlots(),
              const Spacer(),
              _renderCta(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderDrSelection() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: UIUtils.borderRadius16px,
        color: AppColors.tabBarColor,
      ),
      child: DropdownButton(
        value: 0,
        dropdownColor: AppColors.whiteColor,
        borderRadius: UIUtils.borderRadius16px,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        underline: const SizedBox(),
        onChanged: (val) {},
        items: [
          DropdownMenuItem(
            value: 0,
            child: Text(
              'Dr. Tushar',
              style: AppText.text12w400PrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  ValueListenableBuilder<List<bool>> _renderToggle() {
    return ValueListenableBuilder(
      valueListenable: timeToggleValue,
      builder: (_, time, __) {
        return ToggleButtons(
          selectedColor: AppColors.blueColor,
          borderRadius: UIUtils.borderRadius16px,
          textStyle: AppText.text12w400PrimaryColor,
          isSelected: time,
          onPressed: (index) {
            final list = List.filled(time.length, false);
            list[index] = !list[index];
            timeToggleValue.value = list;
          },
          children: const [
            Text('AM'),
            Text('PM'),
          ],
        );
      },
    );
  }

  Widget _renderDates() {
    return Container(
      height: 108.h,
      decoration: BoxDecoration(
        borderRadius: UIUtils.borderRadius16px,
        color: AppColors.tabBarColor,
      ),
      child: ValueListenableBuilder(
        valueListenable: selectedIndex,
        builder: (_, value, __) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: listOfDays.length,
            separatorBuilder: (_, index) => SizedBox(width: 12.w),
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            itemBuilder: (_, index) => GestureDetector(
              onTap: () => selectedIndex.value = index,
              child: CalendarDateCardWidget(
                date: listOfDays[index],
                isSelected: value == index,
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleDatePicker() async {
    final date = await context.showCalendarDialog(
      firstDate: now,
      lastDate: lastDate,
    );
  }

  void _getMonthList() {
    var firstDate = now;

    do {
      listOfDays.add(firstDate);
      firstDate = firstDate.next();
    } while (!firstDate.isSameDate(lastDate));
  }

  Widget _renderTimeSlotSelection() {
    return const AppointmentQuadrantWidget();
  }

  Widget _renderTimeSlots() {
    return Chip(
      label: Text(
        'label',
        style: AppText.text12w600PrimaryColor,
      ),
    );
  }

  Widget _renderCta() {
    return AppButton(
      label: 'Schedule an Appointment',
      onTap: _handleScheduleAppointment,
    );
  }

  void _handleScheduleAppointment() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CreateUserAppointment()),
    );
  }
}
