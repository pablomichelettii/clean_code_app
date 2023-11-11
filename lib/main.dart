import 'package:clean_code_app/core/resources/colors.dart';
import 'package:clean_code_app/core/resources/fonts.dart';
import 'package:clean_code_app/core/services/injection_container.dart';
import 'package:clean_code_app/core/services/router.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Code & TDD app',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: Fonts.poppins,
        appBarTheme: const AppBarTheme(
          color: Colors.transparent,
        ),
        colorScheme: ColorScheme.fromSwatch(accentColor: Colours.primaryColour),
        useMaterial3: true,
      ),
      onGenerateRoute: generateRoute,
    );
  }
}
