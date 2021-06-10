import 'package:flutter/material.dart';
import 'package:flutter_ecommerceapp/Pages/Register.dart';
import 'package:flutter_ecommerceapp/Pages/home.dart';
import './Pages/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
      home: LoginPage(),
      ));
}
