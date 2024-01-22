import 'package:aarogyatech/features/appointment/appointment.dart';
import 'package:aarogyatech/shared/shared.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';

class CreateUserAppointment extends StatefulWidget {
  final AppointmentRequestModel data;

  const CreateUserAppointment({super.key, required this.data});

  @override
  State<CreateUserAppointment> createState() => _CreateUserAppointmentState();
}

class _CreateUserAppointmentState extends State<CreateUserAppointment> {
  final genderToggleValue = ValueNotifier([true, false, false]);
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _renderCta(),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          children: [
            const AppBarWidget(
              label: 'Appointment',
              showBack: true,
              showNotification: false,
            ),
            SizedBox(height: 24.h),
            Center(
              child: CircleAvatar(
                radius: 48.r,
                backgroundImage: const CachedNetworkImageProvider(
                  'https://xsgames.co/randomusers/assets/avatars/male/76.jpg',
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AppTextFormField(
                    labelText: 'Email Address',
                    hintText: 'Enter email address',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.email(),
                    ]),
                  ),
                  SizedBox(height: 24.h),
                  AppTextFormField(
                    labelText: 'Phone Number',
                    hintText: 'Enter phone number',
                    prefixText: '+91 ',
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                      FormBuilderValidators.minLength(10)
                    ]),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(10),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h),
            Text('Select Gender', style: AppText.text14w400PrimaryColor),
            SizedBox(height: 16.h),
            _renderGenderToggle(),
            SizedBox(height: 24.h),
            Text(
              'Appointment Details:',
              style: AppText.text14w400PrimaryColor,
            ),
            SizedBox(height: 16.h),
            Text(
              'Dr. Tushar, ${widget.data.scheduledDate}, slotval',
              style: AppText.text12w400PrimaryColor,
            ),
          ],
        ),
      ),
    );
  }

  ValueListenableBuilder<List<bool>> _renderGenderToggle() {
    return ValueListenableBuilder(
      valueListenable: genderToggleValue,
      builder: (_, gender, __) {
        return ToggleButtons(
          selectedColor: AppColors.blueColor,
          borderRadius: UIUtils.borderRadius16px,
          textStyle: AppText.text14w400PrimaryColor,
          isSelected: gender,
          onPressed: (index) {
            final list = List.filled(gender.length, false);
            list[index] = !list[index];
            genderToggleValue.value = list;
          },
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Text('Male'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Text('Female'),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: const Text('Others'),
            ),
          ],
        );
      },
    );
  }

  Widget _renderCta() {
    return AppButton(
      margin: EdgeInsets.only(left: 20.w, right: 20.w, bottom: 16.h),
      label: 'Create & Book Appointment',
      onTap: _handleBookAppointment,
    );
  }

  void _handleBookAppointment() async {
    final state = _formKey.currentState;

    if (state == null) {
      return;
    }

    if (!state.validate()) {
      return;
    }

    final data = UserModel(
      fullName: 'fullName',
      phone: 'phone',
      gender: 'gender',
    );

    context.showLoadingIndicator();
    final resp =
        await context.read<AppointmentNotifier>().bookAppointment(data);
    context.removeLoadingIndicator();

    if (!resp.isSuccess) {
      context.showSnackbar(resp.message ?? '');
      return;
    }
  }
}
