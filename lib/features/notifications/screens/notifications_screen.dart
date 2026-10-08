// lib/features/notifications/screens/notifications_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../main.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = themeNotifier.value == ThemeMode.dark;
    final bgColor = isDark ? AppColors.background : const Color(0xFFF5F7FA);
    final surfaceColor = isDark ? AppColors.surface : Colors.white;
    final textColor = isDark ? AppColors.textPrimary : Colors.black87;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Notifications', style: TextStyle(color: textColor, fontSize: 20.sp)),
        backgroundColor: surfaceColor,
        elevation: 0,
        iconTheme: IconThemeData(color: textColor),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.w),
        children: [
          _buildNotificationItem('Diagnosis Complete', 'Your car diagnosis is ready.', '2 mins ago', true, isDark, surfaceColor, textColor),
          _buildNotificationItem('New Message', 'Marcus Johnson sent you a message.', '1 hr ago', false, isDark, surfaceColor, textColor),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(String title, String subtitle, String time, bool isUnread, bool isDark, Color surfaceColor, Color textColor) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: isUnread ? surfaceColor.withOpacity(0.8) : surfaceColor,
        borderRadius: BorderRadius.circular(12.r),
        border: isUnread ? Border.all(color: AppColors.primary.withOpacity(0.5)) : null,
        boxShadow: isDark ? [] : [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.notifications, color: AppColors.primary, size: 24.sp),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: textColor, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 4.h),
                Text(subtitle, style: TextStyle(color: isDark ? AppColors.textSecondary : Colors.black54, fontSize: 14.sp)),
              ],
            ),
          ),
          Text(time, style: TextStyle(color: isDark ? AppColors.textSecondary : Colors.black54, fontSize: 12.sp)),
        ],
      ),
    );
  }
}