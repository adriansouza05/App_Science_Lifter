import 'package:flutter/material.dart';
// ✅ CORREÇÃO: Caminho do tema atualizado para a nova arquitetura
import '../../../core/theme/app_theme.dart';

class VolumePage extends StatelessWidget {
  const VolumePage({super.key});

  @override
  Widget build(BuildContext context) {
    final volumes = [
      {
        'label': 'LOW VOLUME',
        'series': '3–6 séries',
        'desc':
            'Indicado para iniciantes e fases de deload. Menor estresse acumulado.',
        'icon': Icons.battery_2_bar,
        'color': const Color(0xFF2979FF),
        'perc': 0.35,
        'badge': 'DELOAD',
      },
      {
        'label': 'MODERATE VOLUME',
        'series': '8–12 séries',
        'desc':
            'Faixa ótima para hipertrofia. Equilibra estímulo e recuperação.',
        'icon': Icons.battery_charging_full,
        'color': AppTheme.red,
        'perc': 0.65,
        'badge': 'RECOMENDADO',
      },
      {
        'label': 'HIGH VOLUME',
        'series': '15–20 séries',
        'desc':
            'Para atletas avançados em fase de acumulação. Exige ótima recuperação.',
        'icon': Icons.electric_bolt,
        'color': const Color(0xFFFF6D00),
        'perc': 1.0,
        'badge': 'AVANÇADO',
      },
    ];

    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        title: const Text('VOLUME DE TREINO'),
        backgroundColor: AppTheme.black, // Garantindo a cor da AppBar
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            size: 18,
            color: AppTheme.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('VOLUME SEMANAL', style: AppTheme.labelUpper),
            const SizedBox(height: 8),
            const Text('Séries por músculo', style: AppTheme.headingLarge),
            const SizedBox(height: 6),
            const Text(
              'O volume ideal depende do seu nível e da sua capacidade de recuperação.',
              // ✅ AJUSTE: Caso bodyText não exista, usamos um TextStyle padrão
              style: TextStyle(
                color: AppTheme.textMuted,
                fontSize: 15,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 28),

            ...volumes.map(
              (v) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: _VolumeCard(
                  label: v['label'] as String,
                  series: v['series'] as String,
                  desc: v['desc'] as String,
                  icon: v['icon'] as IconData,
                  color: v['color'] as Color,
                  perc: v['perc'] as double,
                  badge: v['badge'] as String,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Tip card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.red.withOpacity(0.3)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.lightbulb_outline,
                    color: AppTheme.red,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      'Comece sempre com volume moderado e progrida ao longo das semanas. O volume é apenas um dos fatores — progressão de carga é fundamental.',
                      style: TextStyle(
                        color: AppTheme.offWhite,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _VolumeCard extends StatelessWidget {
  final String label, series, desc, badge;
  final IconData icon;
  final Color color;
  final double perc;

  const _VolumeCard({
    required this.label,
    required this.series,
    required this.desc,
    required this.badge,
    required this.icon,
    required this.color,
    required this.perc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardGrey,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppTheme.borderGrey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(18),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: color.withOpacity(0.4)),
                  ),
                  child: Icon(icon, color: color, size: 26),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            label,
                            style: const TextStyle(
                              color: AppTheme.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              badge,
                              style: TextStyle(
                                color: color,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Text(
                        series,
                        style: TextStyle(
                          color: color,
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Progress bar
          Padding(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: LinearProgressIndicator(
                    value: perc,
                    backgroundColor: AppTheme.borderGrey,
                    color: color,
                    minHeight: 4,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  desc,
                  style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
