import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../database/database.dart';
import '../services/auth_service.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  return AppDatabase();
});

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});