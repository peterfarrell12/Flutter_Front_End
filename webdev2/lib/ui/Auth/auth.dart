import 'package:fb_auth/fb_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webdev2/ui/home_screen.dart';
import 'package:webdev2/ui/Auth/login_screen.dart';
import 'package:webdev2/Dead/firestore_funcs.dart';


class AuthCheck extends StatelessWidget {
  const AuthCheck({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _user = AuthBloc.currentUser(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is LoggedInState) {
          
          return 
          HomeScreen();
        }
        return LoginScreen2();
      },
    );
  }
}
