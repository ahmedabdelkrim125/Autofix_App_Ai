import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';

class AppLoadingDialog {
  AppLoadingDialog._();

  static bool _isShowing = false;

  static void show(BuildContext context, {required String message}) {
    if (_isShowing) return;
    _isShowing = true;

    showDialog<void>(
      context: context,
      barrierDismissible: false,
      useRootNavigator: true,
      builder: (_) => PopScope(
        canPop: false,
        child: _LoadingDialogContent(message: message),
      ),
    ).whenComplete(() => _isShowing = false);
  }

  static void hide(BuildContext context) {
    if (!_isShowing) return;
    _isShowing = false;
    Navigator.of(context, rootNavigator: true).pop();
  }
}

class _LoadingDialogContent extends StatefulWidget {
  const _LoadingDialogContent({required this.message});

  final String message;

  @override
  State<_LoadingDialogContent> createState() => _LoadingDialogContentState();
}

class _LoadingDialogContentState extends State<_LoadingDialogContent>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surfaceColor = isDark ? AppColors.surface : Colors.white;
    final textColor = isDark ? AppColors.textPrimary : Colors.black87;
    final textSecColor = isDark ? AppColors.textSecondary : Colors.black54;

    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 48.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 26.h),
        decoration: BoxDecoration(
          color: surfaceColor,
          borderRadius: BorderRadius.circular(22.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.35 : 0.14),
              blurRadius: 24,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 86.w,
              height: 86.w,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * math.pi * 2,
                    child: child,
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 76.w,
                      height: 76.w,
                      child: CircularProgressIndicator(
                        strokeWidth: 5.w,
                        strokeCap: StrokeCap.round,
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                        backgroundColor: AppColors.primary.withOpacity(0.14),
                      ),
                    ),
                    Container(
                      width: 48.w,
                      height: 48.w,
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.14),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.settings,
                        color: AppColors.primary,
                        size: 26.sp,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 18.h),
            Text(
              widget.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              'Keeping things tuned...',
              textAlign: TextAlign.center,
              style: TextStyle(color: textSecColor, fontSize: 12.sp),
            ),
          ],
        ),
      ),
    );
  }
}
