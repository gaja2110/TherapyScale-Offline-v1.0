import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'ui/screens/welcome_screen.dart';

void main() {
  runApp(const ProviderScope(child: TherapyScaleApp()));
}

class TherapyScaleApp extends StatelessWidget {
  const TherapyScaleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TherapyScale Offline',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFCDE4D2), // Sage Green
          primary: const Color(0xFF2E7D32), // Dark Green
          secondary: const Color(0xFF81C784), // Light Green
          surface: const Color(0xFFF8F5EF), // Beige
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.openSansTextTheme(),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFFCDE4D2),
          foregroundColor: const Color(0xFF2E7D32),
          elevation: 0,
          titleTextStyle: GoogleFonts.openSans(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF2E7D32),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF2E7D32),
            foregroundColor: Colors.white,
            textStyle: GoogleFonts.openSans(fontWeight: FontWeight.w600),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr', 'FR'), // Français
        Locale('en', 'US'), // English
        Locale('de', 'DE'), // Deutsch
      ],
      home: const WelcomeScreen(),
    );
  }
}