import 'package:dio/dio.dart';

/// Maps a raw DioException into a user-friendly message so the UI layer
/// never has to inspect status codes itself.
class NetworkExceptions implements Exception {
  final String message;
  NetworkExceptions(this.message);

  static NetworkExceptions fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return NetworkExceptions('Connection timed out. Please try again.');
      case DioExceptionType.badResponse:
        final code = e.response?.statusCode;
        if (code == 401) return NetworkExceptions('Session expired. Please log in again.');
        if (code == 404) return NetworkExceptions('Requested resource not found.');
        if (code != null && code >= 500) return NetworkExceptions('Server error. Please try again later.');
        return NetworkExceptions('Something went wrong. Please try again.');
      case DioExceptionType.connectionError:
        return NetworkExceptions('No internet connection.');
      default:
        return NetworkExceptions('Unexpected error occurred.');
    }
  }

  @override
  String toString() => message;
}
