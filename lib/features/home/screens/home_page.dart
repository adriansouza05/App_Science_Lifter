
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// IMPORTS DA BASE
import '../../../core/theme/app_theme.dart';
import '../../auth/controllers/auth_provider.dart';
import '../../api/screens/api_screen.dart';

// IMPORTS DAS TELAS
import '../../strategies/screens/strategies_page.dart';
import '../../community/screens/comments_page.dart';
import '../../about/screens/about_page.dart';
import 'package:flutter_application_1/features/home/screens/lib/features/home/screens/lib/features/home/screens/lib/features/home/screens/lib/features/home/screens/edit_profile_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final authProvider = context.watch<AuthProvider>();

    final userName = authProvider.userName.isNotEmpty
        ? authProvider.userName
        : 'USUÁRIO';

    return Scaffold(
      backgroundColor: AppTheme.black,

      // =========================
      // APP BAR
      // =========================
      appBar: AppBar(
        backgroundColor: AppTheme.black,
        elevation: 0,

        title: Text(
          "OLÁ, ${userName.toUpperCase()}",
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),

      // =========================
      // BODY
      // =========================
      body: Padding(
        padding: const EdgeInsets.all(16),

        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,

          children: [

            // =========================
            // ESTRATÉGIAS
            // =========================
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const StrategiesPage(),
                  ),
                );
              },

              child: buildMenuCard(
                icon: Icons.auto_graph,
                title: "ESTRATÉGIAS",
              ),
            ),

            // =========================
            // COMUNIDADE
            // =========================
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const CommentsPage(),
                  ),
                );
              },

              child: buildMenuCard(
                icon: Icons.people,
                title: "COMUNIDADE",
              ),
            ),

            // =========================
            // API
            // =========================
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ApiScreen(),
                  ),
                );
              },

              child: buildMenuCard(
                icon: Icons.api,
                title: "API",
              ),
            ),

            // =========================
            // EDITAR PERFIL
            // =========================
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const EditProfilePage(),
                  ),
                );
              },

              child: buildMenuCard(
                icon: Icons.edit,
                title: "EDITAR\nPERFIL",
              ),
            ),
          ],
        ),
      ),

      // =========================
      // BOTÃO SOBRE
      // =========================
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,

        child: const Icon(
          Icons.info_outline,
          color: Colors.white,
        ),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AboutPage(),
            ),
          );
        },
      ),
    );
  }

  // =========================
  // CARD PADRÃO
  // =========================
  Widget buildMenuCard({
    required IconData icon,
    required String title,
  }) {

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(22),

        border: Border.all(
          color: Colors.white12,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [

          Icon(
            icon,
            color: Colors.red,
            size: 48,
          ),

          const SizedBox(height: 16),

          Text(
            title,
            textAlign: TextAlign.center,

            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}

