import 'package:aarogyatech/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'features/home/home.dart';

class AarogyaTech extends StatelessWidget {
  const AarogyaTech({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          title: 'Aarogya Tech',
          theme: _buildTheme(),
          home: const HomeScreen(),
        );
      },
    );
  }

  ThemeData _buildTheme() {
    final theme = ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.whiteColor,
      textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
    );

    return theme.copyWith(
      textTheme: GoogleFonts.urbanistTextTheme(theme.textTheme),
    );
  }
}
