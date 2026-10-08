import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/snackbar_helper.dart';
import '../../notifications/screens/notifications_screen.dart';
import '../widgets/action_card.dart';
import '../widgets/category_item.dart';
import '../widgets/diagnosis_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.settings, color: AppColors.primary, size: 28.sp),
                      SizedBox(width: 8.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('Auto ', style: TextStyle(color: textColor, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                              Text('Fix', style: TextStyle(color: AppColors.primary, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Text('AI Diagnostics', style: TextStyle(color: textSecColor, fontSize: 10.sp)),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationsScreen())),
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(color: surfaceColor, shape: BoxShape.circle, boxShadow: isDark ? [] : [BoxShadow(color: Colors.black12, blurRadius: 4)]),
                      child: Icon(Icons.notifications_none, color: textColor, size: 20.sp),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Text('What needs fixing\ntoday?', style: TextStyle(color: textColor, fontSize: 28.sp, fontWeight: FontWeight.bold, height: 1.2)),
              SizedBox(height: 24.h),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => SnackbarHelper.showTopSnackbar(context, 'Navigating to Describe Issue...'),
                      child: const ActionCard(icon: Icons.chat_bubble_outline, title: 'Describe Issue', subtitle: "Tell us what's wrong", iconColor: AppColors.primary),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => SnackbarHelper.showTopSnackbar(context, 'Navigating to Scan...'),
                      child: const ActionCard(icon: Icons.camera_alt_outlined, title: 'Scan & Detect', subtitle: 'Take a photo', iconColor: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32.h),
              Text('Categories', style: TextStyle(color: textColor, fontSize: 16.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  CategoryItem(icon: Icons.build, label: 'Automotive'),
                  CategoryItem(icon: Icons.memory, label: 'Electronics'),
                  CategoryItem(icon: Icons.kitchen, label: 'Appliances'),
                  CategoryItem(icon: Icons.plumbing, label: 'Plumbing'),
                ],
              ),
              SizedBox(height: 32.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent Diagnoses', style: TextStyle(color: textColor, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text('View All', style: TextStyle(color: AppColors.primary, fontSize: 12.sp, fontWeight: FontWeight.bold)),
                      Icon(Icons.chevron_right, color: AppColors.primary, size: 16.sp),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              const DiagnosisCard(icon: Icons.build, title: "Car Won't Start -ter", date: 'Today', status: 'Resolved', statusColor: AppColors.success),
              SizedBox(height: 12.h),
              const DiagnosisCard(icon: Icons.kitchen, title: 'Washing Machine a', date: 'Yesterday', status: 'In Progress', statusColor: AppColors.warning),
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primary.withOpacity(0.8), surfaceColor],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: isDark ? [] : [BoxShadow(color: Colors.black12, blurRadius: 8, offset: const Offset(0, 4))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.shield_outlined, color: textColor, size: 20.sp),
                        SizedBox(width: 8.w),
                        Text('Safety First', style: TextStyle(color: textColor, fontSize: 14.sp, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Always disconnect power sources before attempting any electrical or appliance repairs. When in doubt, consult a professional.',
                      style: TextStyle(color: textColor.withOpacity(0.8), fontSize: 12.sp, height: 1.5),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}