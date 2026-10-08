import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/utils/snackbar_helper.dart';
import '../../../main.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  void _handleSignup() {
    if (_formKey.currentState!.validate()) {
      SnackbarHelper.showTopSnackbar(context, 'Account created successfully!');
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Create account',
                style: TextStyle(
                  color: textColor,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Join thousands of DIY fixers saving time & money',
                style: TextStyle(
                  color: isDark ? AppColors.textSecondary : Colors.black54,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(height: 32.h),
              CustomTextField(
                hint: 'Full name',
                validator: (value) =>
                    value!.isEmpty ? 'Please enter your name' : null,
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                hint: 'Email address',
                validator: (value) =>
                    value!.contains('@') ? null : 'Please enter a valid email',
              ),
              SizedBox(height: 16.h),
              CustomTextField(
                hint: 'Create password',
                isPassword: true,
                validator: (value) =>
                    value!.length < 6 ? 'Password too short' : null,
              ),
              SizedBox(height: 24.h),
              CustomButton(
                text: 'Create Account',
                hasIcon: true,
                onPressed: _handleSignup,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
