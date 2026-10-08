import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../core/utils/snackbar_helper.dart';
import '../../main_layout/screens/main_layout_screen.dart';
import '../widgets/social_button.dart';
import 'signup_screen.dart';
import 'forgot_password_screen.dart';
import '../../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      SnackbarHelper.showTopSnackbar(context, 'Login Successful!');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MainLayoutScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = themeNotifier.value == ThemeMode.dark;
    final bgColor = isDark ? AppColors.background : const Color(0xFFF5F7FA);
    final textColor = isDark ? AppColors.textPrimary : Colors.black87;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),
                Center(
                  child: Column(
                    children: [
                      Icon(Icons.settings, color: AppColors.primary, size: 48.sp),
                      SizedBox(height: 16.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Auto', style: TextStyle(color: textColor, fontSize: 28.sp, fontWeight: FontWeight.bold)),
                          Text('Fix', style: TextStyle(color: AppColors.primary, fontSize: 28.sp, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      Text('AI Diagnostics', style: TextStyle(color: isDark ? AppColors.textSecondary : Colors.black54, fontSize: 12.sp)),
                    ],
                  ),
                ),
                SizedBox(height: 60.h),
                Text('Welcome back', style: TextStyle(color: textColor, fontSize: 24.sp, fontWeight: FontWeight.bold)),
                SizedBox(height: 8.h),
                Text('Sign in to continue diagnosing & fixing', style: TextStyle(color: isDark ? AppColors.textSecondary : Colors.black54, fontSize: 14.sp)),
                SizedBox(height: 32.h),
                CustomTextField(
                  hint: 'Email address',
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter your email';
                    if (!value.contains('@')) return 'Please enter a valid email';
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                CustomTextField(
                  hint: 'Password',
                  isPassword: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter your password';
                    if (value.length < 6) return 'Password must be at least 6 characters';
                    return null;
                  },
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotPasswordScreen())),
                    child: Text('Forgot password?', style: TextStyle(color: AppColors.primary, fontSize: 14.sp, fontWeight: FontWeight.w600)),
                  ),
                ),
                SizedBox(height: 24.h),
                CustomButton(
                  text: 'Sign In',
                  hasIcon: true,
                  onPressed: _handleLogin,
                ),
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Expanded(child: Divider(color: isDark ? AppColors.surface : Colors.black26)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text('or continue with', style: TextStyle(color: isDark ? AppColors.textSecondary : Colors.black54, fontSize: 12.sp)),
                    ),
                    Expanded(child: Divider(color: isDark ? AppColors.surface : Colors.black26)),
                  ],
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(child: SocialButton(icon: Icons.g_mobiledata, text: 'Google', onPressed: () => SnackbarHelper.showTopSnackbar(context, 'Google Login coming soon'))),
                    SizedBox(width: 16.w),
                    Expanded(child: SocialButton(icon: Icons.apple, text: 'Apple', onPressed: () => SnackbarHelper.showTopSnackbar(context, 'Apple Login coming soon'))),
                  ],
                ),
                SizedBox(height: 32.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ", style: TextStyle(color: isDark ? AppColors.textSecondary : Colors.black54, fontSize: 14.sp)),
                    GestureDetector(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignupScreen())),
                      child: Text("Sign Up", style: TextStyle(color: AppColors.primary, fontSize: 14.sp, fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}