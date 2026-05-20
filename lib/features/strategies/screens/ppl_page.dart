import 'package:flutter/material.dart';
import 'exercises_page.dart';
import 'volume_page.dart';
import '../../../core/theme/app_theme.dart';

class PPLPage extends StatelessWidget {
  const PPLPage({super.key});

  @override
  Widget build(BuildContext context) {
    final splits = [
      {
        'day': 'PUSH',
        'muscles': 'Peito • Ombro • Tríceps',
        'icon': Icons.arrow_upward,
      },
      {
        'day': 'PULL',
        'muscles': 'Costas • Bíceps • Antebraço',
        'icon': Icons.arrow_downward,
      },
      {
        'day': 'LEGS',
        'muscles': 'Quad • Posterior • Glúteo • Panturrilha',
        'icon': Icons.directions_run,
      },
    ];

    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        title: const Text('PPL'),
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
                        Icons.swap_vert_circle_outlined,
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
                          '6x / SEMANA',
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
                    'Push / Pull / Legs',
                    style: TextStyle(
                      color: AppTheme.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Alta frequência por grupo muscular. Ideal para intermediários.',
                    style: TextStyle(
                      color: AppTheme.white.withOpacity(0.8),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 28),
            Text('DIVISÃO DA SEMANA', style: AppTheme.labelUpper),
            const SizedBox(height: 16),

            // Split cards
            ...splits.map(
              (s) => Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.cardGrey,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.borderGrey),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppTheme.red.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AppTheme.red.withOpacity(0.4),
                          ),
                        ),
                        child: Icon(
                          s['icon'] as IconData,
                          color: AppTheme.red,
                          size: 22,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              s['day'] as String,
                              style: const TextStyle(
                                color: AppTheme.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              s['muscles'] as String,
                              style: AppTheme.caption,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                  builder: (_) => const ExercisesPage(tipo: "PPL"),
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
