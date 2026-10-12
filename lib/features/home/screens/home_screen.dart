import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/networking/base_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../diagnose/data/models/fault_model.dart';
import '../../diagnose/screens/diagnosis_result_screen.dart';
import '../../notifications/screens/notifications_screen.dart';
import '../logic/home_cubit.dart';
import '../widgets/action_card.dart';
import '../widgets/category_item.dart';
import '../widgets/diagnosis_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.onSelectTab});

  final ValueChanged<int>? onSelectTab;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HomeCubit>()..fetch(),
      child: _HomeView(onSelectTab: onSelectTab),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({this.onSelectTab});

  final ValueChanged<int>? onSelectTab;

  static const List<FaultModel> _placeholders = [
    FaultModel(
      faultText: 'Loading latest diagnosis',
      status: 'Resolved',
      faultType: 'text',
      createdAt: '2026-01-01T00:00:00Z',
    ),
    FaultModel(
      faultText: 'Loading latest photo scan',
      status: 'Pending',
      faultType: 'image',
      createdAt: '2026-01-01T00:00:00Z',
    ),
    FaultModel(
      faultText: 'Loading repair check',
      status: 'In Progress',
      faultType: 'text',
      createdAt: '2026-01-01T00:00:00Z',
    ),
  ];

  void _selectTab(int index) => onSelectTab?.call(index);

  bool _isResolved(FaultModel fault) {
    final status = (fault.status ?? '').toLowerCase();
    return status.contains('resolv') ||
        status.contains('complet') ||
        status.contains('done') ||
        status.contains('closed');
  }

  bool _isActive(FaultModel fault) {
    final status = (fault.status ?? '').toLowerCase();
    return status.contains('progress') ||
        status.contains('pending') ||
        status.contains('open');
  }

  Color _statusColor(FaultModel fault) {
    if (_isResolved(fault)) return AppColors.success;
    if (_isActive(fault)) return AppColors.warning;
    return Colors.blue;
  }

  IconData _statusIcon(FaultModel fault) {
    if (_isResolved(fault)) return Icons.check_circle_outline;
    if (_isActive(fault)) return Icons.schedule;
    return Icons.auto_awesome;
  }

  IconData _faultIcon(FaultModel fault) {
    return fault.faultType == 'image'
        ? Icons.photo_camera_outlined
        : Icons.chat_bubble_outline;
  }

  String _statusLabel(String? status) {
    final value = (status ?? '').replaceAll(RegExp(r'[_-]'), ' ').trim();
    if (value.isEmpty) return 'Diagnosed';
    return value[0].toUpperCase() + value.substring(1);
  }

  String _dateLabel(DateTime? date) {
    if (date == null) return 'Recently';
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final value = DateTime(date.year, date.month, date.day);
    final diff = today.difference(value).inDays;
    if (diff == 0) return 'Today';
    if (diff == 1) return 'Yesterday';
    if (diff < 7) return '$diff days ago';
    return '${date.day}/${date.month}/${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppColors.background : const Color(0xFFF5F7FA);
    final surfaceColor = isDark ? AppColors.surface : Colors.white;
    final textColor = isDark ? AppColors.textPrimary : Colors.black87;
    final textSecColor = isDark ? AppColors.textSecondary : Colors.black54;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: () => context.read<HomeCubit>().fetch(),
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Header(
                  surfaceColor: surfaceColor,
                  textColor: textColor,
                  textSecColor: textSecColor,
                  isDark: isDark,
                ),
                SizedBox(height: 32.h),
                Text(
                  'What needs fixing\ntoday?',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 24.h),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectTab(1),
                        child: const ActionCard(
                          icon: Icons.chat_bubble_outline,
                          title: 'Describe Issue',
                          subtitle: "Tell us what's wrong",
                          iconColor: AppColors.primary,
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => _selectTab(1),
                        child: const ActionCard(
                          icon: Icons.camera_alt_outlined,
                          title: 'Scan & Detect',
                          subtitle: 'Take a photo',
                          iconColor: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                Text(
                  'Quick services',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryItem(
                      icon: Icons.manage_search,
                      label: 'Diagnose',
                      onTap: () => _selectTab(1),
                    ),
                    CategoryItem(
                      icon: Icons.history,
                      label: 'History',
                      onTap: () => _selectTab(2),
                    ),
                    CategoryItem(
                      icon: Icons.handyman_outlined,
                      label: 'Centers',
                      onTap: () => _selectTab(3),
                    ),
                    CategoryItem(
                      icon: Icons.local_shipping_outlined,
                      label: 'Tow Trucks',
                      onTap: () => _selectTab(3),
                    ),
                  ],
                ),
                SizedBox(height: 32.h),
                BlocBuilder<HomeCubit, BaseState<HomeData>>(
                  builder: (context, state) {
                    return _buildApiContent(
                      context,
                      state,
                      surfaceColor,
                      textColor,
                      textSecColor,
                      isDark,
                    );
                  },
                ),
                SizedBox(height: 24.h),
                _SafetyCard(
                  surfaceColor: surfaceColor,
                  textColor: textColor,
                  isDark: isDark,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildApiContent(
    BuildContext context,
    BaseState<HomeData> state,
    Color surfaceColor,
    Color textColor,
    Color textSecColor,
    bool isDark,
  ) {
    if (state is BaseFailure<HomeData>) {
      return _ErrorPanel(
        message: state.message,
        surfaceColor: surfaceColor,
        textColor: textColor,
        textSecColor: textSecColor,
        onRetry: () => context.read<HomeCubit>().fetch(),
      );
    }

    final isLoading = state is! BaseSuccess<HomeData>;
    final data = state is BaseSuccess<HomeData> ? state.data : null;
    final faults = data?.latest ?? _placeholders;
    final recentCount = data?.recentDiagnoses.length ?? 3;
    final resolvedCount = data?.resolvedCount ?? 2;
    final activeCount = data?.activeCount ?? 1;

    return Skeletonizer(
      enabled: isLoading,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: _StatCard(
                  value: '$recentCount',
                  label: 'Recent',
                  color: textColor,
                  surfaceColor: surfaceColor,
                  isDark: isDark,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _StatCard(
                  value: '$resolvedCount',
                  label: 'Resolved',
                  color: AppColors.success,
                  surfaceColor: surfaceColor,
                  isDark: isDark,
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: _StatCard(
                  value: '$activeCount',
                  label: 'Active',
                  color: AppColors.warning,
                  surfaceColor: surfaceColor,
                  isDark: isDark,
                ),
              ),
            ],
          ),
          SizedBox(height: 32.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Diagnoses',
                style: TextStyle(
                  color: textColor,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _selectTab(2),
                child: Row(
                  children: [
                    Text(
                      'View All',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: AppColors.primary,
                      size: 16.sp,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          if (!isLoading && faults.isEmpty)
            _EmptyPanel(surfaceColor: surfaceColor, textSecColor: textSecColor)
          else
            for (final fault in faults)
              Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: DiagnosisCard(
                  icon: _faultIcon(fault),
                  iconColor: AppColors.primary,
                  title: fault.title,
                  date: _dateLabel(fault.date),
                  status: _statusLabel(fault.status),
                  statusColor: _statusColor(fault),
                  statusIcon: _statusIcon(fault),
                  onTap: isLoading
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  DiagnosisResultScreen(fault: fault),
                            ),
                          );
                        },
                ),
              ),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    required this.surfaceColor,
    required this.textColor,
    required this.textSecColor,
    required this.isDark,
  });

  final Color surfaceColor;
  final Color textColor;
  final Color textSecColor;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(Icons.settings, color: AppColors.primary, size: 28.sp),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Auto ',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Fix',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'AI Diagnostics',
                  style: TextStyle(color: textSecColor, fontSize: 10.sp),
                ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const NotificationsScreen()),
          ),
          child: Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: surfaceColor,
              shape: BoxShape.circle,
              boxShadow: isDark
                  ? []
                  : [const BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: Icon(
              Icons.notifications_none,
              color: textColor,
              size: 20.sp,
            ),
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.value,
    required this.label,
    required this.color,
    required this.surfaceColor,
    required this.isDark,
  });

  final String value;
  final String label;
  final Color color;
  final Color surfaceColor;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: isDark
            ? []
            : [const BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        children: [
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: color,
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: isDark ? AppColors.textSecondary : Colors.black54,
              fontSize: 11.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorPanel extends StatelessWidget {
  const _ErrorPanel({
    required this.message,
    required this.surfaceColor,
    required this.textColor,
    required this.textSecColor,
    required this.onRetry,
  });

  final String message;
  final Color surfaceColor;
  final Color textColor;
  final Color textSecColor;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Icon(Icons.cloud_off_outlined, color: Colors.redAccent, size: 28.sp),
          SizedBox(height: 10.h),
          Text(
            'Could not load home data',
            style: TextStyle(
              color: textColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: textSecColor, fontSize: 12.sp),
          ),
          SizedBox(height: 10.h),
          TextButton(
            onPressed: onRetry,
            child: Text(
              'Retry',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyPanel extends StatelessWidget {
  const _EmptyPanel({required this.surfaceColor, required this.textSecColor});

  final Color surfaceColor;
  final Color textSecColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.w),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        children: [
          Icon(
            Icons.fact_check_outlined,
            color: AppColors.primary,
            size: 28.sp,
          ),
          SizedBox(height: 8.h),
          Text(
            'No diagnoses yet',
            style: TextStyle(color: textSecColor, fontSize: 14.sp),
          ),
        ],
      ),
    );
  }
}

class _SafetyCard extends StatelessWidget {
  const _SafetyCard({
    required this.surfaceColor,
    required this.textColor,
    required this.isDark,
  });

  final Color surfaceColor;
  final Color textColor;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primary.withOpacity(0.85), surfaceColor],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: isDark
            ? []
            : [
                const BoxShadow(
                  color: Colors.black12,
                  blurRadius: 8,
                  offset: Offset(0, 4),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.shield_outlined, color: textColor, size: 20.sp),
              SizedBox(width: 8.w),
              Text(
                'Safety First',
                style: TextStyle(
                  color: textColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            'Always disconnect power sources before attempting electrical or appliance repairs. When in doubt, consult a professional.',
            style: TextStyle(
              color: textColor.withOpacity(0.85),
              fontSize: 12.sp,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
