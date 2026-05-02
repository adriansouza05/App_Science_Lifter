import 'package:flutter/material.dart';
import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart'; // ← 1. ADICIONE ESTA LINHA
import 'firebase_options.dart'; // ← 2. ADICIONE ESTA LINHA (Gerada pelo CLI)
import 'providers/auth_provider.dart';
import 'pages/splash_page.dart';
import 'app_theme.dart';

// 3. Altere void main() para Future<void> main() async
Future<void> main() async {
  // 4. Garante que os componentes do Flutter estejam prontos antes de iniciar o Firebase[cite: 1]
  WidgetsFlutterBinding.ensureInitialized();

  // 5. Inicializa o Firebase com as configurações do seu projeto[cite: 1]
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => AuthProvider())],
      child: DevicePreview(enabled: true, builder: (ctx) => const MyApp()),
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
