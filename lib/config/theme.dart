import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData theme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
  ),
).copyWith(
  appBarTheme: const AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
  ),
);
