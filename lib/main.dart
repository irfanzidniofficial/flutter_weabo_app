import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weabo_app/bloc/anime_detail/anime_detail_bloc.dart';
import 'package:flutter_weabo_app/bloc/anime_list/anime_list_bloc.dart';
import 'package:flutter_weabo_app/bloc/bottom_nav/bottom_nav_cubit.dart';
import 'package:flutter_weabo_app/bloc/search_anime/search_anime_bloc.dart';
import 'package:flutter_weabo_app/presentation/detail_screen.dart';
import 'package:flutter_weabo_app/presentation/main_screen.dart';
import 'package:flutter_weabo_app/route_argument/detail_arguments.dart';
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
        ),
        BlocProvider(
          create: (_) => AnimeListBloc()..add(GetAnimeListEvent()),
        ),
        BlocProvider(create: (_) => AnimeDetailBloc()),
        BlocProvider(create: (_) => SearchAnimeBloc()),
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
              final args = arguments as DetailArguments;
              return MaterialPageRoute(
                builder: (_) => DetailScreen(
                  detailArguments: args,
                ),
              );
          }
          return null;
        },
      ),
    );
  }
}
