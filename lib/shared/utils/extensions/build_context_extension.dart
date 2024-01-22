import 'package:aarogyatech/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension BuildContextExtension on BuildContext {
  Future<DateTime?> showCalendarDialog({
    required DateTime firstDate,
    required DateTime lastDate,
  }) {
    return showDatePicker(
      context: this,
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      firstDate: firstDate,
      lastDate: lastDate,
    );
  }

  void showLoadingIndicator({
    String text = 'Sit back and relax\nWe\'re processing...',
    bool isBarrierDismissible = false,
  }) {
    showDialog(
      context: this,
      barrierDismissible: isBarrierDismissible,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            backgroundColor: AppColors.whiteColor,
            content: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const CircularProgressIndicator(color: AppColors.buttonColor),
                SizedBox(width: 16.w),
                Expanded(
                  child: Text(
                    text,
                    style: AppText.text12w400PrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void removeLoadingIndicator() {
    Navigator.pop(this);
  }

  void showSnackbar(String text) {
    final snackBar = SnackBar(content: Text(text));

    ScaffoldMessenger.of(this).showSnackBar(snackBar);
  }

  void removeSnackbar() {
    ScaffoldMessenger.of(this).hideCurrentSnackBar();
  }
}
