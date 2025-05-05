import 'package:filme_flix/routes.dart';
import 'package:filme_flix/components/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const String apiKey = String.fromEnvironment('API_KEY');
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.getTextTheme('Inter').apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          secondary: Colors.transparent,
          onSecondary: AppColors.primary,
          error: AppColors.error,
          onError: Colors.white,
          surface: AppColors.background,
          onSurface: Colors.white,
          ),
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.primary,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        )
      ),
      routerConfig: router,
    );
  }
}