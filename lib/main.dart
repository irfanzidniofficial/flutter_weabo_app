import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weabo_app/bloc/cubit/bottom_nav_cubit.dart';
import 'package:flutter_weabo_app/presentation/detail_screen.dart';
import 'package:flutter_weabo_app/presentation/main_screen.dart';
import 'package:flutter_weabo_app/shared/style.dart';

import 'bloc/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => BottomNavCubit(),
        )
      ],
      child: MaterialApp(
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
      ),
    );
  }
}
