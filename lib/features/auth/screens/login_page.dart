import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import '../../../core/theme/app_theme.dart';
import '../controllers/auth_provider.dart';
import 'register_page.dart';
import 'forgot_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  void _realizarLogin() async {
    if (_formKey.currentState!.validate()) {
      try {
        await context.read<AuthProvider>().login(
          emailController.text.trim(),
          senhaController.text.trim(),
        );
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login realizado com sucesso!"),
            backgroundColor: Colors.green,
          ),
        );
      } on FirebaseAuthException catch (e) {
        String msg = "Ocorreu um erro ao entrar.";
        if (e.code == 'invalid-credential' || e.code == 'wrong-password') {
          msg = "E-mail ou senha incorretos.";
        } else if (e.code == 'user-not-found') {
          msg = "Usuário não cadastrado.";
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(msg), backgroundColor: AppTheme.red),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();

    return Scaffold(
      backgroundColor: AppTheme.black,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.fitness_center, size: 80, color: AppTheme.red),
                const SizedBox(height: 32),
                TextFormField(
                  controller: emailController,
                  style: const TextStyle(color: AppTheme.white),
                  decoration: const InputDecoration(labelText: "E-mail"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) =>
                      val == null || val.isEmpty ? "Campo obrigatório" : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: senhaController,
                  obscureText: true,
                  style: const TextStyle(color: AppTheme.white),
                  decoration: const InputDecoration(labelText: "Senha"),
                  validator: (val) => val == null || val.length < 6
                      ? "Mínimo 6 caracteres"
                      : null,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const ForgotPasswordPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Esqueceu a senha?",
                      style: TextStyle(color: AppTheme.red),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                authProvider.isLoading
                    ? const CircularProgressIndicator(color: AppTheme.red)
                    : ElevatedButton(
                        onPressed: _realizarLogin,
                        child: const Text("ENTRAR"),
                      ),
                const SizedBox(height: 16),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppTheme.white,
                    side: const BorderSide(color: AppTheme.red),
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (ctx) => const RegisterPage()),
                    );
                  },
                  child: const Text(
                    "CRIAR CONTA",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
