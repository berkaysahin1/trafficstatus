import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:trafficstatus/Screens/Login/login_screen.dart';
import 'package:trafficstatus/main_screen.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var uid=FirebaseAuth.instance.currentUser?.uid;

  var usertype;

  Future<String> oturumKontrol() async{

    if(FirebaseAuth.instance.currentUser?.uid == null){
      return "null";
    } else { setState(() => usertype ="True");
    };
    return usertype;
// logged
  }


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:FutureBuilder<String>(
        future: oturumKontrol(),
        builder: (context,snapshot){
          if(snapshot.hasData==true){
            String? gecisizni=snapshot.data;
            if (gecisizni=="True") {
              return MainScreen();
            }else{
              return LoginScreen();
            }
          }
          else{return Center(child: CircularProgressIndicator(color: Color.fromARGB(255, 169, 50, 1),));
          }
        },
      ),
    );
  }
}

