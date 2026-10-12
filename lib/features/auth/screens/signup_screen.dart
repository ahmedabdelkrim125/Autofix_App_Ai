import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/networking/base_state.dart';
import '../../../core/networking/models/message_response.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/snackbar_helper.dart';
import '../../../core/widgets/app_loading_dialog.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_text_field.dart';
import '../../../main.dart';
import '../logic/signup_cubit.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<SignupCubit>(),
      child: const _SignupView(),
    );
  }
}

class _SignupView extends StatefulWidget {
  const _SignupView();

  @override
  State<_SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<_SignupView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignup(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<SignupCubit>().signup(
        name: _nameController.text.trim(),
        email: _emailController.text.trim(),
        phone: _phoneController.text.trim(),
        password: _passwordController.text,
        confirmPassword: _confirmPasswordController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = themeNotifier.value == ThemeMode.dark;
    final bgColor = isDark ? AppColors.background : const Color(0xFFF5F7FA);
    final textColor = isDark ? AppColors.textPrimary : Colors.black87;

    return BlocConsumer<SignupCubit, BaseState<MessageResponse>>(
      listener: (context, state) {
        if (state is BaseLoading<MessageResponse>) {
          AppLoadingDialog.show(context, message: 'Creating your account');
          return;
        }
        AppLoadingDialog.hide(context);
        if (state is BaseSuccess<MessageResponse>) {
          SnackbarHelper.showTopSnackbar(
            context,
            state.data.message ?? 'Account created successfully!',
          );
          Navigator.pop(context);
        } else if (state is BaseFailure<MessageResponse>) {
          SnackbarHelper.showTopSnackbar(context, state.message, isError: true);
        }
      },
      builder: (context, state) {
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
                    controller: _nameController,
                    validator: (value) =>
                        (value == null || value.trim().isEmpty)
                        ? 'Please enter your name'
                        : null,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hint: 'Email address',
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) => (value != null && value.contains('@'))
                        ? null
                        : 'Please enter a valid email',
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hint: 'Phone number',
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    validator: (value) =>
                        (value == null || value.trim().length < 10)
                        ? 'Please enter a valid phone number'
                        : null,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hint: 'Create password',
                    isPassword: true,
                    controller: _passwordController,
                    validator: (value) => (value == null || value.length < 6)
                        ? 'Password too short'
                        : null,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hint: 'Confirm password',
                    isPassword: true,
                    controller: _confirmPasswordController,
                    validator: (value) => value != _passwordController.text
                        ? 'Passwords do not match'
                        : null,
                  ),
                  SizedBox(height: 24.h),
                  CustomButton(
                    text: 'Create Account',
                    hasIcon: true,
                    onPressed: () => _handleSignup(context),
                  ),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
