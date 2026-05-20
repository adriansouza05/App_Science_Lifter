import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();
  User? get currentUser => _auth.currentUser;

  Future<void> login(String email, String password) async {
    UserCredential userCred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    await _firestore.collection('usuarios').doc(userCred.user!.uid).update({
      'ultimoLogin': DateTime.now().toIso8601String(),
    });
  }

  Future<void> register({
    required String nome,
    required String email,
    required String telefone,
    required String password,
  }) async {
    UserCredential userCred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    UserModel newUser = UserModel(
      uid: userCred.user!.uid,
      nome: nome,
      email: email,
      telefone: telefone,
      dataCriacao: DateTime.now(),
      ultimoLogin: DateTime.now(),
    );

    await _firestore
        .collection('usuarios')
        .doc(newUser.uid)
        .set(newUser.toMap());
  }

  Future<void> sendPasswordReset(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() async {
    await _auth.signOut();
  }
}
