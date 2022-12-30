import 'package:flutter/material.dart';
import 'package:flutter_weabo_app/presentation/detail_screen.dart';
import 'package:flutter_weabo_app/presentation/main_screen.dart';
import 'package:flutter_weabo_app/shared/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weabo App',
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: primaryColor,
              onPrimary: Colors.black,
              secondary: secondaryColor,
              background: Colors.white,
            ),
        textTheme: myTextTheme,
      ),
      home: const MainScreen(),
      onGenerateRoute: (RouteSettings settings) {
        final arguments = settings.arguments;

        switch (settings.name) {
          case "/":
            return MaterialPageRoute(builder: (_) => const MainScreen());
          case "/detail":
            return MaterialPageRoute(builder: (_) => const DetailScreen());
        }
        return null;
      },
    );
  }
}
