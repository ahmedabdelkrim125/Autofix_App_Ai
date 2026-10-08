import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surfaceColor = isDark ? AppColors.surface : Colors.white;
    final textColor = isDark ? AppColors.textSecondary : Colors.black87;

    return Column(
      children: [
        Container(
          width: 60.w,
          height: 60.w,
          decoration: BoxDecoration(
            color: surfaceColor,
            shape: BoxShape.circle,
            boxShadow: isDark ? [] : [BoxShadow(color: Colors.black12, blurRadius: 6, offset: const Offset(0, 3))],
          ),
          child: Icon(icon, color: AppColors.textSecondary, size: 24.sp),
        ),
        SizedBox(height: 8.h),
        Text(label, style: TextStyle(color: textColor, fontSize: 12.sp, fontWeight: FontWeight.w500)),
      ],
    );
  }
}