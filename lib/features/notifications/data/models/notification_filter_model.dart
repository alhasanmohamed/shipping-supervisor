import 'package:equatable/equatable.dart';

class NotificationFilterModel extends Equatable {
  final bool? isRead;
  final List<String> notificationType;

  const NotificationFilterModel({
    this.isRead,
    required this.notificationType,
  });

  @override
  List<Object?> get props => [isRead, notificationType];
}
