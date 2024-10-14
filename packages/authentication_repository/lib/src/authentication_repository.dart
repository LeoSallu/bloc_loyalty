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
    isValid
        ? _controller.add(AuthenticationStatus.authenticated)
        : _controller.add(AuthenticationStatus.unauthenticated);
    final currentStatus = await status.first;
    if (currentStatus == AuthenticationStatus.authenticated) {
      await _storage.write(
        key: 'user',
        value: '{"email": "$email", "name": "John Doe"}',
      );
    }
  }

  void logout() async {
    _controller.add(AuthenticationStatus.unauthenticated);
    await _storage.deleteAll();
  }

  Future<bool> validate(
      {required String email, required String password}) async {
    await Future.delayed(const Duration(seconds: 2));
    if (email == 'l.prova@gmail.com' && password == 'prova') return true;
    return false;
  }

  Future<bool> isLogged() async {
    final user = await _storage.read(key: 'user');
    if (user != null) return true;
    return false;
  }

  void dispose() => _controller.close();
}
