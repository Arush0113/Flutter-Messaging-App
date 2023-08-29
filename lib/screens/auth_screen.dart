import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/auth_form.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth-screen';

  final image =
      'https://searchengineland.com/figz/wp-content/seloads/2015/12/google-amp-fast-speed-travel-ss-1920.jpg';

  final _auth = FirebaseAuth.instance;

  void _submitAuthForm(
    String email,
    String password,
    String username,
    bool isLogin,
    BuildContext ctx,
  ) async {
    FirebaseUser authResult;
    try {
      if (isLogin) {
        authResult = (await _auth.signInWithEmailAndPassword(
                email: email, password: password))
            .user;
      } else {
        authResult = (await _auth.createUserWithEmailAndPassword(
                email: email, password: password))
            .user;
        //adding username code below
        // await FirebaseFirestore.instance
        //     .collection('users')
        //     .doc(authResult.uid)
        //     .set({
        //   'username': username,
        //   'email': email,
        //   'image_url': image,
        // });
      }
    } on PlatformException catch (err) {
      var message = 'An error occured, please check your credentials!';

      if (err.message != null) {
        message = err.message;
      }

      Scaffold.of(ctx).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: Theme.of(ctx).errorColor,
        ),
      );
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              Color(0XFF3594DD),
              Color(0XFF4563DB),
              Color(0XFF5036D5),
              Color(0XFF5B16D0),
            ],
          ),
        ),
        child: AuthForm(
          _submitAuthForm,
        ),
      ),
    );
  }
}
