import 'package:flutter/material.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

// ✅ CORREÇÃO: Caminhos directos sem o nome do pacote
import 'firebase_options.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/controllers/auth_provider.dart';
import 'features/auth/screens/auth_gate.dart';
import 'features/splash/screens/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => AuthProvider())],
      child: DevicePreview(
        enabled: true, // Mude para false para o deploy final
        builder: (ctx) => const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Science Lifter',
      theme: AppTheme.theme,
      home: const SplashPage(),
    );
  }
}
