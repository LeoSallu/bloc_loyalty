import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          child: Center(
            child: Lottie.network(
              repeat: true,
              'https://lottie.host/400afa17-8f66-4011-a4fb-964ede2fd789/TAkgrfzEaS.json',
            ),
          ),
        ),
      ),
    );
  }
}
