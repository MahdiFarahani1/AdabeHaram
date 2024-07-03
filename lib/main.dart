import 'package:adabeharam/Config/routes/app_route.dart';
import 'package:adabeharam/Features/Splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const MyApp());
  });
}

final ZoomDrawerController commonController = ZoomDrawerController();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Splash.rn,
      getPages: pages(commonController),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFBBDEFB), // Light Blue 100
        useMaterial3: true,
        textTheme: GoogleFonts.readexProTextTheme(),
        colorScheme: ColorScheme(
          onBackground: Colors.black,
          background: const Color(0xFFFFFFFF), // White
          brightness: Brightness.light,
          primary: Colors.lightBlue.shade900, // Blue 500
          surfaceTint: const Color(0xFF1976D2), // Blue 700
          onPrimary: Colors.white,
          primaryContainer: const Color(0xFFBBDEFB), // Light Blue 100
          onPrimaryContainer: const Color(0xFF0D47A1), // Blue 900
          secondary: const Color(0xFF64B5F6), // Blue 300
          onSecondary: Colors.white,
          secondaryContainer: const Color(0xFFE3F2FD), // Light Blue 50
          onSecondaryContainer: const Color(0xFF01579B), // Blue 800
          tertiary: const Color(0xFF90CAF9), // Light Blue 300
          onTertiary: Colors.white,
          tertiaryContainer: const Color(0xFFE1F5FE), // Light Blue 50
          onTertiaryContainer: const Color(0xFF0288D1), // Blue 700
          error: const Color(0xFFD32F2F), // Red 700
          onError: Colors.white,
          errorContainer: const Color(0xFFFFCDD2), // Red 100
          onErrorContainer: const Color(0xFFB71C1C), // Red 900
          surface: const Color(0xFFFFFFFF), // White
          onSurface: const Color(0xFF000000), // Black
          onSurfaceVariant: const Color(0xFF757575), // Grey 600
          outline: const Color(0xFFB0BEC5), // Blue Grey 200
          outlineVariant: const Color(0xFF78909C), // Blue Grey 400
          shadow: const Color(0xFF000000), // Black
          scrim: const Color(0xFF000000), // Black
          inverseSurface: const Color(0xFF0D47A1), // Blue 900
          inversePrimary: const Color(0xFFBBDEFB), // Light Blue 100
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue.shade200, // Light Blue 300
          foregroundColor: Colors.white,
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF2196F3), // Blue 500
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    );
  }
}
