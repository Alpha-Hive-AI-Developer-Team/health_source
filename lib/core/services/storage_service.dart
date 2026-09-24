import 'package:get_storage/get_storage.dart';

/// Wrapper around GetStorage for tokens / user prefs. Repositories and
/// controllers read/write through this, never GetStorage directly.
class StorageService {
  final _box = GetStorage();

  static const _keyToken = 'auth_token';
  static const _keyOnboardingSeen = 'onboarding_seen';

  String? get token => _box.read(_keyToken);
  Future<void> saveToken(String token) => _box.write(_keyToken, token);
  Future<void> clearToken() => _box.remove(_keyToken);

  bool get onboardingSeen => _box.read(_keyOnboardingSeen) ?? false;
  Future<void> setOnboardingSeen() => _box.write(_keyOnboardingSeen, true);

  Future<void> clearAll() => _box.erase();
}
