
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../auth/controllers/auth_provider.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  late TextEditingController nameController;

  final TextEditingController ageController =
      TextEditingController();

  final TextEditingController weightController =
      TextEditingController();

  final TextEditingController heightController =
      TextEditingController();

  final TextEditingController goalController =
      TextEditingController();

  String selectedGender = "Masculino";

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    final authProvider =
        context.watch<AuthProvider>();

    // CARREGA NOME ATUAL
    if (nameController.text.isEmpty) {
      nameController.text =
          authProvider.userName;
    }

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,

        title: const Text(
          "EDITAR PERFIL",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            // FOTO PERFIL
            Stack(
              alignment: Alignment.bottomRight,

              children: [

                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white12,

                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Colors.white,
                  ),
                ),

                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius:
                        BorderRadius.circular(30),
                  ),

                  child: IconButton(
                    onPressed: () {},

                    icon: const Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            // NOME
            buildTextField(
              controller: nameController,
              label: "Nome",
              icon: Icons.person,
            ),

            const SizedBox(height: 16),

            // IDADE
            buildTextField(
              controller: ageController,
              label: "Idade",
              icon: Icons.calendar_today,
              keyboardType:
                  TextInputType.number,
            ),

            const SizedBox(height: 16),

            // PESO
            buildTextField(
              controller: weightController,
              label: "Peso",
              icon: Icons.monitor_weight,
              keyboardType:
                  TextInputType.number,
            ),

            const SizedBox(height: 16),

            // ALTURA
            buildTextField(
              controller: heightController,
              label: "Altura",
              icon: Icons.height,
              keyboardType:
                  TextInputType.number,
            ),

            const SizedBox(height: 16),

            // OBJETIVO
            buildTextField(
              controller: goalController,
              label: "Objetivo",
              icon: Icons.fitness_center,
            ),

            const SizedBox(height: 20),

            // GÊNERO
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),

              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius:
                    BorderRadius.circular(15),
              ),

              child: DropdownButton<String>(
                value: selectedGender,

                dropdownColor: Colors.black,

                style: const TextStyle(
                  color: Colors.white,
                ),

                underline: const SizedBox(),

                isExpanded: true,

                items: const [

                  DropdownMenuItem(
                    value: "Masculino",
                    child: Text("Masculino"),
                  ),

                  DropdownMenuItem(
                    value: "Feminino",
                    child: Text("Feminino"),
                  ),
                ],

                onChanged: (value) {
                  setState(() {
                    selectedGender = value!;
                  });
                },
              ),
            ),

            const SizedBox(height: 30),

            // BOTÃO SALVAR
            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),

                onPressed: () {

                  // SALVA O NOME
                  authProvider.setUserName(
                    nameController.text,
                  );

                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Perfil atualizado",
                      ),
                    ),
                  );

                  Navigator.pop(context);
                },

                child: const Text(
                  "SALVAR",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType =
        TextInputType.text,
  }) {

    return TextField(
      controller: controller,
      keyboardType: keyboardType,

      style: const TextStyle(
        color: Colors.white,
      ),

      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[900],

        prefixIcon: Icon(
          icon,
          color: Colors.red,
        ),

        labelText: label,

        labelStyle: const TextStyle(
          color: Colors.white70,
        ),

        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(15),
        ),
      ),
    );
  }
}

