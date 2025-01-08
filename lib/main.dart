// import 'package:erster_flutter_screen/anfaenger_version/anfaenger.dart';
import 'package:erster_flutter_screen/app/app.dart';
import 'package:erster_flutter_screen/utils/logging_setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  setupLogging();
  runApp(
    const ProviderScope(
      child: SettingsApp(),
    ),
  );
}
