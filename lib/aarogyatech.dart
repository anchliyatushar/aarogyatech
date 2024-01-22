import 'package:aarogyatech/features/appointment/appointment.dart';
import 'package:aarogyatech/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'features/home/home.dart';

class AarogyaTech extends StatefulWidget {
  const AarogyaTech({super.key});

  @override
  State<AarogyaTech> createState() => _AarogyaTechState();
}

class _AarogyaTechState extends State<AarogyaTech> {
  @override
  void initState() {
    super.initState();
    AppUtils.setupLocator();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (_) => AppUtils.locator.get<AppointmentNotifier>(),
            )
          ],
          child: MaterialApp(
            title: 'Aarogya Tech',
            theme: _buildTheme(),
            home: const HomeScreen(),
          ),
        );
      },
    );
  }

  ThemeData _buildTheme() {
    final theme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.whiteColor,
      colorSchemeSeed: AppColors.blueColor,
      datePickerTheme: const DatePickerThemeData(
        backgroundColor: AppColors.whiteColor,
        surfaceTintColor: AppColors.whiteColor,
      ),
      textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
    );

    return theme.copyWith(
      textTheme: GoogleFonts.urbanistTextTheme(theme.textTheme),
    );
  }
}
