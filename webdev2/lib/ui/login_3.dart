import 'package:fb_auth/fb_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginScreen2 extends StatefulWidget {
  @override
  _LoginScreen2State createState() => _LoginScreen2State();
}

class _LoginScreen2State extends State<LoginScreen2>  {
  bool _createAccount = true;
  final _formKey = GlobalKey<FormState>();
  String _email, _password, _name;

  @override
  Widget build(BuildContext context) {
    final _auth = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) => Scaffold(
                body: Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width *.5,
                      height: double.infinity,
                      child: Expanded(
                        child: Container(
                          color: Colors.blue,
                        ),
                      ),
                    ),

                    Container(
                      width: MediaQuery.of(context).size.width *.5,
                      child: Center(
              child: new Container(
                      width: MediaQuery.of(context).size.width * .3,
                      height: double.infinity,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            if (_createAccount) ...[
                              Text('Sign Up',
                              style: TextStyle(
                               color: Colors.blue,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold
                                        
                                        
                              ),),
                            ] else ...[
                              Text('Login',
                              style: TextStyle(
                               color: Colors.blue,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold
                                        
                                        
                              ),),
                            ],
                            SizedBox(height: 20,),
                            Visibility(
                              visible: _createAccount,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
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
                                              color: Colors.grey, width: 1.0)),
                                      labelText: "Display Name"),
                                  onSaved: (val) => _name = val,
                                  validator: (val) =>
                                      val.isEmpty ? 'Name Required' : null,
                                ),
                              ),
                            ),
                            Divider(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                style: TextStyle(color: Color(0xff716E74)),
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey, width: 1.0),
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
                                      borderSide:
                                          BorderSide(color: Colors.grey, width: 1.0),
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
                              height: 10,
                            ),
                            if (_createAccount) ...[
                              RaisedButton(
                                color: Colors.blue,
                                child: Text('Sign Up', style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    _auth.add(CreateAccount(_email, _password,
                                        displayName: _name));
                                  }
                                },
                              )
                            ] else ...[
                              RaisedButton(
                                color: Colors.blue,
                                child: Text('Login',style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    _auth.add(LoginEvent(_email, _password));
                                  }
                                },
                              ),
                            ],
                            FlatButton(
                              hoverColor: Colors.blue,
                              child: Text(_createAccount
                                  ? 'Already have an account?'
                                  : 'Create a new account?'),
                              onPressed: () {
                                if (mounted)
                                  setState(() {
                                    _createAccount = !_createAccount;
                                  });
                              },
                            ),
                            if (state is AuthLoadingState) ...[
                              CircularProgressIndicator()
  //                       SpinKitFadingCube(
  // color: Colors.red,
  // size: 50.0,
  // controller: AnimationController(vsync: this, duration: const Duration(milliseconds: 1200)),
                              // )],
                          ],
                          ]),
                      ),
              ),
            ),
                    ),
                  ],
                )));
  }
}
