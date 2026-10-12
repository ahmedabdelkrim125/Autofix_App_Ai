import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/di/service_locator.dart';
import '../../../core/networking/base_state.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/snackbar_helper.dart';
import '../data/models/service_center_model.dart';
import '../data/models/tow_truck_model.dart';
import '../logic/service_centers_cubit.dart';
import '../logic/tow_trucks_cubit.dart';
import '../widgets/expert_card.dart';

class ExpertsScreen extends StatelessWidget {
  const ExpertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<ServiceCentersCubit>()..fetch()),
        BlocProvider(create: (_) => getIt<TowTrucksCubit>()..fetch()),
      ],
      child: const _ExpertsView(),
    );
  }
}

class _ExpertsView extends StatefulWidget {
  const _ExpertsView();

  @override
  State<_ExpertsView> createState() => _ExpertsViewState();
}

class _ExpertsViewState extends State<_ExpertsView> {
  int _tab = 0;
  String _query = '';

  static const List<ServiceCenterModel> _centerPlaceholders = [
    ServiceCenterModel(
      name: 'Loading service center',
      specialties: ['loading'],
      rating: 4.5,
      ratingsCount: 10,
      city: 'City',
    ),
    ServiceCenterModel(
      name: 'Loading service center',
      specialties: ['loading'],
      rating: 4.5,
      ratingsCount: 10,
      city: 'City',
    ),
    ServiceCenterModel(
      name: 'Loading service center',
      specialties: ['loading'],
      rating: 4.5,
      ratingsCount: 10,
      city: 'City',
    ),
  ];

  static const List<TowTruckModel> _truckPlaceholders = [
    TowTruckModel(
      name: 'Loading tow truck',
      isAvailable: true,
      rating: 4.5,
      ratingsCount: 10,
    ),
    TowTruckModel(
      name: 'Loading tow truck',
      isAvailable: true,
      rating: 4.5,
      ratingsCount: 10,
    ),
    TowTruckModel(
      name: 'Loading tow truck',
      isAvailable: true,
      rating: 4.5,
      ratingsCount: 10,
    ),
  ];

  String _ratingText(double? rating) =>
      rating == null ? '-' : rating.toStringAsFixed(1);

  String _reviewsText(int? count) => '(${count ?? 0})';

  void _contact(String? phone) {
    if (phone == null || phone.isEmpty) {
      SnackbarHelper.showTopSnackbar(
        context,
        'No phone number available',
        isError: true,
      );
      return;
    }
    Clipboard.setData(ClipboardData(text: phone));
    SnackbarHelper.showTopSnackbar(context, 'Phone number copied: $phone');
  }

  void _showDetails(String title, List<MapEntry<String, String>> rows) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final textColor = isDark ? AppColors.textPrimary : Colors.black87;
    final textSecColor = isDark ? AppColors.textSecondary : Colors.black54;

    showModalBottomSheet<void>(
      context: context,
      backgroundColor: isDark ? AppColors.surface : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.all(24.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: textColor,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.h),
            for (final row in rows)
              Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      row.key,
                      style: TextStyle(
                        color: textSecColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      row.value,
                      style: TextStyle(color: textColor, fontSize: 15.sp),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  String _joinLocation(ServiceCenterModel c) {
    final value = [
      c.address,
      c.city,
    ].whereType<String>().where((e) => e.isNotEmpty).join(', ');
    return value.isEmpty ? '-' : value;
  }

  void _showCenterDetails(ServiceCenterModel c) {
    _showDetails(c.name ?? 'Service Center', [
      MapEntry('Phone', c.phone ?? '-'),
      MapEntry('Address', _joinLocation(c)),
      MapEntry(
        'Specialties',
        (c.specialties ?? []).isEmpty ? '-' : c.specialties!.join(', '),
      ),
      MapEntry('Working hours', c.workingHours ?? '-'),
      MapEntry(
        'Rating',
        '${_ratingText(c.rating)} ${_reviewsText(c.ratingsCount)}',
      ),
    ]);
  }

  void _showTruckDetails(TowTruckModel t) {
    _showDetails(t.name ?? 'Tow Truck', [
      MapEntry('Phone', t.phone ?? '-'),
      MapEntry(
        'Availability',
        t.isAvailable == true ? 'Available now' : 'Unavailable',
      ),
      MapEntry(
        'Rating',
        '${_ratingText(t.rating)} ${_reviewsText(t.ratingsCount)}',
      ),
    ]);
  }

  Widget _buildStateView<T>({
    required BaseState<List<T>> state,
    required List<T> placeholders,
    required bool Function(T) matches,
    required Widget Function(T) cardBuilder,
    required VoidCallback onRetry,
    required Color textSecColor,
  }) {
    if (state is BaseFailure<List<T>>) {
      return Padding(
        padding: EdgeInsets.only(top: 32.h),
        child: Column(
          children: [
            Text(
              state.message,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.redAccent, fontSize: 14.sp),
            ),
            TextButton(
              onPressed: onRetry,
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
    }

    final isLoading = state is! BaseSuccess<List<T>>;
    final items = state is BaseSuccess<List<T>>
        ? state.data.where(matches).toList()
        : placeholders;

    if (!isLoading && items.isEmpty) {
      return Padding(
        padding: EdgeInsets.only(top: 32.h),
        child: Text(
          'No results found',
          style: TextStyle(color: textSecColor, fontSize: 14.sp),
        ),
      );
    }

    return Skeletonizer(
      enabled: isLoading,
      child: Column(
        children: [
          for (final item in items)
            Padding(
              padding: EdgeInsets.only(bottom: 16.h),
              child: cardBuilder(item),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? AppColors.background : const Color(0xFFF5F7FA);
    final surfaceColor = isDark ? AppColors.surface : Colors.white;
    final textColor = isDark ? AppColors.textPrimary : Colors.black87;
    final textSecColor = isDark ? AppColors.textSecondary : Colors.black54;
    final query = _query.trim().toLowerCase();

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: textColor, size: 24.sp),
        title: Text(
          'Nearby Experts',
          style: TextStyle(
            color: textColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
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
                            child: TextField(
                              onChanged: (value) =>
                                  setState(() => _query = value),
                              style: TextStyle(
                                color: textColor,
                                fontSize: 14.sp,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Search by name or specialty...',
                                hintStyle: TextStyle(
                                  color: textSecColor,
                                  fontSize: 14.sp,
                                ),
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
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: isDark
                          ? []
                          : [BoxShadow(color: Colors.black12, blurRadius: 4)],
                    ),
                    child: Icon(Icons.tune, color: textSecColor, size: 24.sp),
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCategoryChip(
                      'Service Centers',
                      _tab == 0,
                      surfaceColor,
                      textSecColor,
                      () => setState(() => _tab = 0),
                    ),
                    _buildCategoryChip(
                      'Tow Trucks',
                      _tab == 1,
                      surfaceColor,
                      textSecColor,
                      () => setState(() => _tab = 1),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              if (_tab == 0)
                BlocBuilder<
                  ServiceCentersCubit,
                  BaseState<List<ServiceCenterModel>>
                >(
                  builder: (context, state) =>
                      _buildStateView<ServiceCenterModel>(
                        state: state,
                        placeholders: _centerPlaceholders,
                        matches: (c) =>
                            query.isEmpty ||
                            (c.name ?? '').toLowerCase().contains(query) ||
                            (c.specialties ?? []).any(
                              (s) => s.toLowerCase().contains(query),
                            ),
                        onRetry: () =>
                            context.read<ServiceCentersCubit>().fetch(),
                        textSecColor: textSecColor,
                        cardBuilder: (c) => ExpertCard(
                          name: c.name ?? 'Unknown',
                          subtitle: (c.specialties ?? []).isEmpty
                              ? 'Service Center'
                              : c.specialties!.join(' • '),
                          rating: _ratingText(c.rating),
                          reviews: _reviewsText(c.ratingsCount),
                          info: c.distanceKm != null
                              ? '${c.distanceKm!.toStringAsFixed(1)} km'
                              : (c.city ?? c.address ?? ''),
                          isOnline: true,
                          onViewProfile: () => _showCenterDetails(c),
                          onContact: () => _contact(c.phone),
                        ),
                      ),
                )
              else
                BlocBuilder<TowTrucksCubit, BaseState<List<TowTruckModel>>>(
                  builder: (context, state) => _buildStateView<TowTruckModel>(
                    state: state,
                    placeholders: _truckPlaceholders,
                    matches: (t) =>
                        query.isEmpty ||
                        (t.name ?? '').toLowerCase().contains(query),
                    onRetry: () => context.read<TowTrucksCubit>().fetch(),
                    textSecColor: textSecColor,
                    cardBuilder: (t) => ExpertCard(
                      name: t.name ?? 'Unknown',
                      subtitle: t.isAvailable == true
                          ? 'Available now'
                          : 'Unavailable',
                      rating: _ratingText(t.rating),
                      reviews: _reviewsText(t.ratingsCount),
                      info: t.distanceKm != null
                          ? '${t.distanceKm!.toStringAsFixed(1)} km'
                          : '',
                      isOnline: t.isAvailable == true,
                      onViewProfile: () => _showTruckDetails(t),
                      onContact: () => _contact(t.phone),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryChip(
    String label,
    bool isSelected,
    Color surfaceColor,
    Color textSecColor,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
      ),
    );
  }
}
