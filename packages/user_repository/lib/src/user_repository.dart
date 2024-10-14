import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:user_repository/src/models/user.dart';

class UserRepository {
  static const _storage = FlutterSecureStorage();

  Future<User?> getUser() async {
    final json = await _storage.read(key: 'user');
    if (json != null) return User.fromJson(jsonDecode(json));

    return null;
  }
}
