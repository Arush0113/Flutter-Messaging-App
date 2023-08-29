import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import './screens/chat_home_screen.dart';
import './screens/auth_screen.dart';
import './screens/on_boarding_screen.dart';
import './screens/chat_screen.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TeamUp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.white,
//        canvasColor: Color(0XFF4563DB),
        canvasColor: Colors.black,
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.white,
          ),
          body2: TextStyle(
            color: Colors.black,
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (ctx, userSnapshot) {
          if (userSnapshot.hasData) {
            return HomePage();
          }
          return AuthScreen();
        },
      ),
      routes: {
        AuthScreen.routeName: (ctx) => AuthScreen(),
        HomePage.routeName: (ctx) => HomePage(),
        ChatHomeScreen.routeName: (ctx) => ChatHomeScreen(),
        ChatScreen.routeName: (ctx) => ChatScreen(),
      },
    );
  }
}
