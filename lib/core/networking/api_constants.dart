class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://smart-autofix-app.onrender.com/';
  static const String authScheme = 'Bearer ';
  static const String adminAuthScheme = 'System ';
  static const Duration connectTimeout = Duration(seconds: 60);
  static const Duration receiveTimeout = Duration(seconds: 60);

  static const String login = 'auth/login';
  static const String signup = 'auth/signup';
  static const String forgotPassword = 'auth/forgot-password';
  static const String resetPassword = 'auth/reset-password';
  static const String refreshToken = 'auth/refresh-token';

  static const String profile = 'user/';
  static const String users = 'user/users';
  static const String updateUser = 'user/update';
  static const String changePassword = 'user/password';
  static const String profileImage = 'user/profile-image';
  static const String freezeAccount = 'user/freeze-account/{id}';
  static const String hardDeleteAccount = 'user/hard-delete-account/{id}';
  static const String logout = 'user/logout';
  static const String adminDashboard = 'admin/dashboard';

  static const String serviceCenters = 'service-centers';
  static const String nearbyServiceCenters = 'service-centers/nearby';
  static const String serviceCenterById = 'service-centers/{id}';
  static const String rateServiceCenter = 'service-centers/{id}/rate';

  static const String towTrucks = 'tow-trucks';
  static const String nearbyTowTrucks = 'tow-trucks/nearby';
  static const String towTruckById = 'tow-trucks/{id}';

  static const String _faultsBase = 'fault';
  static const String faults = _faultsBase;
  static const String diagnoseFault = '$_faultsBase/diagnose';
  static const String faultHistory = '$_faultsBase/history';
  static const String faultById = '$_faultsBase/{id}';
  static const String deleteFault = '$_faultsBase/{id}';
  static const String faultFeedback = '$_faultsBase/{id}/feedback';
  static const String commonFaultStats = '$_faultsBase/stats/common';

  static const List<String> publicPaths = [
    login,
    signup,
    forgotPassword,
    resetPassword,
    refreshToken,
  ];
}
