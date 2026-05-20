import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // ← CORREÇÃO: Necessário para acessar o Provider
import '../../../core/theme/app_theme.dart';
import '../controllers/auth_provider.dart'; // ← CORREÇÃO: Import do controlador de autenticação

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailCtrl = TextEditingController();

  void _recuperarSenha() async {
    if (_formKey.currentState!.validate()) {
      try {
        // ← CORREÇÃO: Conexão real com o Firebase para enviar o e-mail
        await context.read<AuthProvider>().recoveryPassword(
          emailCtrl.text.trim(),
        );

        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Instruções enviadas para o e-mail informado."),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Erro ao enviar e-mail. Verifique se o endereço está correto.",
            ),
            backgroundColor: AppTheme.red,
          ),
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
        title: const Text("RECUPERAR SENHA"),
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Informe o seu e-mail cadastrado. Enviaremos um link para redefinir a sua senha.",
                style: TextStyle(
                  fontSize: 15,
                  color: AppTheme.textMuted,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 24),
              TextFormField(
                controller: emailCtrl,
                style: const TextStyle(color: AppTheme.white),
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "E-mail",
                  prefixIcon: Icon(Icons.email, color: AppTheme.textMuted),
                ),
                validator: (val) {
                  if (val == null || val.isEmpty) return "Informe o e-mail";
                  if (!val.contains("@")) return "E-mail inválido";
                  return null;
                },
              ),
              const SizedBox(height: 32),
              authProvider.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(color: AppTheme.red),
                    )
                  : ElevatedButton(
                      onPressed: _recuperarSenha,
                      child: const Text("SOLICITAR RECUPERAÇÃO"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
