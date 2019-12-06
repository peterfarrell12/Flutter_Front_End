import 'package:flutter/material.dart';
import 'company_login_ui.dart';

class SignUpUI extends StatefulWidget {
  @override
  _SignUpUIState createState() => _SignUpUIState();
}

class _SignUpUIState extends State<SignUpUI> {
  bool _autovalidation = false;
  bool _nextStep = false;
  final _formKey = GlobalKey<FormState>();
  String _email, _password, _name;
  @override
  Widget build(BuildContext context) {

    return Material(
                  child: Container(
                    padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * .3,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Visibility(
                        visible: !_nextStep,
                                            child: Form(
                          autovalidate: _autovalidation,
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Sign Up',
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
                                //Display Name
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
                                              color: Colors.grey, width: 1.0)),
                                      labelText: "Display Name"),
                                  onSaved: (val) => _name = val,
                                  // validator: (val) => val.isEmpty
                                  //     ? 'Name Required'
                                  //     : null,
                                  //validator: email,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                //Email Address
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
                                height: 5,
                              ),
                              RaisedButton(
                                color: Colors.blue,
                                child: Text('Next Step',
                                    style: TextStyle(color: Colors.white)),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    setState(() {
                                      _nextStep = true;
                                    });
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _nextStep,
                        child: CompanyLoginUI(user: _name, password: _password, email: _email,),
                      )
                    ],
                  ),
                ),
              ),
        );
  }
}
