import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage;
  SecureStorageService(this._storage);

  Future<void> writeString({required String key, required String value}) async {
    await _storage.write(
      key: key,
      value: value,
    );
  }

  Future<String?> readString({required String key}) async {
    return await _storage.read(
      key: key,
    );
  }

  Future<void> writeInt({required String key, required int value}) async {
    await _storage.write(
      key: key,
      value: value.toString(),
    );
  }

  Future<int?> readInt({required String key}) async {
    final value = await _storage.read(key: key);
    return value != null ? int.parse(value) : null;
  }

  Future<void> writeDouble({required String key, required double value}) async {
    await _storage.write(
      key: key,
      value: value.toString(),
    );
  }

  Future<double?> readDouble({required String key}) async {
    final value = await _storage.read(key: key);
    return value != null ? double.parse(value) : null;
  }

  Future<void> writeBool({required String key, required bool value}) async {
    await _storage.write(
      key: key,
      value: value.toString(),
    );
  }

  Future<bool?> readBool({required String key}) async {
    final value = await _storage.read(key: key);
    return value != null ? bool.parse(value) : null;
  }

  Future<void> remove({required String key}) async {
    return await _storage.delete(key: key);
  }
}
