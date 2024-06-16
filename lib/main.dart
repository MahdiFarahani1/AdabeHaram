import 'package:adabeharam/Features/Home/presentation/Home.dart';
import 'package:adabeharam/Features/Home/presentation/wraperHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ZoomDrawerController controller = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar'),
        Locale('en'),
      ],
      locale: const Locale('ar'),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          onBackground: Colors.black,
          background: Color(0xFFFFF9C4), // Yellow 100
          brightness: Brightness.light,
          primary: Color(0xFFFFEB3B), // Yellow 500
          surfaceTint: Color(0xFFFBC02D), // Yellow 700
          onPrimary: Colors.black,
          primaryContainer: Color(0xFFFFF176), // Yellow 300
          onPrimaryContainer: Color(0xFFF57F17), // Yellow 900
          secondary: Color(0xFFFFC107), // Amber 500
          onSecondary: Colors.black,
          secondaryContainer: Color(0xFFFFD54F), // Amber 300
          onSecondaryContainer: Color(0xFFFF8F00), // Amber 900
          tertiary: Color(0xFFFFA000), // Amber 700
          onTertiary: Colors.black,
          tertiaryContainer: Color(0xFFFFECB3), // Amber 100
          onTertiaryContainer: Color(0xFFFF6F00), // Amber 800
          error: Color(0xFFD32F2F), // Red 700
          onError: Colors.white,
          errorContainer: Color(0xFFFFCDD2), // Red 100
          onErrorContainer: Color(0xFFB71C1C), // Red 900
          surface: Color(0xFFFFFDE7), // Yellow 50
          onSurface: Color(0xFF000000), // Black
          onSurfaceVariant: Color(0xFF757575), // Grey 600
          outline: Color(0xFFB0BEC5), // Blue Grey 200
          outlineVariant: Color(0xFF78909C), // Blue Grey 400
          shadow: Color(0xFF000000), // Black
          scrim: Color(0xFF000000), // Black
          inverseSurface: Color(0xFFF57F17), // Yellow 900
          inversePrimary: Color(0xFFFFF176), // Yellow 300
        ),
      ),
      home: WraperHome(
        routeName: Home(controller: controller),
        drawerController: controller,
      ),
    );
  }
}
