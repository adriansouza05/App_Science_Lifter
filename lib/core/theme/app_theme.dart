import 'package:flutter/material.dart';

class AppTheme {
  // Cores Base
  static const Color black = Color(0xFF0A0A0A);
  static const Color cardGrey = Color(0xFF1C1C1C);
  static const Color borderGrey = Color(0xFF2A2A2A);
  static const Color red = Color(0xFFE01818);
  static const Color white = Color(0xFFFFFFFF);
  static const Color textMuted = Color(0xFF888888);

  // Nova cor para textos secundários mais claros (usado nos comentários)
  static const Color offWhite = Color(0xFFE0E0E0);

  // Novo Gradiente Vermelho (usado nos banners e botões principais)
  static const LinearGradient redGradient = LinearGradient(
    colors: [Color(0xFFE01818), Color(0xFF8B0000)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Novos Estilos de Texto padronizados
  static const TextStyle labelUpper = TextStyle(
    color: red,
    fontSize: 12,
    fontWeight: FontWeight.w800,
    letterSpacing: 1.5,
  );

  static const TextStyle headingLarge = TextStyle(
    color: white,
    fontSize: 24,
    fontWeight: FontWeight.w900,
  );

  static const TextStyle headingMedium = TextStyle(
    color: white,
    fontSize: 18,
    fontWeight: FontWeight.w800,
  );

  static const TextStyle bodyText = TextStyle(
    color: textMuted,
    fontSize: 14,
    height: 1.5,
  );

  static const TextStyle caption = TextStyle(color: textMuted, fontSize: 12);

  // Configuração Global do Tema
  static ThemeData get theme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: black,
      primaryColor: red,
      colorScheme: const ColorScheme.dark(
        primary: red,
        secondary: red,
        surface: cardGrey,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: black,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: white,
          letterSpacing: 1,
        ),
        iconTheme: IconThemeData(color: white),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: cardGrey,
        labelStyle: TextStyle(color: textMuted),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: borderGrey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: borderGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(color: red, width: 2),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: red,
          foregroundColor: white,
          minimumSize: const Size(double.infinity, 50),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          textStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: red),
      ),
    );
  }
}
