import 'package:flutter/material.dart';

/// DermaCare Light Color Scheme
/// Calm, clean, skin-friendly palette with muted greens and soft neutrals
const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  
  // Primary - Muted sage green (health, nature, calm)
  primary: Color(0xFF4A7C59),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFD4E7DD),
  onPrimaryContainer: Color(0xFF1A3A24),
  
  // Secondary - Soft gray-green
  secondary: Color(0xFF6B7F7B),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFE8F0ED),
  onSecondaryContainer: Color(0xFF2A3835),
  
  // Tertiary - Warm accent (brown for highlights)
  tertiary: Color(0xFF8B6B47),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFF5E8D8),
  onTertiaryContainer: Color(0xFF3A2818),
  
  // Error - Muted red (less alarming)
  error: Color(0xFFC5554C),
  onError: Color(0xFFFFFFFF),
  errorContainer: Color(0xFFF9D8D5),
  onErrorContainer: Color(0xFF4A1812),
  
  // Background & Surface
  surface: Color(0xFFFFFFFF),
  onSurface: Color(0xFF1A1C1A),
  surfaceContainerHighest: Color(0xFFE8F0ED),
  onSurfaceVariant: Color(0xFF4A5654),
  
  // Outline & Borders
  outline: Color(0xFFB8C5C2),
  outlineVariant: Color(0xFFE0E9E6),
  
  // Other
  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),
  inverseSurface: Color(0xFF2F312F),
  onInverseSurface: Color(0xFFF1F3F1),
  inversePrimary: Color(0xFFA3D4B5),
  surfaceTint: Color(0xFF4A7C59),
);

/// DermaCare Dark Color Scheme
const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  
  // Primary - Light sage green (good contrast on dark)
  primary: Color(0xFFA3D4B5),
  onPrimary: Color(0xFF1A3A24),
  primaryContainer: Color(0xFF2F5239),
  onPrimaryContainer: Color(0xFFD4E7DD),
  
  // Secondary - Light gray-green
  secondary: Color(0xFFB5C9C4),
  onSecondary: Color(0xFF2A3835),
  secondaryContainer: Color(0xFF3F524E),
  onSecondaryContainer: Color(0xFFE8F0ED),
  
  // Tertiary - Light warm beige
  tertiary: Color(0xFFD9BD9A),
  onTertiary: Color(0xFF3A2818),
  tertiaryContainer: Color(0xFF5C4A32),
  onTertiaryContainer: Color(0xFFF5E8D8),
  
  // Error - Light muted red
  error: Color(0xFFF2A19F),
  onError: Color(0xFF4A1812),
  errorContainer: Color(0xFF7D3530),
  onErrorContainer: Color(0xFFF9D8D5),
  
  // Background & Surface
  surface: Color(0xFF1A1C1A),
  onSurface: Color(0xFFE3E5E3),
  surfaceContainerHighest: Color(0xFF3F4945),
  onSurfaceVariant: Color(0xFFB8C5C2),
  
  // Outline & Borders
  outline: Color(0xFF6B7F7B),
  outlineVariant: Color(0xFF3F4945),
  
  // Other
  shadow: Color(0xFF000000),
  scrim: Color(0xFF000000),
  inverseSurface: Color(0xFFE3E5E3),
  onInverseSurface: Color(0xFF1A1C1A),
  inversePrimary: Color(0xFF4A7C59),
  surfaceTint: Color(0xFFA3D4B5),
);

/// Custom semantic colors extension
/// Adds success, warning, hydration, and routine colors
extension CustomColors on ColorScheme {
  /// Success color (green, distinct from primary)
  Color get success => brightness == Brightness.light
      ? const Color(0xFF5C8C6A)
      : const Color(0xFFA3D4B5);
  
  /// Text color on success
  Color get onSuccess => brightness == Brightness.light
      ? const Color(0xFFFFFFFF)
      : const Color(0xFF1E3324);
  
  /// Success container background
  Color get successContainer => brightness == Brightness.light
      ? const Color(0xFFD9EBE0)
      : const Color(0xFF3A5A44);
  
  /// Text color on success container
  Color get onSuccessContainer => brightness == Brightness.light
      ? const Color(0xFF1E3324)
      : const Color(0xFFD9EBE0);
  
  /// Warning color (muted gold/amber)
  Color get warning => brightness == Brightness.light
      ? const Color(0xFFD4A550)
      : const Color(0xFFE8C589);
  
  /// Text color on warning
  Color get onWarning => brightness == Brightness.light
      ? const Color(0xFF1A1410)
      : const Color(0xFF3A2A10);
  
  /// Warning container background
  Color get warningContainer => brightness == Brightness.light
      ? const Color(0xFFF5EDD9)
      : const Color(0xFF5C4A30);
  
  /// Text color on warning container
  Color get onWarningContainer => brightness == Brightness.light
      ? const Color(0xFF3A2A10)
      : const Color(0xFFF5EDD9);
  
  /// Hydration feature color (teal)
  Color get hydration => brightness == Brightness.light
      ? const Color(0xFF4A9DB5)
      : const Color(0xFF8FC7D9);
  
  /// Routine feature color (purple-gray)
  Color get routine => brightness == Brightness.light
      ? const Color(0xFF7B68A3)
      : const Color(0xFFB5A3D4);
}
