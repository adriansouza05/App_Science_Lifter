import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        title: const Text("SOBRE O APP"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: AppTheme.red.withOpacity(0.15),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.fitness_center,
                  size: 44,
                  color: AppTheme.red,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "Science Lifter App",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: AppTheme.white,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Versão: 1.0.0",
              style: TextStyle(color: AppTheme.textMuted),
            ),
            const Divider(color: AppTheme.borderGrey, height: 40, thickness: 1),
            const Text(
              "OBJETIVO:",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: AppTheme.red,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "Aplicativo desenvolvido para auxiliar praticantes de musculação na organização das suas rotinas de treino, oferecendo estratégias baseadas em ciência e engajamento com a comunidade.",
              style: TextStyle(
                fontSize: 15,
                color: AppTheme.white,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            const Text(
              "DESENVOLVEDORES:",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: AppTheme.red,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "• Adrian Teixeira\n• Gabriel Lopes",
              style: TextStyle(
                fontSize: 15,
                color: AppTheme.white,
                height: 1.5,
              ),
            ),
            const Spacer(),
            const Text(
              "Disciplina: Dispositivos Móveis\nInstituição: FATEC-RP",
              style: TextStyle(
                fontSize: 13,
                color: AppTheme.textMuted,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
