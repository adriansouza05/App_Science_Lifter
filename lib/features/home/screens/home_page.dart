import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// 1. IMPORTS DA BASE
import '../../../core/theme/app_theme.dart';
import '../../auth/controllers/auth_provider.dart';
import '../../api/screens/api_screen.dart';

// 2. IMPORTS DAS NOVAS TELAS
import '../../strategies/screens/strategies_page.dart';
import '../../community/screens/comments_page.dart';
import '../../about/screens/about_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final displayEmail = authProvider.userEmail;
    final userName = displayEmail.isNotEmpty
        ? displayEmail.split('@')[0]
        : 'USUÁRIO';

    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        title: Text("OLÁ, ${userName.toUpperCase()}"),
        backgroundColor: AppTheme.black,
        actions: [
          // Botão SOBRE O APP
          IconButton(
            icon: const Icon(Icons.info_outline, color: AppTheme.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AboutPage()),
              );
            },
          ),
          // Botão de SAIR
          IconButton(
            icon: const Icon(Icons.exit_to_app, color: AppTheme.red),
            onPressed: () async {
              await context.read<AuthProvider>().logout();
            },
          ),
        ],
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildMenuCard(
            context,
            "Estratégias",
            Icons.fitness_center,
            const StrategiesPage(),
          ),
          _buildMenuCard(
            context,
            "Comunidade",
            Icons.forum,
            const CommentsPage(),
          ),
          _buildMenuCard(
            context,
            "Métricas API REST",
            Icons.cloud_sync,
            const ApiScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    String title,
    IconData icon,
    Widget? page,
  ) {
    return InkWell(
      onTap: () {
        if (page != null) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Funcionalidade em desenvolvimento.")),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.cardGrey,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderGrey),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.red.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 36, color: AppTheme.red),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppTheme.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
