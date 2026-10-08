import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppColors.background : const Color(0xFFF5F7FA);
    final surfaceColor = isDark ? AppColors.surface : Colors.white;
    final textColor = isDark ? AppColors.textPrimary : Colors.black87;
    final textSecColor = isDark ? AppColors.textSecondary : Colors.black54;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Repair History', style: TextStyle(color: textColor, fontSize: 28.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 8.h),
              Text('Track your past diagnoses and fixes', style: TextStyle(color: textSecColor, fontSize: 14.sp)),
              SizedBox(height: 24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatCard('12', 'Total Fixes', textColor, surfaceColor, isDark),
                  _buildStatCard('92%', 'Success', AppColors.primary, surfaceColor, isDark),
                  _buildStatCard('\$840', 'Saved', AppColors.success, surfaceColor, isDark),
                ],
              ),
              SizedBox(height: 24.h),
              Container(
                height: 48.h,
                decoration: BoxDecoration(color: surfaceColor, borderRadius: BorderRadius.circular(12.r), boxShadow: isDark ? [] : [BoxShadow(color: Colors.black12, blurRadius: 4)]),
                child: Row(
                  children: [
                    Expanded(child: Center(child: Text('All', style: TextStyle(color: textColor, fontSize: 14.sp, fontWeight: FontWeight.bold)))),
                    Expanded(child: Center(child: Text('Resolved', style: TextStyle(color: textSecColor, fontSize: 14.sp)))),
                    Expanded(child: Center(child: Text('In Progress', style: TextStyle(color: textSecColor, fontSize: 14.sp)))),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              _buildHistoryCard(Icons.build, "Car Won't Start - Ba", 'Oct 24, 2023', 'Resolved', AppColors.success, '\$0 (DIY)', surfaceColor, textColor, textSecColor, isDark),
              SizedBox(height: 16.h),
              _buildHistoryCard(Icons.kitchen, 'Washing Machine \\', 'Oct 20, 2023', 'In Progress', AppColors.warning, 'Pending', surfaceColor, textColor, textSecColor, isDark),
              SizedBox(height: 16.h),
              _buildHistoryCard(Icons.memory, 'Flickering LED y', 'Sep 15, 2023', 'Resolved', AppColors.success, '\$15 (Parts)', surfaceColor, textColor, textSecColor, isDark),
              SizedBox(height: 16.h),
              _buildHistoryCard(Icons.plumbing, 'Leaky Kitchen I', 'Aug 02, 2023', 'Escalated', Colors.blue, '\$120 (Pro)', surfaceColor, textColor, textSecColor, isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String value, String label, Color valueColor, Color surfaceColor, bool isDark) {
    return Container(
      width: 105.w,
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(color: surfaceColor, borderRadius: BorderRadius.circular(16.r), boxShadow: isDark ? [] : [BoxShadow(color: Colors.black12, blurRadius: 6)]),
      child: Column(
        children: [
          Text(value, style: TextStyle(color: valueColor, fontSize: 24.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 8.h),
          Text(label, style: TextStyle(color: isDark ? AppColors.textSecondary : Colors.black54, fontSize: 12.sp, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(IconData icon, String title, String date, String status, Color statusColor, String price, Color surfaceColor, Color textColor, Color textSecColor, bool isDark) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(color: surfaceColor, borderRadius: BorderRadius.circular(16.r), boxShadow: isDark ? [] : [BoxShadow(color: Colors.black12, blurRadius: 6)]),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(color: isDark ? AppColors.background : const Color(0xFFF5F7FA), borderRadius: BorderRadius.circular(12.r)),
            child: Icon(icon, color: textSecColor, size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyle(color: textColor, fontSize: 16.sp, fontWeight: FontWeight.bold), maxLines: 1, overflow: TextOverflow.ellipsis),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                  decoration: BoxDecoration(color: statusColor.withOpacity(0.1), borderRadius: BorderRadius.circular(20.r)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check_circle_outline, color: statusColor, size: 14.sp),
                      SizedBox(width: 4.w),
                      Text(status, style: TextStyle(color: statusColor, fontSize: 12.sp, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(date, style: TextStyle(color: textSecColor, fontSize: 12.sp)),
              SizedBox(height: 12.h),
              Row(
                children: [
                  Text(price, style: TextStyle(color: textSecColor, fontSize: 14.sp)),
                  SizedBox(width: 8.w),
                  Icon(Icons.chevron_right, color: textSecColor, size: 20.sp),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}