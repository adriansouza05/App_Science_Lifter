import 'package:flutter/material.dart';
import 'ppl_page.dart';
import 'upper_lower_page.dart';
import 'full_body_page.dart';
import '../../../core/theme/app_theme.dart';

class StrategiesPage extends StatelessWidget {
  const StrategiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final strategies = [
      {
        'title':    'PPL',
        'subtitle': 'Push / Pull / Legs',
        'desc':     'Ideal para intermediários. Alta frequência por grupo muscular.',
        'icon':     Icons.swap_vert_circle_outlined,
        'days':     '6x',
        'level':    'INTERMEDIÁRIO',
        'page':     const PPLPage(),
      },
      {
        'title':    'Upper / Lower',
        'subtitle': 'Superior / Inferior',
        'desc':     'Ótima divisão para ganho de força e hipertrofia equilibrada.',
        'icon':     Icons.compare_arrows,
        'days':     '4x',
        'level':    'INICIANTE+',
        'page':     const UpperLowerPage(),
      },
      {
        'title':    'Full Body',
        'subtitle': 'Corpo Inteiro',
        'desc':     'Estimula cada músculo a cada sessão. Perfeito para iniciantes.',
        'icon':     Icons.accessibility_new,
        'days':     '3x',
        'level':    'INICIANTE',
        'page':     const FullBodyPage(),
      },
    ];

    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        title: const Text('ESTRATÉGIAS'),
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
            Text('DIVISÕES DE TREINO', style: AppTheme.labelUpper),
            const SizedBox(height: 8),
            const Text('Escolha sua estratégia', style: AppTheme.headingLarge),
            const SizedBox(height: 4),
            const Text(
              'Cada método foi desenvolvido com base em evidências científicas.',
              style: AppTheme.bodyText,
            ),
            const SizedBox(height: 28),

            ...strategies.map((s) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _StrategyCard(
                title:    s['title']    as String,
                subtitle: s['subtitle'] as String,
                desc:     s['desc']     as String,
                icon:     s['icon']     as IconData,
                days:     s['days']     as String,
                level:    s['level']    as String,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => s['page'] as Widget),
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class _StrategyCard extends StatelessWidget {
  final String title, subtitle, desc, days, level;
  final IconData icon;
  final VoidCallback onTap;

  const _StrategyCard({
    required this.title,
    required this.subtitle,
    required this.desc,
    required this.days,
    required this.level,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.cardGrey,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.borderGrey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top section
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      gradient: AppTheme.redGradient,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(icon, color: AppTheme.white, size: 28),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: AppTheme.headingMedium),
                        const SizedBox(height: 2),
                        Text(subtitle, style: AppTheme.caption),
                      ],
                    ),
                  ),
                  const Icon(Icons.arrow_forward_ios, color: AppTheme.textMuted, size: 14),
                ],
              ),
            ),

            // Description
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
              child: Text(desc, style: AppTheme.bodyText.copyWith(fontSize: 13)),
            ),

            // Footer chips
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              decoration: const BoxDecoration(
                color: AppTheme.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  _Chip(label: '$days / semana', icon: Icons.calendar_today_outlined),
                  const SizedBox(width: 10),
                  _Chip(label: level, icon: Icons.bar_chart, isHighlight: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isHighlight;

  const _Chip({required this.label, required this.icon, this.isHighlight = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: isHighlight ? AppTheme.red.withOpacity(0.15) : AppTheme.cardGrey,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isHighlight ? AppTheme.red.withOpacity(0.5) : AppTheme.borderGrey,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: isHighlight ? AppTheme.red : AppTheme.textMuted),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: isHighlight ? AppTheme.red : AppTheme.textMuted,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}
