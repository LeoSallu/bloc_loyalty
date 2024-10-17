import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc_loyalty/login/login.dart';
import 'package:bloc_loyalty/login/view/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: BlocProvider(
        create: (context) => LoginBloc(
          authenticationRepository: context.read<AuthenticationRepository>(),
        ),
        child: const LoginForm(),
      ),
    );
  }
}
