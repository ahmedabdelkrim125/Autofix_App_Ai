import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/networking/base_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/snackbar_helper.dart';
import '../../../core/widgets/app_loading_dialog.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../main.dart';
import '../../main_layout/screens/main_layout_screen.dart';
import '../data/models/login_response.dart';
import '../logic/login_cubit.dart';
import '../widgets/social_button.dart';
import 'forgot_password_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<LoginCubit>(),
      child: const _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<LoginCubit>().login(
        email: _emailController.text.trim(),
        password: _passwordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = themeNotifier.value == ThemeMode.dark;
    final bgColor = isDark ? AppColors.background : const Color(0xFFF5F7FA);
    final textColor = isDark ? AppColors.textPrimary : Colors.black87;

    return BlocConsumer<LoginCubit, BaseState<LoginResponse>>(
      listener: (context, state) {
        if (state is BaseLoading<LoginResponse>) {
          AppLoadingDialog.show(context, message: 'Signing you in');
          return;
        }
        AppLoadingDialog.hide(context);
        if (state is BaseSuccess<LoginResponse>) {
          SnackbarHelper.showTopSnackbar(
            context,
            state.data.message ?? 'Login Successful!',
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const MainLayoutScreen()),
          );
        } else if (state is BaseFailure<LoginResponse>) {
          SnackbarHelper.showTopSnackbar(context, state.message, isError: true);
        }
      },
      builder: (context, state) {
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
                          Icon(
                            Icons.settings,
                            color: AppColors.primary,
                            size: 48.sp,
                          ),
                          SizedBox(height: 16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Auto',
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Fix',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'AI Diagnostics',
                            style: TextStyle(
                              color: isDark
                                  ? AppColors.textSecondary
                                  : Colors.black54,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 60.h),
                    Text(
                      'Welcome back',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Sign in to continue diagnosing & fixing',
                      style: TextStyle(
                        color: isDark
                            ? AppColors.textSecondary
                            : Colors.black54,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 32.h),
                    CustomTextField(
                      hint: 'Email address',
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty)
                          return 'Please enter your email';
                        if (!value.contains('@'))
                          return 'Please enter a valid email';
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    CustomTextField(
                      hint: 'Password',
                      isPassword: true,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty)
                          return 'Please enter your password';
                        return null;
                      },
                    ),
                    SizedBox(height: 16.h),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ForgotPasswordScreen(),
                          ),
                        ),
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24.h),
                    CustomButton(
                      text: 'Sign In',
                      hasIcon: true,
                      onPressed: () => _handleLogin(context),
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: isDark ? AppColors.surface : Colors.black26,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            'or continue with',
                            style: TextStyle(
                              color: isDark
                                  ? AppColors.textSecondary
                                  : Colors.black54,
                              fontSize: 12.sp,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: isDark ? AppColors.surface : Colors.black26,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: SocialButton(
                            icon: Icons.g_mobiledata,
                            text: 'Google',
                            onPressed: () => SnackbarHelper.showTopSnackbar(
                              context,
                              'Google Login coming soon',
                            ),
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Expanded(
                          child: SocialButton(
                            icon: Icons.apple,
                            text: 'Apple',
                            onPressed: () => SnackbarHelper.showTopSnackbar(
                              context,
                              'Apple Login coming soon',
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: TextStyle(
                            color: isDark
                                ? AppColors.textSecondary
                                : Colors.black54,
                            fontSize: 14.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignupScreen(),
                            ),
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
      },
    );
  }
}
