import 'package:flutter/material.dart';
import 'exercises_page.dart';
import 'volume_page.dart';
import '../../../core/theme/app_theme.dart';

class FullBodyPage extends StatelessWidget {
  const FullBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final muscleGroups = [
      {'label': 'Peito', 'icon': Icons.fitness_center},
      {'label': 'Costas', 'icon': Icons.airline_seat_flat},
      {'label': 'Ombro', 'icon': Icons.accessibility_new},
      {'label': 'Perna', 'icon': Icons.directions_run},
      {'label': 'Bíceps', 'icon': Icons.bolt},
      {'label': 'Tríceps', 'icon': Icons.bolt},
    ];

    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        title: const Text('FULL BODY'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: AppTheme.redGradient,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.accessibility_new,
                        color: Colors.white54,
                        size: 36,
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          '3x / SEMANA',
                          style: TextStyle(
                            color: AppTheme.white,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Treino Full Body',
                    style: TextStyle(
                      color: AppTheme.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Estimula todos os grupos musculares em cada sessão.',
                    style: TextStyle(
                      color: AppTheme.white.withOpacity(0.8),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),
            Text('GRUPOS MUSCULARES', style: AppTheme.labelUpper),
            const SizedBox(height: 16),

            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1.1,
              children: muscleGroups
                  .map(
                    (m) => Container(
                      decoration: BoxDecoration(
                        color: AppTheme.cardGrey,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppTheme.borderGrey),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            m['icon'] as IconData,
                            color: AppTheme.red,
                            size: 26,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            m['label'] as String,
                            style: const TextStyle(
                              color: AppTheme.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(height: 28),
            Text('AÇÕES', style: AppTheme.labelUpper),
            const SizedBox(height: 16),

            _ActionButton(
              icon: Icons.list_alt,
              label: 'Ver Exercícios',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ExercisesPage(tipo: "Full Body"),
                ),
              ),
            ),
            const SizedBox(height: 12),
            _ActionButton(
              icon: Icons.bar_chart,
              label: 'Volume de Treino',
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const VolumePage()),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: AppTheme.cardGrey,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.borderGrey),
        ),
        child: Row(
          children: [
            Icon(icon, color: AppTheme.red, size: 22),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: AppTheme.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppTheme.textMuted,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
