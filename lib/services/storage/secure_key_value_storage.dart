import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_boilerplate/services/storage/key_value_storage.dart';

class SecureKeyValueStorage implements KeyValueStorage {
  final FlutterSecureStorage _storage;

  SecureKeyValueStorage({FlutterSecureStorage? storage})
      : _storage = storage ?? const FlutterSecureStorage();

  @override
  Future<void> setString(String key, String value) async {
    await _storage.write(key: key, value: value);
  }

  @override
  Future<String?> getString(String key) async {
    return await _storage.read(key: key);
  }

  @override
  Future<void> setBool(String key, bool value) async {
    await _storage.write(key: key, value: value.toString());
  }

  @override
  Future<bool?> getBool(String key) async {
    final value = await _storage.read(key: key);
    if (value == null) return null;
    return value == 'true';
  }

  @override
  Future<void> setInt(String key, int value) async {
    await _storage.write(key: key, value: value.toString());
  }

  @override
  Future<int?> getInt(String key) async {
    final value = await _storage.read(key: key);
    if (value == null) return null;
    return int.tryParse(value);
  }

  @override
  Future<void> remove(String key) async {
    await _storage.delete(key: key);
  }

  @override
  Future<void> clear() async {
    await _storage.deleteAll();
  }
} 