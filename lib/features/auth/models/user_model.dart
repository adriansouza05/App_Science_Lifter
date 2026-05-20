class UserModel {
  final String uid;
  final String nome;
  final String email;
  final String telefone;
  final DateTime dataCriacao;
  final DateTime ultimoLogin;

  UserModel({
    required this.uid,
    required this.nome,
    required this.email,
    required this.telefone,
    required this.dataCriacao,
    required this.ultimoLogin,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'dataCriacao': dataCriacao.toIso8601String(),
      'ultimoLogin': ultimoLogin.toIso8601String(),
    };
  }
}
