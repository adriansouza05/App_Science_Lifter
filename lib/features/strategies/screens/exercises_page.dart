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
        {"nome": "Supino reto", "sub": "Substituição: Flexão"},
        {"nome": "Desenvolvimento", "sub": "Substituição: Elevação lateral"},
        {"nome": "Tríceps pulley", "sub": "Substituição: Tríceps banco"},
        {"nome": "Barra fixa", "sub": "Substituição: Pulldown"},
      ];
    } else if (tipo == "Upper/Lower") {
      exercicios = [
        {"nome": "Supino inclinado", "sub": "Substituição: Flexão"},
        {"nome": "Remada curvada", "sub": "Substituição: Remada elástico"},
        {"nome": "Agachamento", "sub": "Substituição: Leg press"},
      ];
    } else {
      exercicios = [
        {"nome": "Agachamento", "sub": "Substituição: Leg press"},
        {"nome": "Supino", "sub": "Substituição: Flexão"},
        {"nome": "Barra fixa", "sub": "Substituição: Pulldown"},
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
