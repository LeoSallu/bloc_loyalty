import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final _storage = const FlutterSecureStorage();

  Stream<AuthenticationStatus> get status async* {
    await Future.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  Future<void> login({required String email, required String password}) async {
    final bool isValid = await validate(email: email, password: password);
    if (!isValid) throw Exception('Invalid credentials');
    await _storage.write(
      key: 'user',
      value: '{"email": "$email", "name": "John Doe"}',
    );
    await Future.delayed(
      const Duration(milliseconds: 500),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  Future<bool> validate({
    required String email,
    required String password,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    if (email == 'l.prova@gmail.com' && password == 'prova1234') {
      return true;
    }
    return false;
  }

  void logout() async {
    _controller.add(AuthenticationStatus.unauthenticated);
    await _storage.deleteAll();
  }

  void dispose() => _controller.close();
}
