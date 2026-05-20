import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;
import '../../../core/theme/app_theme.dart';
import '../controllers/auth_provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nomeCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController telCtrl = TextEditingController();
  final TextEditingController senhaCtrl = TextEditingController();
  final TextEditingController confSenhaCtrl = TextEditingController();

  void _cadastrar() async {
    if (_formKey.currentState!.validate()) {
      try {
        await context.read<AuthProvider>().register(
          nome: nomeCtrl.text.trim(),
          email: emailCtrl.text.trim(),
          telefone: telCtrl.text.trim(),
          password: senhaCtrl.text.trim(),
        );

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Cadastro realizado com sucesso! Redirecionando..."),
            backgroundColor: Colors.green,
            duration: Duration(seconds: 2),
          ),
        );
      } on FirebaseAuthException catch (e) {
        String msg = "Erro ao realizar cadastro.";
        if (e.code == 'email-already-in-use') {
          msg = "Este endereço de e-mail já está sendo utilizado.";
        } else if (e.code == 'weak-password') {
          msg = "A senha fornecida é muito fraca.";
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
      appBar: AppBar(
        title: const Text("CRIAR CONTA"),
        backgroundColor: AppTheme.black,
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
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nomeCtrl,
                style: const TextStyle(color: AppTheme.white),
                decoration: const InputDecoration(labelText: "Nome Completo"),
                validator: (val) =>
                    val == null || val.isEmpty ? "Campo obrigatório" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailCtrl,
                style: const TextStyle(color: AppTheme.white),
                decoration: const InputDecoration(labelText: "E-mail"),
                keyboardType: TextInputType.emailAddress,
                validator: (val) =>
                    val == null || val.isEmpty ? "Campo obrigatório" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: telCtrl,
                style: const TextStyle(color: AppTheme.white),
                decoration: const InputDecoration(labelText: "Telefone"),
                keyboardType: TextInputType.phone,
                validator: (val) =>
                    val == null || val.isEmpty ? "Campo obrigatório" : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: senhaCtrl,
                obscureText: true,
                style: const TextStyle(color: AppTheme.white),
                decoration: const InputDecoration(labelText: "Senha"),
                validator: (val) => val == null || val.length < 6
                    ? "Mínimo 6 caracteres"
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: confSenhaCtrl,
                obscureText: true,
                style: const TextStyle(color: AppTheme.white),
                decoration: const InputDecoration(labelText: "Confirmar Senha"),
                validator: (val) =>
                    val != senhaCtrl.text ? "As senhas não conferem" : null,
              ),
              const SizedBox(height: 32),
              authProvider.isLoading
                  ? const CircularProgressIndicator(color: AppTheme.red)
                  : ElevatedButton(
                      onPressed: _cadastrar,
                      child: const Text("FINALIZAR CADASTRO"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
