import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/networking/base_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/snackbar_helper.dart';
import '../../../core/widgets/custom_button.dart';
import '../data/models/fault_model.dart';
import '../logic/diagnose_cubit.dart';
import 'diagnosis_result_screen.dart';

class DiagnoseScreen extends StatelessWidget {
  const DiagnoseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DiagnoseCubit>(),
      child: const _DiagnoseView(),
    );
  }
}

class _DiagnoseView extends StatefulWidget {
  const _DiagnoseView();

  @override
  State<_DiagnoseView> createState() => _DiagnoseViewState();
}

class _DiagnoseViewState extends State<_DiagnoseView> {
  bool isDescribe = true;
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
        if (!mounted) return;
        SnackbarHelper.showTopSnackbar(context, 'Image attached successfully!');
      }
    } catch (e) {
      if (!mounted) return;
      SnackbarHelper.showTopSnackbar(
        context,
        'Failed to pick image',
        isError: true,
      );
    }
  }

  void _analyze(BuildContext context) {
    final cubit = context.read<DiagnoseCubit>();
    if (isDescribe) {
      final text = _descriptionController.text.trim();
      if (text.isEmpty) {
        SnackbarHelper.showTopSnackbar(
          context,
          'Please describe the issue',
          isError: true,
        );
        return;
      }
      cubit.diagnoseText(text);
    } else {
      final image = _selectedImage;
      if (image == null) {
        SnackbarHelper.showTopSnackbar(
          context,
          'Please upload a photo first',
          isError: true,
        );
        return;
      }
      cubit.diagnoseImage(image);
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

    return BlocConsumer<DiagnoseCubit, BaseState<FaultModel>>(
      listener: (context, state) {
        if (state is BaseSuccess<FaultModel>) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DiagnosisResultScreen(fault: state.data),
            ),
          );
        } else if (state is BaseFailure<FaultModel>) {
          SnackbarHelper.showTopSnackbar(context, state.message, isError: true);
        }
      },
      builder: (context, state) {
        final isLoading = state is BaseLoading<FaultModel>;

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
            child: Skeletonizer(
              enabled: isLoading,
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
                                      color: isDescribe
                                          ? textColor
                                          : textSecColor,
                                      size: 18.sp,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      'Describe',
                                      style: TextStyle(
                                        color: isDescribe
                                            ? textColor
                                            : textSecColor,
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
                                      color: !isDescribe
                                          ? textColor
                                          : textSecColor,
                                      size: 18.sp,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      'Photo Scan',
                                      style: TextStyle(
                                        color: !isDescribe
                                            ? textColor
                                            : textSecColor,
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
                    onPressed: () => _analyze(context),
                  ),
                ],
              ),
            ),
          ),
        );
      },
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
              controller: _descriptionController,
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
