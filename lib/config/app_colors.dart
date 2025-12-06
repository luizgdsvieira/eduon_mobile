import 'package:flutter/material.dart';

class AppColors {
  // Cores principais baseadas no site
  static const Color backgroundDark = Color(0xFF0A1128);
  static const Color primaryBlue = Color(0xFF003DBA);
  static const Color secondaryBlue = Color(0xFF1c5bd8);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightGray = Color(0xFFF5F5F5);
  static const Color darkGray = Color(0xFF333333);
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color errorRed = Color(0xFFE53935);
  static const Color warningYellow = Color(0xFFFFC107);

  // Gradientes
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0A1128), Color(0xFF003DBA)],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0A1128), Color(0xFF003DBA)],
  );
}

