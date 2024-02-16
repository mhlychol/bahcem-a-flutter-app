import 'package:bahcem/screens/giris.dart';
import 'package:bahcem/screens/uyganasayfa.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' ;
import 'package:flutter/material.dart'; 
import 'package:fluttertoast/fluttertoast.dart'; 

class AuthService{
  final userCollection = FirebaseFirestore.instance.collection(("users"));
  final firebaseAuth = FirebaseAuth.instance;

  Future<void> signUp(BuildContext context, {required String name, required String email, required String password}) async{
    try{
        final UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null){
        _registerUser(name: name, email: email, password: password);
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const GirisEkrani(), ));

      } 
    } on FirebaseAuthException catch(e){
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }


  Future<void> signIn(BuildContext context, {required String email, required String password}) async{
    try{
      final UserCredential userCredential = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
        if(userCredential.user != null){
          //Fluttertoast.showToast(msg: "Giriş Başarılı!" , toastLength: Toast.LENGTH_LONG);
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const UygulamaAnasayfa(), ));
        }
      
    }on FirebaseAuthException catch(e){
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }
  // burasi onemli degil authentication kismi tutuyor zaten ve sifre sifirlandigi zaman email uzerinden tutuldugu icin veritabanina koyamiyoruz. 
  Future<void> _registerUser({required String name, required String email, required String password}) async {
    await userCollection.doc().set({
      "email":email,
      "name": name,
      "password": password
    });

  }
  Future<void> resetPassword(BuildContext context, {required String email}) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(
          msg: "Parola sıfırlama e-postası gönderildi.",
          toastLength: Toast.LENGTH_LONG);
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const GirisEkrani(), ));

    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message!, toastLength: Toast.LENGTH_LONG);
    }
  }
  Future<void> signOut(BuildContext context) async {
      try {
        await firebaseAuth.signOut();
        Fluttertoast.showToast(
            msg: "Çıkış Başarılı!", toastLength: Toast.LENGTH_LONG);
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const GirisEkrani(),
        ));
      } catch (e) {
        Fluttertoast.showToast(msg: "Çıkış yaparken bir hata oluştu.", toastLength: Toast.LENGTH_LONG);
      }
    }
}
