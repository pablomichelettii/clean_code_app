import 'package:clean_code_app/core/commons/app/providers/course_of_the_day_notifier.dart';
import 'package:clean_code_app/core/commons/app/providers/user_provider.dart';
import 'package:clean_code_app/core/resources/colors.dart';
import 'package:clean_code_app/core/resources/fonts.dart';
import 'package:clean_code_app/core/services/injection_container.dart';
import 'package:clean_code_app/core/services/router.dart';
import 'package:clean_code_app/firebase_options.dart';
import 'package:clean_code_app/src/dashboard/presentation/providers/dashboard_controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => DashboardController()),
        ChangeNotifierProvider(create: (_) => CourseOfTheDayNotifier()),
      ],
      child: MaterialApp(
        title: 'Clean Code & TDD app',
        theme: ThemeData(
          useMaterial3: true,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: Fonts.poppins,
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
          ),
          colorScheme:
              ColorScheme.fromSwatch(accentColor: Colours.primaryColour),
        ),
        onGenerateRoute: generateRoute,
      ),
    );
  }
}
