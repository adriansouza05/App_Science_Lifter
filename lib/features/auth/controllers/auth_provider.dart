import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  String get userUid => _authService.currentUser?.uid ?? '';
  String get userEmail => _authService.currentUser?.email ?? '';

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _setLoading(true);
    try {
      await _authService.login(email, password);
    } finally {
      _setLoading(false);
    }
  }

  Future<void> register({
    required String nome,
    required String email,
    required String telefone,
    required String password,
  }) async {
    _setLoading(true);
    try {
      await _authService.register(
        nome: nome,
        email: email,
        telefone: telefone,
        password: password,
      );
    } finally {
      _setLoading(false);
    }
  }

  Future<void> recoveryPassword(String email) async {
    _setLoading(true);
    try {
      await _authService.sendPasswordReset(email);
    } finally {
      // ← CORREÇÃO FEITA AQUI (antes estava "Planetary")
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    await _authService.logout();
    notifyListeners();
  }
}
