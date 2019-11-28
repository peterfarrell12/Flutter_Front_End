import 'dart:async';

import 'package:fb_auth/fb_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webdev2/plugins/desktop.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;
import 'widgets/project_list_view.dart';
import 'ui/auth.dart';
import 'ui/company_check.dart';
void main()   {
  
  WidgetsFlutterBinding.ensureInitialized();
  setTargetPlatformForDesktop();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _app = FbApp(
      apiKey: "AIzaSyBipiheUGRTLS-MjWeJOJX8SbqjwsobNHs",
      authDomain: "spendcentreapp.firebaseapp.com",
      databaseURL: "https://spendcentreapp.firebaseio.com",
      projectId: "spendcentreapp",
      storageBucket: "spendcentreapp.appspot.com",
      messagingSenderId: "570337778397",
      appId: "1:570337778397:web:4da7aeb024f9e18e699934",
  );
  
  AuthBloc _auth;
  StreamSubscription<AuthUser> _userChanged;
  fs.Firestore store = firestore();


  @override
  void dispose() {
    _auth.close();
    _userChanged?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _auth = AuthBloc(saveUser: _saveUser, deleteUser: _deleteUser, app: _app);
    _auth.add(CheckUser());
    final _fbAuth = FBAuth(_app);
    _userChanged = _fbAuth.onAuthChanged().listen((user) {
      _auth.add(UpdateUser(user));
    });
    super.initState();
  }

  static _deleteUser() async {}

  static _saveUser(user) async {}

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(builder: (_) => _auth),
      ],
      child: MaterialApp(
        home: 
        AuthCheck()
        //ProjectList()
      ),
    );
  }
}