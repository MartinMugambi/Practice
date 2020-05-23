import 'package:firebase/screens/dashbaord_screen.dart';
import 'package:firebase/screens/login_screen.dart';
import 'package:firebase/screens/signup_screen.dart';
import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar.  
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,

      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: { 
        LoginScreen.id:(context)=> LoginScreen(),
        SignUpScreen.id:(context)=> SignUpScreen(),
        DashBoardScreen.id:(context)=> DashBoardScreen(),
        
      },
    );
  }
}

  