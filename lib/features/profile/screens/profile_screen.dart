import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/networking/base_state.dart';
import '../../../core/networking/models/message_response.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/snackbar_helper.dart';
import '../../../main.dart';
import '../../auth/screens/login_screen.dart';
import '../data/models/user_model.dart';
import '../logic/logout_cubit.dart';
import '../logic/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ProfileCubit>()..fetchProfile()),
        BlocProvider(create: (_) => getIt<LogoutCubit>()),
      ],
      child: const _ProfileView(),
    );
  }
}

class _ProfileView extends StatefulWidget {
  const _ProfileView();

  @override
  State<_ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<_ProfileView> {
  bool isNotificationsEnabled = true;
  bool isLocationEnabled = true;

  void _toggleTheme() {
    if (themeNotifier.value == ThemeMode.dark) {
      themeNotifier.value = ThemeMode.light;
      SnackbarHelper.showTopSnackbar(context, 'Light Mode Activated');
    } else {
      themeNotifier.value = ThemeMode.dark;
      SnackbarHelper.showTopSnackbar(context, 'Dark Mode Activated');
    }
    setState(() {});
  }

  String _initials(String? name) {
    final parts = (name ?? '')
        .trim()
        .split(RegExp(r'\s+'))
        .where((e) => e.isNotEmpty)
        .toList();
    if (parts.isEmpty) return '?';
    if (parts.length == 1) return parts.first.substring(0, 1).toUpperCase();
    return (parts.first.substring(0, 1) + parts.last.substring(0, 1))
        .toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = themeNotifier.value == ThemeMode.dark;
    Color surfaceColor = isDark ? AppColors.surface : Colors.white;
    Color textColor = isDark ? AppColors.textPrimary : Colors.black87;
    Color bgColor = isDark ? AppColors.background : const Color(0xFFF5F7FA);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              BlocBuilder<ProfileCubit, BaseState<UserModel>>(
                builder: (context, state) {
                  final isLoading =
                      state is BaseLoading<UserModel> ||
                      state is BaseInitial<UserModel>;
                  final user = state is BaseSuccess<UserModel>
                      ? state.data
                      : null;
                  final failureMessage = state is BaseFailure<UserModel>
                      ? state.message
                      : null;

                  final name = isLoading
                      ? 'Loading name'
                      : (user?.name ?? 'Unknown user');
                  final subtitle = isLoading
                      ? 'loading@email.com'
                      : (failureMessage ?? user?.email ?? user?.phone ?? '');

                  return Skeletonizer(
                    enabled: isLoading,
                    child: Column(
                      children: [
                        Container(
                          width: 100.w,
                          height: 100.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: surfaceColor,
                            border: Border.all(
                              color: AppColors.primary,
                              width: 2.w,
                            ),
                            boxShadow: isDark
                                ? []
                                : [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 6,
                                    ),
                                  ],
                          ),
                          child: Center(
                            child: Text(
                              _initials(isLoading ? 'AM' : user?.name),
                              style: TextStyle(
                                color: textColor,
                                fontSize: 32.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          name,
                          style: TextStyle(
                            color: textColor,
                            fontSize: 24.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Text(
                          subtitle,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: failureMessage != null
                                ? Colors.redAccent
                                : AppColors.textSecondary,
                            fontSize: 14.sp,
                          ),
                        ),
                        if (failureMessage != null)
                          TextButton(
                            onPressed: () =>
                                context.read<ProfileCubit>().fetchProfile(),
                            child: Text(
                              'Retry',
                              style: TextStyle(
                                color: AppColors.primary,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 32.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Preferences',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: isDark
                      ? []
                      : [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                ),
                child: Column(
                  children: [
                    _buildSwitchTile(
                      Icons.notifications_none,
                      'Notifications',
                      isNotificationsEnabled,
                      (v) => setState(() => isNotificationsEnabled = v),
                      textColor,
                    ),
                    _buildSwitchTile(
                      Icons.location_on_outlined,
                      'Location Services',
                      isLocationEnabled,
                      (v) => setState(() => isLocationEnabled = v),
                      textColor,
                    ),
                    ListTile(
                      leading: Icon(
                        Icons.dark_mode_outlined,
                        color: textColor,
                        size: 24.sp,
                      ),
                      title: Text(
                        'Dark Mode',
                        style: TextStyle(color: textColor, fontSize: 16.sp),
                      ),
                      trailing: TextButton(
                        onPressed: _toggleTheme,
                        child: Text(
                          isDark ? 'Always On' : 'Always Off',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Support & About',
                  style: TextStyle(
                    color: AppColors.textSecondary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: isDark
                      ? []
                      : [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                ),
                child: Column(
                  children: [
                    _buildListTile(
                      Icons.shield_outlined,
                      'Privacy & Safety',
                      textColor,
                      showArrow: true,
                      onTap: () => SnackbarHelper.showTopSnackbar(
                        context,
                        'Privacy Settings',
                      ),
                    ),
                    _buildListTile(
                      Icons.help_outline,
                      'Help Center',
                      textColor,
                      showArrow: true,
                      onTap: () => SnackbarHelper.showTopSnackbar(
                        context,
                        'Help Center',
                      ),
                    ),
                    _buildListTile(
                      Icons.settings_outlined,
                      'App Version',
                      textColor,
                      trailing: Text(
                        'v2.4.1',
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              BlocConsumer<LogoutCubit, BaseState<MessageResponse>>(
                listener: (context, state) {
                  if (state is BaseSuccess<MessageResponse> ||
                      state is BaseFailure<MessageResponse>) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false,
                    );
                    SnackbarHelper.showTopSnackbar(
                      context,
                      'Signed out successfully',
                    );
                  }
                },
                builder: (context, state) {
                  final isLoggingOut = state is BaseLoading<MessageResponse>;
                  return SizedBox(
                    width: double.infinity,
                    height: 56.h,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide.none,
                        backgroundColor: surfaceColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        elevation: isDark ? 0 : 2,
                      ),
                      onPressed: isLoggingOut
                          ? null
                          : () => context.read<LogoutCubit>().logout(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (isLoggingOut)
                            SizedBox(
                              width: 20.sp,
                              height: 20.sp,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.redAccent,
                              ),
                            )
                          else
                            Icon(
                              Icons.logout,
                              color: Colors.redAccent,
                              size: 20.sp,
                            ),
                          SizedBox(width: 8.w),
                          Text(
                            'Sign Out',
                            style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile(
    IconData icon,
    String title,
    bool value,
    ValueChanged<bool> onChanged,
    Color textColor,
  ) {
    return ListTile(
      leading: Icon(icon, color: textColor, size: 24.sp),
      title: Text(
        title,
        style: TextStyle(color: textColor, fontSize: 16.sp),
      ),
      trailing: Switch(
        value: value,
        activeColor: AppColors.primary,
        onChanged: onChanged,
      ),
    );
  }

  Widget _buildListTile(
    IconData icon,
    String title,
    Color textColor, {
    Widget? trailing,
    bool showArrow = false,
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: textColor, size: 24.sp),
      title: Text(
        title,
        style: TextStyle(color: textColor, fontSize: 16.sp),
      ),
      trailing:
          trailing ??
          (showArrow
              ? Icon(
                  Icons.chevron_right,
                  color: AppColors.textSecondary,
                  size: 24.sp,
                )
              : null),
    );
  }
}
