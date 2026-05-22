import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../../auth/services/auth_service.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {

  final AuthService _authService = AuthService();

  bool _isLoading = false;

  // =========================
  // DADOS DO USUÁRIO
  // =========================
  String _userName = "";
  String _userAge = "";
  String _userWeight = "";
  String _userHeight = "";
  String _userGoal = "";
  String _userGender = "Masculino";

  // =========================
  // GETTERS
  // =========================
  bool get isLoading => _isLoading;

  String get userUid =>
      _authService.currentUser?.uid ?? '';

  String get userEmail =>
      _authService.currentUser?.email ?? '';

  String get userName => _userName;

  String get userAge => _userAge;

  String get userWeight => _userWeight;

  String get userHeight => _userHeight;

  String get userGoal => _userGoal;

  String get userGender => _userGender;

  // =========================
  // ATUALIZAR PERFIL
  // =========================
  void updateProfile({
    required String name,
    required String age,
    required String weight,
    required String height,
    required String goal,
    required String gender,
  }) {

    _userName = name;
    _userAge = age;
    _userWeight = weight;
    _userHeight = height;
    _userGoal = goal;
    _userGender = gender;

    notifyListeners();
  }

  // =========================
  // ALTERAR SOMENTE NOME
  // =========================
  void setUserName(String name) {

    _userName = name;

    notifyListeners();
  }

  // =========================
  // LOADING
  // =========================
  void _setLoading(bool value) {

    _isLoading = value;

    notifyListeners();
  }

  // =========================
  // LOGIN
  // =========================
  Future<void> login(
    String email,
    String password,
  ) async {

    _setLoading(true);

    try {

      await _authService.login(
        email,
        password,
      );

    } finally {

      _setLoading(false);
    }
  }

  // =========================
  // CADASTRO
  // =========================
  Future<void> register({
    required String nome,
    required String email,
    required String telefone,
    required String password,
  }) async {

    _setLoading(true);

    try {

      // SALVA O NOME
      _userName = nome;

      await _authService.register(
        nome: nome,
        email: email,
        telefone: telefone,
        password: password,
      );

      notifyListeners();

    } finally {

      _setLoading(false);
    }
  }

  // =========================
  // RECUPERAR SENHA
  // =========================
  Future<void> recoveryPassword(
    String email,
  ) async {

    _setLoading(true);

    try {

      await _authService.sendPasswordReset(
        email,
      );

    } finally {

      _setLoading(false);
    }
  }

  // =========================
  // LOGOUT
  // =========================
  Future<void> logout() async {

    await _authService.logout();

    notifyListeners();
  }
}