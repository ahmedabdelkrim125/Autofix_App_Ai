import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/snackbar_helper.dart';
import '../../../core/widgets/custom_button.dart';

class DiagnoseScreen extends StatefulWidget {
  const DiagnoseScreen({super.key});

  @override
  State<DiagnoseScreen> createState() => _DiagnoseScreenState();
}

class _DiagnoseScreenState extends State<DiagnoseScreen> {
  bool isDescribe = true;
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
        SnackbarHelper.showTopSnackbar(context, 'Image attached successfully!');
      }
    } catch (e) {
      SnackbarHelper.showTopSnackbar(
        context,
        'Failed to pick image',
        isError: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppColors.background : const Color(0xFFF5F7FA);
    final surfaceColor = isDark ? AppColors.surface : Colors.white;
    final textColor = isDark ? AppColors.textPrimary : Colors.black87;
    final textSecColor = isDark ? AppColors.textSecondary : Colors.black54;
    final borderCol = isDark
        ? AppColors.textSecondary.withOpacity(0.3)
        : Colors.grey.withOpacity(0.3);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: textColor, size: 24.sp),
        title: Text(
          'New Diagnosis',
          style: TextStyle(
            color: textColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50.h,
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: BorderRadius.circular(12.r),
                boxShadow: isDark
                    ? []
                    : [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isDescribe = true),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isDescribe
                              ? (isDark
                                    ? AppColors.surface
                                    : const Color(0xFFE2E8F0))
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                          border: isDescribe
                              ? Border.all(color: borderCol)
                              : null,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.chat_bubble_outline,
                                color: isDescribe ? textColor : textSecColor,
                                size: 18.sp,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Describe',
                                style: TextStyle(
                                  color: isDescribe ? textColor : textSecColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => isDescribe = false),
                      child: Container(
                        decoration: BoxDecoration(
                          color: !isDescribe
                              ? (isDark
                                    ? AppColors.surface
                                    : const Color(0xFFE2E8F0))
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(12.r),
                          border: !isDescribe
                              ? Border.all(color: borderCol)
                              : null,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt_outlined,
                                color: !isDescribe ? textColor : textSecColor,
                                size: 18.sp,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Photo Scan',
                                style: TextStyle(
                                  color: !isDescribe ? textColor : textSecColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),
            Expanded(
              child: isDescribe
                  ? _buildDescribeView(
                      surfaceColor,
                      textColor,
                      textSecColor,
                      isDark,
                    )
                  : _buildPhotoScanView(
                      surfaceColor,
                      textColor,
                      textSecColor,
                      isDark,
                    ),
            ),
            CustomButton(
              text: 'Analyze Issue',
              onPressed: () =>
                  SnackbarHelper.showTopSnackbar(context, 'Analyzing Issue...'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDescribeView(
    Color surfaceColor,
    Color textColor,
    Color textSecColor,
    bool isDark,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Category (Optional)',
          style: TextStyle(
            color: textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          height: 56.h,
          decoration: BoxDecoration(
            color: surfaceColor,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: isDark
                ? []
                : [BoxShadow(color: Colors.black12, blurRadius: 4)],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Auto-detect category',
                style: TextStyle(color: textSecColor, fontSize: 16.sp),
              ),
              Icon(Icons.keyboard_arrow_down, color: textSecColor, size: 24.sp),
            ],
          ),
        ),
        SizedBox(height: 24.h),
        Text(
          'Issue Description',
          style: TextStyle(
            color: textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 12.h),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(16.w),
            decoration: BoxDecoration(
              color: surfaceColor,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: isDark
                  ? []
                  : [BoxShadow(color: Colors.black12, blurRadius: 4)],
            ),
            child: TextField(
              maxLines: null,
              style: TextStyle(color: textColor, fontSize: 16.sp),
              decoration: InputDecoration(
                hintText: 'E.g., My car makes a clicking sound when I tr...',
                hintStyle: TextStyle(color: textSecColor, fontSize: 16.sp),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
        SizedBox(height: 24.h),
      ],
    );
  }

  Widget _buildPhotoScanView(
    Color surfaceColor,
    Color textColor,
    Color textSecColor,
    bool isDark,
  ) {
    return Column(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: _pickImage,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: BorderRadius.circular(16.r),
                boxShadow: isDark
                    ? []
                    : [BoxShadow(color: Colors.black12, blurRadius: 4)],
                image: _selectedImage != null
                    ? DecorationImage(
                        image: FileImage(_selectedImage!),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3),
                          BlendMode.darken,
                        ),
                      )
                    : null,
              ),
              child: _selectedImage == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(16.w),
                          decoration: BoxDecoration(
                            color: isDark
                                ? AppColors.background
                                : const Color(0xFFF5F7FA),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.upload_outlined,
                            color: AppColors.primary,
                            size: 32.sp,
                          ),
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'Upload a Photo',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 40.w),
                          child: Text(
                            'Take a clear picture of the broken part, error code, or issue.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: textSecColor,
                              fontSize: 14.sp,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    )
                  : Center(
                      child: Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 28.sp,
                        ),
                      ),
                    ),
            ),
          ),
        ),
        SizedBox(height: 24.h),
        if (_selectedImage != null)
          TextButton.icon(
            onPressed: () => setState(() => _selectedImage = null),
            icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
            label: const Text(
              'Remove Image',
              style: TextStyle(color: Colors.redAccent),
            ),
          ),
      ],
    );
  }
}
