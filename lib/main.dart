import 'package:adabeharam/Config/routes/app_route.dart';
import 'package:adabeharam/Features/Home/presentation/wraperHome.dart';
import 'package:adabeharam/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

final ZoomDrawerController commonController = ZoomDrawerController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: WraperHome.rn,
      getPages: pages(commonController),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF81C784),
        useMaterial3: true,
        fontFamily: FontFamily.arabic,
        colorScheme: const ColorScheme(
          onBackground: Colors.black,
          background: Color(0xFFFFFFFF), // White
          brightness: Brightness.light,
          primary: Color(0xFF4CAF50), // Green 500
          surfaceTint: Color(0xFF388E3C), // Green 700
          onPrimary: Colors.white,
          primaryContainer: Color(0xFFC8E6C9), // Green 100
          onPrimaryContainer: Color(0xFF1B5E20), // Green 900
          secondary: Color(0xFF8BC34A), // Light Green 400
          onSecondary: Colors.white,
          secondaryContainer: Color(0xFFDCEDC8), // Light Green 200
          onSecondaryContainer: Color(0xFF33691E), // Light Green 800
          tertiary: Color(0xFF81C784), // Light Green 300
          onTertiary: Colors.white,
          tertiaryContainer: Color(0xFFE8F5E9), // Light Green 100
          onTertiaryContainer: Color(0xFF2E7D32), // Green 700
          error: Color(0xFFD32F2F), // Red 700
          onError: Colors.white,
          errorContainer: Color(0xFFFFCDD2), // Red 100
          onErrorContainer: Color(0xFFB71C1C), // Red 900
          surface: Color(0xFFFFFFFF), // White
          onSurface: Color(0xFF000000), // Black
          onSurfaceVariant: Color(0xFF757575), // Grey 600
          outline: Color(0xFFB0BEC5), // Blue Grey 200
          outlineVariant: Color(0xFF78909C), // Blue Grey 400
          shadow: Color(0xFF000000), // Black
          scrim: Color(0xFF000000), // Black
          inverseSurface: Color(0xFF1B5E20), // Green 900
          inversePrimary: Color(0xFFC8E6C9), // Green 100
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.green.shade300, // Green 500
          foregroundColor: Colors.white,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF4CAF50), // Green 500
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    );
  }
}
