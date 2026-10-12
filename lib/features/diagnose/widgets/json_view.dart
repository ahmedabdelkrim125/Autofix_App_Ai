import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';

class JsonView extends StatelessWidget {
  const JsonView({super.key, required this.data});

  final Map<String, dynamic> data;

  static const Set<String> _hiddenKeys = {
    '_id',
    'id',
    '__v',
    'user',
    'userId',
    'createdAt',
    'updatedAt',
    'raw',
    'location',
  };

  static String _prettify(String key) {
    final spaced = key
        .replaceAllMapped(
          RegExp(r'([a-z0-9])([A-Z])'),
          (m) => '${m[1]} ${m[2]}',
        )
        .replaceAll('_', ' ')
        .trim();
    if (spaced.isEmpty) return key;
    return spaced[0].toUpperCase() + spaced.substring(1);
  }

  static bool _isEmpty(Object? value) {
    if (value == null) return true;
    if (value is String) return value.trim().isEmpty;
    if (value is Iterable) return value.isEmpty;
    if (value is Map) return value.isEmpty;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surfaceColor = isDark ? AppColors.surface : Colors.white;
    final textColor = isDark ? AppColors.textPrimary : Colors.black87;
    final textSecColor = isDark ? AppColors.textSecondary : Colors.black54;

    final entries = data.entries
        .where((e) => !_hiddenKeys.contains(e.key) && !_isEmpty(e.value))
        .toList();

    if (entries.isEmpty) {
      return Text(
        'No details available',
        style: TextStyle(color: textSecColor, fontSize: 14.sp),
      );
    }

    return Column(
      children: [
        for (final entry in entries)
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 16.h),
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: surfaceColor,
              borderRadius: BorderRadius.circular(16.r),
              boxShadow: isDark
                  ? []
                  : [BoxShadow(color: Colors.black12, blurRadius: 6)],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _prettify(entry.key),
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
                _buildValue(entry.value, textColor, textSecColor),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildValue(Object? value, Color textColor, Color textSecColor) {
    if (value is Map) {
      final items = value.entries.where((e) => !_isEmpty(e.value)).toList();
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final item in items)
            Padding(
              padding: EdgeInsets.only(bottom: 8.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _prettify(item.key.toString()),
                    style: TextStyle(
                      color: textSecColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  _buildValue(item.value, textColor, textSecColor),
                ],
              ),
            ),
        ],
      );
    }

    if (value is List) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final item in value.where((e) => !_isEmpty(e)))
            Padding(
              padding: EdgeInsets.only(bottom: 6.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 6.h, right: 8.w),
                    child: CircleAvatar(
                      radius: 3.r,
                      backgroundColor: AppColors.primary,
                    ),
                  ),
                  Expanded(child: _buildValue(item, textColor, textSecColor)),
                ],
              ),
            ),
        ],
      );
    }

    return Text(
      value.toString(),
      style: TextStyle(color: textColor, fontSize: 15.sp, height: 1.5),
    );
  }
}
