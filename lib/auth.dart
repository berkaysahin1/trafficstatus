import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //mail giriş yap fonksiyonu
  Future<User?> signIn(String email, String password) async {
    var user = await _auth.signInWithEmailAndPassword(email: email, password: password);

    return user.user;
  }


  //çıkış yap fonksiyonu
  signOut() async {
    return await _auth.signOut();
  }
Future<void>AdsAdd(String Company,String Content,String Foto,String Location,String Time,String Title)async {
    FirebaseFirestore.instance.collection('AdsTest').add({'Company':Company,'Content':Content,'Foto':Foto,'Location':Location,'Time':Time,'Title':Title});
}
  //kayıt ol fonksiyonu
  Future<User?> createPersonCompany(String name, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    await _firestore.collection("Person").doc(user.user?.uid).set({'userName': name, 'companysector': null, 'email': email,'Rol':'Company'});
    return user.user;
  }
  Future<User?> createPersonStudent(String name,String soyad,String Okul,String Bolum, String email, String password) async {
    var user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    if (email.endsWith(".edu.tr")){
      await _firestore.collection("Person").doc(user.user?.uid).set({'userName': name, 'userSurname': soyad, 'email': email, 'Okul': Okul,'Rol':'Student', 'Bolum': Bolum, 'background': null,'pp':null});
      return user.user;
    }else{
      null;
    }

  }

  // google ile giriş fonksiyonu
  // Future<UserCredential> signInWithGoogle() async {
  //   final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  //facebook ile giriş fonksiyonu
  // Future<UserCredential?> signInWithFacebook() async {
  //   final LoginResult result = await FacebookAuth.instance.login();
  //   print("RESULT : ${result.message}");
  //   if (result.status == LoginStatus.success) {
  //     final AuthCredential facebookCredential = FacebookAuthProvider.credential(result.accessToken!.token);
  //     return await FirebaseAuth.instance.signInWithCredential(facebookCredential);
  //   } else
  //     return null;
  // }
}