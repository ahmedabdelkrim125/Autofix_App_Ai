import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';

class ExpertCard extends StatelessWidget {
  const ExpertCard({
    super.key,
    required this.name,
    required this.subtitle,
    required this.rating,
    required this.reviews,
    required this.info,
    required this.isOnline,
    required this.onViewProfile,
    required this.onContact,
  });

  final String name;
  final String subtitle;
  final String rating;
  final String reviews;
  final String info;
  final bool isOnline;
  final VoidCallback onViewProfile;
  final VoidCallback onContact;

  static const List<Color> _palette = [
    Colors.blueAccent,
    Colors.purpleAccent,
    Colors.green,
    AppColors.primary,
    Colors.teal,
    Colors.pinkAccent,
  ];

  String get _initial {
    final parts = name
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
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final surfaceColor = isDark ? AppColors.surface : Colors.white;
    final textColor = isDark ? AppColors.textPrimary : Colors.black87;
    final textSecColor = isDark ? AppColors.textSecondary : Colors.black54;
    final avatarColor = _palette[name.length % _palette.length];

    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 28.r,
                    backgroundColor: avatarColor,
                    child: Text(
                      _initial,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 7.r,
                      backgroundColor: surfaceColor,
                      child: CircleAvatar(
                        radius: 5.r,
                        backgroundColor: isOnline
                            ? AppColors.success
                            : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: textSecColor, fontSize: 14.sp),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Icon(Icons.star, color: AppColors.primary, size: 16.sp),
                        SizedBox(width: 4.w),
                        Text(
                          rating,
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          reviews,
                          style: TextStyle(
                            color: textSecColor,
                            fontSize: 14.sp,
                          ),
                        ),
                        if (info.isNotEmpty) ...[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: CircleAvatar(
                              radius: 2.r,
                              backgroundColor: textSecColor,
                            ),
                          ),
                          Icon(
                            Icons.location_on_outlined,
                            color: textSecColor,
                            size: 14.sp,
                          ),
                          SizedBox(width: 4.w),
                          Flexible(
                            child: Text(
                              info,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: textSecColor,
                                fontSize: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onViewProfile,
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    side: BorderSide(color: textSecColor.withOpacity(0.3)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Text(
                    'View Profile',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: onContact,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        color: Colors.black,
                        size: 18.sp,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        'Contact',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
