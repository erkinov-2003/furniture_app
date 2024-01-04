import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FurnitureAuthService {
  final _firebaseAuth = FirebaseAuth.instance;
  final _firebaseFire = FirebaseFirestore.instance;

  Stream<void> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }

  Future<UserCredential> signInFirebase(String email, password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential;
    } on FirebaseAuthException {
      throw Exception("Error firebase sign in error 😟");
    }
  }

  Future<UserCredential> signUpFirebase(String name, email, password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firebaseFire.collection("users").doc().set({
        "name": name,
        "email": email,
        "password": password,
      });
      return userCredential;
    } on FirebaseAuthException {
      throw Exception("Firebase sign up exception 😟");
    }
  }

  Future<void> logOutButton() async {
    return _firebaseAuth.signOut();
  }
}
