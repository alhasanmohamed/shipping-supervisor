class ApiConstants {
  static const String baseUrl = '';

  /// Configuration

  /// Auth
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String logout = '/auth/logout';

  /// Notification
  static const String getUserNotifications = '/user/notifications/{user_id}';
  static const String markNotificationAsRead = '/users-notifications/{notification_id}';

  /// Home

  /// Location

  /// Profile
  static const String policiesDocuments = '/pages';
}
