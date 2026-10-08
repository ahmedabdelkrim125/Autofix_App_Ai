import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/utils/snackbar_helper.dart';
import '../../../main.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final isDark = themeNotifier.value == ThemeMode.dark;
    final bgColor = isDark ? AppColors.background : const Color(0xFFF5F7FA);
    final textColor = isDark ? AppColors.textPrimary : Colors.black87;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reset Password',
              style: TextStyle(
                color: textColor,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              'Enter your email to receive a reset link',
              style: TextStyle(
                color: isDark ? AppColors.textSecondary : Colors.black54,
                fontSize: 14.sp,
              ),
            ),
            SizedBox(height: 32.h),
            CustomTextField(hint: 'Email address', controller: emailController),
            SizedBox(height: 24.h),
            CustomButton(
              text: 'Send Link',
              onPressed: () {
                if (emailController.text.isNotEmpty) {
                  SnackbarHelper.showTopSnackbar(
                    context,
                    'Reset link sent to your email',
                  );
                  Navigator.pop(context);
                } else {
                  SnackbarHelper.showTopSnackbar(
                    context,
                    'Please enter an email',
                    isError: true,
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
