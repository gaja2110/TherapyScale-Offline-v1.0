import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  static const String _pinKey = 'therapy_scale_pin';
  static const AndroidOptions _androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );
  static const IOSOptions _iosOptions = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock_this_device,
  );
  static const _secureStorage = FlutterSecureStorage(
    aOptions: _androidOptions,
    iOptions: _iosOptions,
  );

  /// Set up initial PIN (default: 123456)
  Future<void> initializePin() async {
    final existingPin = await _secureStorage.read(key: _pinKey);
    if (existingPin == null) {
      await setPin('123456'); // Default PIN
    }
  }

  /// Hash PIN using SHA-256
  String _hashPin(String pin) {
    final bytes = utf8.encode(pin + 'ScaleGift_Salt_2024');
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Set new PIN
  Future<void> setPin(String pin) async {
    final hashedPin = _hashPin(pin);
    await _secureStorage.write(key: _pinKey, value: hashedPin);
  }

  /// Validate PIN
  Future<bool> validatePin(String pin) async {
    try {
      final storedHash = await _secureStorage.read(key: _pinKey);
      if (storedHash == null) {
        // Initialize with default PIN if not set
        await initializePin();
        return validatePin(pin);
      }
      
      final inputHash = _hashPin(pin);
      return storedHash == inputHash;
    } catch (e) {
      return false;
    }
  }

  /// Check if PIN is set
  Future<bool> isPinSet() async {
    final pin = await _secureStorage.read(key: _pinKey);
    return pin != null;
  }

  /// Clear stored credentials
  Future<void> clearCredentials() async {
    await _secureStorage.delete(key: _pinKey);
  }
}