import 'package:aarogyatech/shared/shared.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppBarWidget extends StatelessWidget {
  final String? label;
  final bool showBack;
  final bool showNotification;

  const AppBarWidget({
    super.key,
    this.label,
    this.showBack = false,
    this.showNotification = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (showBack) ...{
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              radius: 22.r,
              backgroundColor: AppColors.greyColor,
              child: const Icon(Icons.arrow_back_rounded),
            ),
          ),
          SizedBox(width: 16.w),
        },
        if (label?.isNotEmpty ?? false) ...{
          Text(label!, style: AppText.text24w700PrimaryColor),
        } else ...{
          CircleAvatar(
            radius: 22.r,
            backgroundImage: const CachedNetworkImageProvider(
              'https://xsgames.co/randomusers/assets/avatars/male/76.jpg',
            ),
          ),
        },
        const Spacer(),
        if (showNotification) ...{
          CircleAvatar(
            radius: 22.r,
            backgroundColor: AppColors.greyColor,
            child: const Icon(Icons.notifications_none_rounded),
          ),
        },
      ],
    );
  }
}
