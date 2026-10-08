import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/snackbar_helper.dart';

class ExpertsScreen extends StatelessWidget {
  const ExpertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppColors.background : const Color(0xFFF5F7FA);
    final surfaceColor = isDark ? AppColors.surface : Colors.white;
    final textColor = isDark ? AppColors.textPrimary : Colors.black87;
    final textSecColor = isDark ? AppColors.textSecondary : Colors.black54;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: textColor, size: 24.sp),
        title: Text('Nearby Experts', style: TextStyle(color: textColor, fontSize: 20.sp, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50.h,
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      decoration: BoxDecoration(color: surfaceColor, borderRadius: BorderRadius.circular(12.r), boxShadow: isDark ? [] : [BoxShadow(color: Colors.black12, blurRadius: 4)]),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              style: TextStyle(color: textColor, fontSize: 14.sp),
                              decoration: InputDecoration(
                                hintText: 'Search by name or specialty...',
                                hintStyle: TextStyle(color: textSecColor, fontSize: 14.sp),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(color: surfaceColor, borderRadius: BorderRadius.circular(12.r), boxShadow: isDark ? [] : [BoxShadow(color: Colors.black12, blurRadius: 4)]),
                    child: Icon(Icons.tune, color: textSecColor, size: 24.sp),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryChip('All', true, surfaceColor, textSecColor),
                    _buildCategoryChip('Automotive', false, surfaceColor, textSecColor),
                    _buildCategoryChip('Electronics', false, surfaceColor, textSecColor),
                    _buildCategoryChip('Appliances', false, surfaceColor, textSecColor),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              _buildExpertCard(context, 'MJ', 'Marcus Johnson', 'Automotive Specialist', '4.9', '(128)', '1.2 mi', Colors.blueAccent, surfaceColor, textColor, textSecColor, isDark),
              SizedBox(height: 16.h),
              _buildExpertCard(context, 'SC', 'Sarah Chen', 'Electronics Repair', '4.8', '(84)', '2.5 mi', Colors.purpleAccent, surfaceColor, textColor, textSecColor, isDark),
              SizedBox(height: 16.h),
              _buildExpertCard(context, 'DR', 'David Rodriguez', 'Appliance Expert', '4.6', '(215)', '3.8 mi', Colors.green, surfaceColor, textColor, textSecColor, isDark),
              SizedBox(height: 16.h),
              _buildExpertCard(context, 'MA', "Mike's Auto Shop", 'Automotive Specialist', '4.7', '(450)', '4.1 mi', AppColors.primary, surfaceColor, textColor, textSecColor, isDark),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected, Color surfaceColor, Color textSecColor) {
    return Container(
      margin: EdgeInsets.only(right: 12.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.primary : surfaceColor,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.black : textSecColor,
          fontSize: 14.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildExpertCard(BuildContext context, String initial, String name, String specialty, String rating, String reviews, String distance, Color avatarColor, Color surfaceColor, Color textColor, Color textSecColor, bool isDark) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: surfaceColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: isDark ? [] : [BoxShadow(color: Colors.black12, blurRadius: 6, offset: const Offset(0, 3))],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(radius: 28.r, backgroundColor: avatarColor, child: Text(initial, style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold))),
                  Positioned(bottom: 0, right: 0, child: CircleAvatar(radius: 7.r, backgroundColor: surfaceColor, child: CircleAvatar(radius: 5.r, backgroundColor: AppColors.success))),
                ],
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(name, style: TextStyle(color: textColor, fontSize: 18.sp, fontWeight: FontWeight.bold)),
                        SizedBox(width: 8.w),
                        Icon(Icons.verified, color: Colors.blue, size: 16.sp),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(specialty, style: TextStyle(color: textSecColor, fontSize: 14.sp)),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Icon(Icons.star, color: AppColors.primary, size: 16.sp),
                        SizedBox(width: 4.w),
                        Text(rating, style: TextStyle(color: AppColors.primary, fontSize: 14.sp, fontWeight: FontWeight.bold)),
                        SizedBox(width: 4.w),
                        Text(reviews, style: TextStyle(color: textSecColor, fontSize: 14.sp)),
                        Padding(padding: EdgeInsets.symmetric(horizontal: 8.w), child: CircleAvatar(radius: 2.r, backgroundColor: textSecColor)),
                        Icon(Icons.location_on_outlined, color: textSecColor, size: 14.sp),
                        SizedBox(width: 4.w),
                        Text(distance, style: TextStyle(color: textSecColor, fontSize: 14.sp)),
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
                  onPressed: () => SnackbarHelper.showTopSnackbar(context, 'Opening profile for $name...'),
                  style: OutlinedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    side: BorderSide(color: textSecColor.withOpacity(0.3)),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                  ),
                  child: Text('View Profile', style: TextStyle(color: textColor, fontSize: 14.sp, fontWeight: FontWeight.bold)),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () => SnackbarHelper.showTopSnackbar(context, 'Calling $name...'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone_outlined, color: Colors.black, size: 18.sp),
                      SizedBox(width: 8.w),
                      Text('Contact', style: TextStyle(color: Colors.black, fontSize: 14.sp, fontWeight: FontWeight.bold)),
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