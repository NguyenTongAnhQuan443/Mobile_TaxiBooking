import 'package:flutter/material.dart';
import 'package:taxiapp/src/bloc/auth_bloc.dart';
import 'package:taxiapp/src/views/app.dart';
import 'src/views/login_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(new AuthBloc(),
      MaterialApp(debugShowCheckedModeBanner: false, home: LoginPage())));
}