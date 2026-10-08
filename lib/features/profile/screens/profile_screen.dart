import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../main.dart';
import '../../auth/screens/login_screen.dart';
import '../../../core/utils/snackbar_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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

  void _signOut() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
    SnackbarHelper.showTopSnackbar(context, 'Signed out successfully');
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
              Container(
                width: 100.w,
                height: 100.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: surfaceColor,
                  border: Border.all(color: AppColors.primary, width: 2.w),
                  boxShadow: isDark ? [] : [BoxShadow(color: Colors.black12, blurRadius: 6)],
                ),
                child: Center(
                  child: Text('AM', style: TextStyle(color: textColor, fontSize: 32.sp, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(height: 16.h),
              Text('Alex Morgan', style: TextStyle(color: textColor, fontSize: 24.sp, fontWeight: FontWeight.bold)),
              SizedBox(height: 8.h),
              Text('Pro DIYer • Member since 2022', style: TextStyle(color: AppColors.textSecondary, fontSize: 14.sp)),
              SizedBox(height: 32.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Preferences', style: TextStyle(color: AppColors.textSecondary, fontSize: 14.sp, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: isDark ? [] : [BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 5))],
                ),
                child: Column(
                  children: [
                    _buildSwitchTile(Icons.notifications_none, 'Notifications', isNotificationsEnabled, (v) => setState(() => isNotificationsEnabled = v), textColor),
                    _buildSwitchTile(Icons.location_on_outlined, 'Location Services', isLocationEnabled, (v) => setState(() => isLocationEnabled = v), textColor),
                    ListTile(
                      leading: Icon(Icons.dark_mode_outlined, color: textColor, size: 24.sp),
                      title: Text('Dark Mode', style: TextStyle(color: textColor, fontSize: 16.sp)),
                      trailing: TextButton(
                        onPressed: _toggleTheme,
                        child: Text(isDark ? 'Always On' : 'Always Off', style: TextStyle(color: AppColors.primary, fontSize: 14.sp)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Support & About', style: TextStyle(color: AppColors.textSecondary, fontSize: 14.sp, fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 16.h),
              Container(
                decoration: BoxDecoration(
                  color: surfaceColor,
                  borderRadius: BorderRadius.circular(16.r),
                  boxShadow: isDark ? [] : [BoxShadow(color: Colors.black12, blurRadius: 10, offset: const Offset(0, 5))],
                ),
                child: Column(
                  children: [
                    _buildListTile(Icons.shield_outlined, 'Privacy & Safety', textColor, showArrow: true, onTap: () => SnackbarHelper.showTopSnackbar(context, 'Privacy Settings')),
                    _buildListTile(Icons.help_outline, 'Help Center', textColor, showArrow: true, onTap: () => SnackbarHelper.showTopSnackbar(context, 'Help Center')),
                    _buildListTile(Icons.settings_outlined, 'App Version', textColor, trailing: Text('v2.4.1', style: TextStyle(color: AppColors.textSecondary, fontSize: 14.sp))),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              SizedBox(
                width: double.infinity,
                height: 56.h,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide.none,
                    backgroundColor: surfaceColor,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                    elevation: isDark ? 0 : 2,
                  ),
                  onPressed: _signOut,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout, color: Colors.redAccent, size: 20.sp),
                      SizedBox(width: 8.w),
                      Text('Sign Out', style: TextStyle(color: Colors.redAccent, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTile(IconData icon, String title, bool value, ValueChanged<bool> onChanged, Color textColor) {
    return ListTile(
      leading: Icon(icon, color: textColor, size: 24.sp),
      title: Text(title, style: TextStyle(color: textColor, fontSize: 16.sp)),
      trailing: Switch(value: value, activeColor: AppColors.primary, onChanged: onChanged),
    );
  }

  Widget _buildListTile(IconData icon, String title, Color textColor, {Widget? trailing, bool showArrow = false, VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: textColor, size: 24.sp),
      title: Text(title, style: TextStyle(color: textColor, fontSize: 16.sp)),
      trailing: trailing ?? (showArrow ? Icon(Icons.chevron_right, color: AppColors.textSecondary, size: 24.sp) : null),
    );
  }
}