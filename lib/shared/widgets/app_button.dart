import 'package:aarogyatech/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.label,
    this.type = ButtonType.PRIMARY,
    this.size = ButtonSize.LARGE,
    this.isLoading = false,
    this.onTap,
    this.height,
    this.width,
    this.leftIcon,
    this.rightIcon,
    this.style,
    this.loadingWidget,
    this.color,
    this.margin,
    this.fontColor,
    this.alignment = Alignment.centerLeft,
    this.loadingLabel = '',
  }) : super(key: key);

  final String label;
  final ButtonType type;
  final ButtonSize size;
  final TextStyle? style;
  final String loadingLabel;

  final bool isLoading;

  final VoidCallback? onTap;
  final Color? fontColor;
  @Deprecated(
    'Don\'t passed the height manually, use size param to assign predefine size [size : ButtonSize.LARGE]',
  )
  final int? height;
  final int? width;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final Widget? loadingWidget;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    if (type == ButtonType.TEXT) {
      return Container(
        alignment: alignment,
        height: _getHeight(size),
        width: width?.w ?? double.infinity,
        margin: margin,
        child: TextButton(
          onPressed: onTap,
          style: ButtonStyle(
            alignment: alignment,
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            textStyle: MaterialStateProperty.all(size.getTextStyle),
            elevation: MaterialStateProperty.all<double>(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: UIUtils.borderRadius32px,
              ),
            ),
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStateProperty.all(Colors.transparent),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (isLoading && loadingWidget != null) ...{
                loadingWidget!,
                SizedBox(width: 8.w)
              } else ...{
                if (isLoading) ...{
                  // const AppLoaderIcon(),
                  SizedBox(width: 8.w),
                },
                if (leftIcon != null) ...{leftIcon!, SizedBox(width: 10.w)},
                Text(
                  label,
                  style: style,
                ),
                if (rightIcon != null) ...{SizedBox(width: 10.w), rightIcon!},
              },
            ],
          ),
        ),
      );
    }

    return Container(
      height: _getHeight(size),
      width: width?.w ?? double.infinity,
      margin: margin,
      child: ElevatedButton(
        onPressed: isLoading ? null : onTap,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          side: type == ButtonType.SECONDARY
              ? MaterialStateProperty.all<BorderSide>(
                  BorderSide(
                    color: isLoading
                        ? type == ButtonType.PRIMARY
                            ? AppColors.buttonColorDisabled
                            : AppColors.buttonColorDisabled
                        : onTap == null
                            ? AppColors.buttonColorDisabled
                            : AppColors.buttonColor,
                    width: 1.r,
                  ),
                )
              : null,
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: UIUtils.borderRadius32px,
            ),
          ),
          backgroundColor: color != null
              ? MaterialStateProperty.all<Color?>(color)
              : isLoading
                  ? MaterialStateProperty.all<Color>(
                      type == ButtonType.SECONDARY
                          ? AppColors.buttonColorDisabled
                          : AppColors.buttonColorDisabled,
                    )
                  : onTap != null
                      ? MaterialStateProperty.all<Color>(
                          type == ButtonType.SECONDARY
                              ? AppColors.buttonColor
                              : AppColors.buttonColor,
                        )
                      : MaterialStateProperty.all<Color>(
                          type == ButtonType.SECONDARY
                              ? AppColors.buttonColorDisabled
                              : AppColors.buttonColorDisabled),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              if (isLoading && loadingWidget != null) ...{
                loadingWidget!,
                SizedBox(width: 8.w)
              } else ...{
                if (isLoading) ...{
                  // const AppLoaderIcon(),
                  SizedBox(width: 8.w),
                },
                if (leftIcon != null) ...{leftIcon!, SizedBox(width: 10.w)},
              },
              Flexible(
                child: Text(
                  isLoading ? loadingLabel : label,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: style ??
                      size.getTextStyle.copyWith(
                        color: fontColor ??
                            (type == ButtonType.SECONDARY
                                ? onTap != null
                                    ? AppColors.whiteColor
                                    : AppColors.whiteColor
                                : isLoading
                                    ? AppColors.whiteColor
                                    : onTap != null
                                        ? AppColors.whiteColor
                                        : AppColors.whiteColor),
                      ),
                ),
              ),
              if (rightIcon != null) ...{
                SizedBox(width: 10.w),
                rightIcon!,
              },
            ],
          ),
        ),
      ),
    );
  }

  double _getHeight(ButtonSize size) {
    // ignore: deprecated_member_use_from_same_package
    if (height != null) {
      // ignore: deprecated_member_use_from_same_package
      return height!.h;
    }
    return size.getButtonSize;
  }
}
