import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../data/models/fault_model.dart';
import '../widgets/json_view.dart';

class DiagnosisResultScreen extends StatelessWidget {
  const DiagnosisResultScreen({super.key, required this.fault});

  final FaultModel fault;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppColors.background : const Color(0xFFF5F7FA);
    final textColor = isDark ? AppColors.textPrimary : Colors.black87;
    final textSecColor = isDark ? AppColors.textSecondary : Colors.black54;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor, size: 24.sp),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Diagnosis Result',
          style: TextStyle(
            color: textColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fault.title,
              style: TextStyle(
                color: textColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            if (fault.difficulty != null || fault.status != null)
              Text(
                [
                  if (fault.status != null) fault.status!,
                  if (fault.difficulty != null) fault.difficulty!,
                ].join(' • '),
                style: TextStyle(color: textSecColor, fontSize: 14.sp),
              ),
            SizedBox(height: 24.h),
            JsonView(data: fault.raw ?? const <String, dynamic>{}),
          ],
        ),
      ),
    );
  }
}
