// import 'package:erster_flutter_screen/anfaenger_version/anfaenger.dart';
import 'package:erster_flutter_screen/presentation/settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logging/logging.dart';

class SettingsApp extends StatelessWidget {
  const SettingsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final log = Logger('MyApp');
    log.info('Building MyApp');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PSheet: erster Flutter Screen',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 10, 91, 111),
        ),
        textTheme: GoogleFonts.urbanistTextTheme(),
      ),
      home: const SettingsScreen(),
      // const MyApp2(),
    );
  }
}
