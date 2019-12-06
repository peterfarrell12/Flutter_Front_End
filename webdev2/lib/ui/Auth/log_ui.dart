import 'package:fb_auth/data/blocs/auth/auth_bloc.dart';
import 'package:fb_auth/data/blocs/auth/auth_event.dart';
import 'package:fb_auth/data/blocs/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginUI extends StatefulWidget {
  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  bool _autovalidation = false;
  final _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    final _auth = BlocProvider.of<AuthBloc>(context); //Creating an Auth Bloc

    return Material(
              child: Container(
                padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * .3,
                child: Center(
                  child: Form(
                    autovalidate: _autovalidation,
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          //Email Address
                          child: TextFormField(
                            style: TextStyle(color: Color(0xff716E74)),
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                labelText: "Email Address"),
                            validator: (val) =>
                                val.isEmpty ? 'Email Required' : null,
                            onSaved: (val) => _email = val,
                          ),
                        ),
                        Divider(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(color: Color(0xff716E74)),
                            obscureText: true,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 1.0),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 1.0)),
                                labelText: "Password"),
                            validator: (val) =>
                                val.isEmpty ? 'Password Required' : null,
                            onSaved: (val) => _password = val,
                          ),
                        ),
                        Divider(
                          height: 5,
                        ),
                        RaisedButton(
                          color: Colors.blue,
                          child: Text('Login',
                              style: TextStyle(color: Colors.white)),
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              _auth.add(LoginEvent(_email, _password));
                              
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
  }
}
