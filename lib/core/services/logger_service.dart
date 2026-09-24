import 'package:flutter/foundation.dart';

/// Single logging entry point — swap the body for a crash-reporting SDK
/// (Sentry/Crashlytics) later without touching call sites.
class LoggerService {
  LoggerService._();

  static void info(String message) {
    if (kDebugMode) debugPrint('ℹ️ [INFO] $message');
  }

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      debugPrint('🛑 [ERROR] $message');
      if (error != null) debugPrint(error.toString());
    }
  }
}
