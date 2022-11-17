import 'package:cubit_news_app/Services/api.dart';
import 'package:cubit_news_app/Services/fun.dart';
import 'package:cubit_news_app/cubits/news_cubit/news_cubit.dart';
import 'package:cubit_news_app/cubits/theme_cubit/theme_state.dart';
import 'package:cubit_news_app/presentations/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubits/theme_cubit/theme_cubit.dart';
//import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MultiBlocProvider(providers: [
      BlocProvider<NewsCubit>(create: (context) {
        return NewsCubit(API());
      }),
      BlocProvider<ThemeCubit>(create: (context) {
        return ThemeCubit();
      }),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          title: 'News App',
          debugShowCheckedModeBanner: false,
          theme: state.themeData,
          home: const SplashScreen(),
        );
      },
    );
  }
}
