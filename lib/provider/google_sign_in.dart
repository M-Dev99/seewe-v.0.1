import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  CollectionReference users = FirebaseFirestore.instance.collection("users");
  final googleSignIn = GoogleSignIn();
  bool _isSigningIn;


  GoogleSignInProvider() {
    _isSigningIn = false;
  }

  bool get isSigningIn => _isSigningIn;

  set isSigningIn(bool isSigningIn) {
    _isSigningIn = isSigningIn;
    notifyListeners();
  }

  Future login() async {
    isSigningIn = true;

    final user = await googleSignIn.signIn();

    var userData = {
      "name": user.displayName,
      "email": user.email,
      "photoUrl": user.photoUrl,
    };

    if (user == null) {
      isSigningIn = false;
      return;
    } else {
      final googleAuth = await user.authentication;
      users.doc(user.id).get().then((doc){
        if (doc.exists){
          doc.reference.update(userData);
          print(runtimeType);
        }
      });

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      users.doc(user.id).get().then((doc) {
        if (doc.exists) {
          doc.reference.update(userData);
        } else {
          doc.reference.set(userData);
        }
      });

      await FirebaseAuth.instance.signInWithCredential(credential);

      isSigningIn = false;
    }
  }

  void logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}
