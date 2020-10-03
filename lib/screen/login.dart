import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movie_app_new/screen/home.dart';
import 'package:movie_app_new/screen/registrasi.dart';
import 'package:movie_app_new/services/servicesAuth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

FirebaseAuth _auth = FirebaseAuth.instance;

class _LoginState extends State<Login> {
  void siginGoogle() async {
    UserCredential userCredential;
    final GoogleSignInAccount googleUsers = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUsers.authentication;
    final GoogleAuthCredential googleAuthCredential =
        GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    userCredential = await _auth.signInWithCredential(googleAuthCredential);
    final user = userCredential.user;
    if (user != null) {
      ServicesAuth.cekEmail(user.email).then((u) {
        if (u.value == 0) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => Registrasi(
                  user: user,
                ),
              ));
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => Home(
                        user: u,
                      )));
        }
      });
    }
    print(user.email);
    print(user.displayName);
    print(user.photoURL);
  }

  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.getToken().then((value) {
      print(value);
    });
    Firebase.initializeApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => siginGoogle(),
          // onTap: siginGoogle,
          // onTap: () {
          //   siginGoogle();
          // },
          child: Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.symmetric(horizontal: 100),
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(16)),
            child: Text("Sign In with Google"),
          ),
        ),
      ),
    );
  }
}
