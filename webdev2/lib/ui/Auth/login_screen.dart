import 'package:fb_auth/data/blocs/auth/auth_bloc.dart';
import 'package:fb_auth/data/blocs/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webdev2/ui/Auth/log_ui.dart';
import 'package:webdev2/ui/Auth/sign_up_ui.dart';

class LoginScreen2 extends StatefulWidget {
  @override
  _LoginScreen2State createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2> {
  
  
  bool _createAccount = true;

  // var userRef = store.collection('users');

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) =>  Material(
        child: 
        Row(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width * .5,
          color: Colors.blue,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * .5,
              child:
                  _createAccount ? Container(child: SignUpUI()) : Container(child: LoginUI()),
                
              ),
              FlatButton(child: _createAccount ?Text("Already Registed? ") : Text("No Account? Sign Up Here!"), onPressed: (){
          setState(() {
                      _createAccount = !_createAccount;
                    });
        },)
          ],
        ),

        
      ],
    )));
  }
}
