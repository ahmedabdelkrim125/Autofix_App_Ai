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
import '../logic/forgot_password_cubit.dart';
import 'reset_password_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ForgotPasswordCubit>(),
      child: const _ForgotPasswordView(),
    );
  }
}

class _ForgotPasswordView extends StatefulWidget {
  const _ForgotPasswordView();

  @override
  State<_ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<_ForgotPasswordView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleSend(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ForgotPasswordCubit>().sendCode(
        _emailController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = themeNotifier.value == ThemeMode.dark;
    final bgColor = isDark ? AppColors.background : const Color(0xFFF5F7FA);
    final textColor = isDark ? AppColors.textPrimary : Colors.black87;

    return BlocConsumer<ForgotPasswordCubit, BaseState<MessageResponse>>(
      listener: (context, state) {
        if (state is BaseLoading<MessageResponse>) {
          AppLoadingDialog.show(context, message: 'Sending verification code');
          return;
        }
        AppLoadingDialog.hide(context);
        if (state is BaseSuccess<MessageResponse>) {
          SnackbarHelper.showTopSnackbar(
            context,
            state.data.message ?? 'Verification code sent to your email',
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) =>
                  ResetPasswordScreen(email: _emailController.text.trim()),
            ),
          );
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
          body: Padding(
            padding: EdgeInsets.all(24.w),
            child: Form(
              key: _formKey,
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
                    'Enter your email to receive a verification code',
                    style: TextStyle(
                      color: isDark ? AppColors.textSecondary : Colors.black54,
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
                        return 'Please enter an email';
                      if (!value.contains('@'))
                        return 'Please enter a valid email';
                      return null;
                    },
                  ),
                  SizedBox(height: 24.h),
                  CustomButton(
                    text: 'Send Code',
                    onPressed: () => _handleSend(context),
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
