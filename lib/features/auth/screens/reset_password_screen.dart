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
import '../logic/reset_password_cubit.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ResetPasswordCubit>(),
      child: _ResetPasswordView(email: email),
    );
  }
}

class _ResetPasswordView extends StatefulWidget {
  const _ResetPasswordView({required this.email});

  final String email;

  @override
  State<_ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<_ResetPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _otpController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleReset(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ResetPasswordCubit>().resetPassword(
        email: widget.email,
        otp: _otpController.text.trim(),
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

    return BlocConsumer<ResetPasswordCubit, BaseState<MessageResponse>>(
      listener: (context, state) {
        if (state is BaseLoading<MessageResponse>) {
          AppLoadingDialog.show(context, message: 'Resetting your password');
          return;
        }
        AppLoadingDialog.hide(context);
        if (state is BaseSuccess<MessageResponse>) {
          SnackbarHelper.showTopSnackbar(
            context,
            state.data.message ?? 'Password reset successfully',
          );
          Navigator.popUntil(context, (route) => route.isFirst);
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
            padding: EdgeInsets.all(24.w),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Password',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Enter the code sent to ${widget.email} and choose a new password',
                    style: TextStyle(
                      color: isDark ? AppColors.textSecondary : Colors.black54,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(height: 32.h),
                  CustomTextField(
                    hint: 'Verification code',
                    controller: _otpController,
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        (value == null || value.trim().isEmpty)
                        ? 'Please enter the code'
                        : null,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hint: 'New password',
                    isPassword: true,
                    controller: _passwordController,
                    validator: (value) => (value == null || value.length < 6)
                        ? 'Password too short'
                        : null,
                  ),
                  SizedBox(height: 16.h),
                  CustomTextField(
                    hint: 'Confirm new password',
                    isPassword: true,
                    controller: _confirmPasswordController,
                    validator: (value) => value != _passwordController.text
                        ? 'Passwords do not match'
                        : null,
                  ),
                  SizedBox(height: 24.h),
                  CustomButton(
                    text: 'Reset Password',
                    onPressed: () => _handleReset(context),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
