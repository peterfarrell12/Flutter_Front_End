import 'package:fb_auth/fb_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webdev2/ui/home_screen.dart';
import 'log_in_2.dart';
import 'package:webdev2/ui/login_3.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is LoggedInState) {
          return HomeScreen();
        }
        return LoginScreen2();
      },
    );
  }
}