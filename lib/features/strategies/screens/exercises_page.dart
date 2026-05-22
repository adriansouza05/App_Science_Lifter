import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class ExercisesPage extends StatelessWidget {
  final String tipo;

  const ExercisesPage({super.key, required this.tipo});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> exercicios = [];

    if (tipo == "PPL") {
      exercicios = [
        {"nome": "Supino reto", "sub": "Substituição: Pack deck/voador"},
        {"nome": "Desenvolvimento", "sub": "Substituição: Elevação lateral/frontal"},
        {"nome": "Tríceps pulley", "sub": "Substituição: Tríceps banco"},
        {"nome": "Puxada alta", "sub": "Substituição: Pulldown"},
        {"nome": "Cadeira extensora", "sub": "Substituição: Sissy squad"},
        {"nome": "Supino inclinado máquina", "sub": "Substituição: Supino inclinado no smith/livre"},
        {"nome": "Remada curvada", "sub": "Substituição: T-bar row"},
        {"nome": "Agachamento", "sub": "Substituição: Leg press/hack squat"},
        {"nome": "Rosca scott", "sub": "Substituição: Rosca concentrada"},
        {"nome": "Triceps testa", "sub": "Substituição: Triceps Francês"},
        {"nome": "Stiff", "sub": "Substituição: Flexão no banco romano"},  
        {"nome": "Panturrilha sentado", "sub": "Substituição: Panturrilha em pé"},
      ];
    } else if (tipo == "Upper/Lower") {
      exercicios = [
        {"nome": "Supino inclinado máquina", "sub": "Substituição: Supino inclinado no smith/livre"},
        {"nome": "Remada curvada", "sub": "Substituição: T-bar row"},
        {"nome": "Agachamento", "sub": "Substituição: Leg press/hack squat"},
        {"nome": "Rosca scott", "sub": "Substituição: Rosca concentrada"},
        {"nome": "Triceps testa", "sub": "Substituição: Triceps Francês"},
        {"nome": "Stiff", "sub": "Substituição: Flexão no banco romano"},  
        {"nome": "Panturrilha sentado", "sub": "Substituição: Panturrilha em pé"},
        {"nome": "Puxada alta", "sub": "Substituição: Pulldown"},
        {"nome": "Cadeira extensora", "sub": "Substituição: Sissy squad"},
        {"nome": "Supino reto", "sub": "Substituição: Pack deck/voador"},
        {"nome": "Desenvolvimento", "sub": "Substituição: Elevação lateral/frontal"},
        {"nome": "Tríceps pulley", "sub": "Substituição: Tríceps banco"},
        
      ];
    } else {
      exercicios = [
        {"nome": "Agachamento", "sub": "Substituição: Leg press/hack squat"},
        {"nome": "Supino", "sub": "Substituição: voador"},
        {"nome": "Paralela", "sub": "Substituição: supino declinado"},
        {"nome": "Puxada alta", "sub": "Substituição: Pulldown"},
        {"nome": "Rosca scott", "sub": "Substituição: Rosca concentrada"},
        {"nome": "Triceps testa", "sub": "Substituição: Triceps Francês"},
        {"nome": "Stiff", "sub": "Substituição: Flexão no banco romano"},
        {"nome": "Cadeira flexora", "sub": "Substituição: Cadeira unilateral"},
        {"nome": "Cadeira extensora", "sub": "Substituição: Sissy squad"},
        {"nome": "Supino reto", "sub": "Substituição: Pack deck/voador"},
        {"nome": "Desenvolvimento", "sub": "Substituição: Elevação lateral/frontal"},
        {"nome": "Tríceps pulley", "sub": "Substituição: Tríceps banco"},
        {"nome": "Remada curvada", "sub": "Substituição: T-bar row"},
      ];
    }

    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        title: Text("TREINO: ${tipo.toUpperCase()}"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(24),
        itemCount: exercicios.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: AppTheme.cardGrey,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.borderGrey),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              leading: Container(
                width: 44,
                height: 44,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppTheme.red.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppTheme.red.withOpacity(0.4)),
                ),
                child: Text(
                  "${index + 1}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.red,
                    fontSize: 16,
                  ),
                ),
              ),
              title: Text(
                exercicios[index]["nome"]!,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: AppTheme.white,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  exercicios[index]["sub"]!,
                  style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 13,
                  ),
                ),
              ),
              trailing: const Icon(
                Icons.chevron_right,
                color: AppTheme.textMuted,
                size: 18,
              ),
            ),
          );
        },
      ),
    );
  }
}
