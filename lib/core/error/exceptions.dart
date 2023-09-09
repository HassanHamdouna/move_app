import 'package:move_app/core/network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;

  const ServerException({required this.errorMessageModel});
}

class LocalException implements Exception {
  final String message;

  const LocalException({required this.message});
}
