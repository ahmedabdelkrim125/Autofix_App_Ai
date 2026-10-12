import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/networking/base_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../diagnose/data/models/fault_model.dart';
import '../../diagnose/screens/diagnosis_result_screen.dart';
import '../logic/history_cubit.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<HistoryCubit>()..fetch(),
      child: const _HistoryView(),
    );
  }
}

class _HistoryView extends StatefulWidget {
  const _HistoryView();

  @override
  State<_HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<_HistoryView> {
  int _filter = 0;

  static const List<String> _months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  static const List<FaultModel> _placeholders = [
    FaultModel(
      faultText: 'Loading diagnosis title',
      status: 'Resolved',
      difficulty: 'easy',
      createdAt: '2026-01-01T00:00:00Z',
    ),
    FaultModel(
      faultText: 'Loading diagnosis title',
      status: 'Pending',
      difficulty: 'easy',
      createdAt: '2026-01-01T00:00:00Z',
    ),
    FaultModel(
      faultText: 'Loading diagnosis title',
      status: 'Resolved',
      difficulty: 'easy',
      createdAt: '2026-01-01T00:00:00Z',
    ),
    FaultModel(
      faultText: 'Loading diagnosis title',
      status: 'Pending',
      difficulty: 'easy',
      createdAt: '2026-01-01T00:00:00Z',
    ),
  ];

  bool _isResolved(FaultModel f) {
    final s = (f.status ?? '').toLowerCase();
    return s.contains('resolv') ||
        s.contains('complet') ||
        s.contains('done') ||
        s.contains('closed');
  }

  bool _isInProgress(FaultModel f) {
    final s = (f.status ?? '').toLowerCase();
    return s.contains('progress') ||
        s.contains('pending') ||
        s.contains('open');
  }

  bool _matches(FaultModel f) {
    switch (_filter) {
      case 1:
        return _isResolved(f);
      case 2:
        return _isInProgress(f);
      default:
        return true;
    }
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    final day = date.day.toString().padLeft(2, '0');
    return '${_months[date.month - 1]} $day, ${date.year}';
  }

  String _statusLabel(String? status) {
    final value = (status ?? '').replaceAll(RegExp(r'[_-]'), ' ').trim();
    if (value.isEmpty) return 'Diagnosed';
    return value[0].toUpperCase() + value.substring(1);
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
        child: BlocBuilder<HistoryCubit, BaseState<List<FaultModel>>>(
          builder: (context, state) {
            final isLoading =
                state is! BaseSuccess<List<FaultModel>> &&
                state is! BaseFailure<List<FaultModel>>;
            final all = state is BaseSuccess<List<FaultModel>>
                ? state.data
                : (isLoading ? _placeholders : <FaultModel>[]);
            final items = all.where(_matches).toList();
            final resolved = all.where(_isResolved).length;
            final inProgress = all.where(_isInProgress).length;
            final successRate = all.isEmpty
                ? 0
                : (resolved * 100 / all.length).round();

            return SingleChildScrollView(
              padding: EdgeInsets.all(24.w),
              child: Skeletonizer(
                enabled: isLoading,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Repair History',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Track your past diagnoses and fixes',
                      style: TextStyle(color: textSecColor, fontSize: 14.sp),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildStatCard(
                          '${all.length}',
                          'Total Fixes',
                          textColor,
                          surfaceColor,
                          isDark,
                        ),
                        _buildStatCard(
                          '$successRate%',
                          'Success',
                          AppColors.primary,
                          surfaceColor,
                          isDark,
                        ),
                        _buildStatCard(
                          '$inProgress',
                          'In Progress',
                          AppColors.success,
                          surfaceColor,
                          isDark,
                        ),
                      ],
                    ),
                    SizedBox(height: 24.h),
                    Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: surfaceColor,
                        borderRadius: BorderRadius.circular(12.r),
                        boxShadow: isDark
                            ? []
                            : [BoxShadow(color: Colors.black12, blurRadius: 4)],
                      ),
                      child: Row(
                        children: [
                          _buildTab('All', 0, textColor, textSecColor),
                          _buildTab('Resolved', 1, textColor, textSecColor),
                          _buildTab('In Progress', 2, textColor, textSecColor),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    if (state is BaseFailure<List<FaultModel>>) ...[
                      Center(
                        child: Column(
                          children: [
                            Text(
                              state.message,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 14.sp,
                              ),
                            ),
                            TextButton(
                              onPressed: () =>
                                  context.read<HistoryCubit>().fetch(),
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
                      ),
                    ] else if (items.isEmpty)
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 32.h),
                          child: Text(
                            'No diagnoses yet',
                            style: TextStyle(
                              color: textSecColor,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      )
                    else
                      for (final fault in items)
                        Padding(
                          padding: EdgeInsets.only(bottom: 16.h),
                          child: _buildHistoryCard(
                            context,
                            fault,
                            surfaceColor,
                            textColor,
                            textSecColor,
                            isDark,
                          ),
                        ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildTab(
    String label,
    int index,
    Color textColor,
    Color textSecColor,
  ) {
    final selected = _filter == index;
    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => setState(() => _filter = index),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: selected ? textColor : textSecColor,
              fontSize: 14.sp,
              fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    String value,
    String label,
    Color valueColor,
    Color surfaceColor,
    bool isDark,
  ) {
    return Container(
      width: 105.w,
      padding: EdgeInsets.symmetric(vertical: 20.h),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: isDark
            ? []
            : [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            label,
            style: TextStyle(
              color: isDark ? AppColors.textSecondary : Colors.black54,
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(
    BuildContext context,
    FaultModel fault,
    Color surfaceColor,
    Color textColor,
    Color textSecColor,
    bool isDark,
  ) {
    final resolved = _isResolved(fault);
    final statusColor = resolved
        ? AppColors.success
        : (_isInProgress(fault) ? AppColors.warning : Colors.blue);
    final icon = fault.faultType == 'image'
        ? Icons.photo_camera_outlined
        : Icons.chat_bubble_outline;

    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => DiagnosisResultScreen(fault: fault)),
      ),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: surfaceColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: isDark
              ? []
              : [BoxShadow(color: Colors.black12, blurRadius: 6)],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: isDark ? AppColors.background : const Color(0xFFF5F7FA),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(icon, color: textSecColor, size: 24.sp),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fault.title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          resolved
                              ? Icons.check_circle_outline
                              : Icons.schedule,
                          color: statusColor,
                          size: 14.sp,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          _statusLabel(fault.status),
                          style: TextStyle(
                            color: statusColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _formatDate(fault.date),
                  style: TextStyle(color: textSecColor, fontSize: 12.sp),
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    Text(
                      fault.difficulty ?? '',
                      style: TextStyle(color: textSecColor, fontSize: 14.sp),
                    ),
                    SizedBox(width: 8.w),
                    Icon(Icons.chevron_right, color: textSecColor, size: 20.sp),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
