import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class User extends Equatable {
  static const _storage = FlutterSecureStorage();
  final String email;
  final String name;

  const User({required this.email, required this.name});

  @override
  List<Object?> get props => [email, name];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      name: json['name'],
    );
  }

  Future<User?> getUser() async {
    final json = await _storage.read(key: 'user');
    if (json != null) return User.fromJson(jsonDecode(json));

    return null;
  }

  static const empty = User(email: '-', name: '-');
}
