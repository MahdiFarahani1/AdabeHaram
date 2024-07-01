import 'package:adabeharam/Config/routes/app_route.dart';
import 'package:adabeharam/Features/Home/presentation/wraperHome.dart';
import 'package:adabeharam/gen/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
      initialRoute: WraperHome.rn,
      getPages: pages(commonController),
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFBBDEFB), // Light Blue 100
        useMaterial3: true,
        fontFamily: FontFamily.arabic,
        colorScheme: ColorScheme(
          onBackground: Colors.black,
          background: Color(0xFFFFFFFF), // White
          brightness: Brightness.light,
          primary: Colors.lightBlue.shade900, // Blue 500
          surfaceTint: Color(0xFF1976D2), // Blue 700
          onPrimary: Colors.white,
          primaryContainer: Color(0xFFBBDEFB), // Light Blue 100
          onPrimaryContainer: Color(0xFF0D47A1), // Blue 900
          secondary: Color(0xFF64B5F6), // Blue 300
          onSecondary: Colors.white,
          secondaryContainer: Color(0xFFE3F2FD), // Light Blue 50
          onSecondaryContainer: Color(0xFF01579B), // Blue 800
          tertiary: Color(0xFF90CAF9), // Light Blue 300
          onTertiary: Colors.white,
          tertiaryContainer: Color(0xFFE1F5FE), // Light Blue 50
          onTertiaryContainer: Color(0xFF0288D1), // Blue 700
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
          inverseSurface: Color(0xFF0D47A1), // Blue 900
          inversePrimary: Color(0xFFBBDEFB), // Light Blue 100
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
