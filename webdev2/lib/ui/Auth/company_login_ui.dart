import 'package:fb_auth/data/blocs/auth/auth_bloc.dart';
import 'package:fb_auth/data/blocs/auth/auth_event.dart';
import 'package:fb_auth/data/blocs/auth/auth_state.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webdev2/Dead/firestore_funcs.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:webdev2/ui/home_screen.dart';


class CompanyLoginUI extends StatefulWidget {
  final String user;
  final String email;
  final String password;

  CompanyLoginUI({this.user, this.email, this.password});

  _CompanyLoginUIState createState() => _CompanyLoginUIState();
}

class _CompanyLoginUIState extends State<CompanyLoginUI> {
  bool _autovalidation = false;
  final _formKey = GlobalKey<FormState>();
  String _companyName, _companyPIN, _companyABB;
  bool _isReg = false;
  Stream<fs.QuerySnapshot> company;
  static fs.Firestore store = firestore();
  fs.CollectionReference companyRef = store.collection("companies");

  @override
  void initState() {
    super.initState();
    company = companyRef.get().asStream().asBroadcastStream();
  }

  @override
  Widget build(BuildContext context) {
    final _auth = BlocProvider.of<AuthBloc>(context); //Creating an Auth Bloc

    return BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) => Material(
                  child: Container(
                    padding: EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * .3,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Form(
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
                            !_isReg
                                ? Column(children: <Widget>[
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
                                        style:
                                            TextStyle(color: Color(0xff716E74)),
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey, width: 1.0),
                                            ),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0)),
                                            labelText: "Company Name"),
                                        onSaved: (val) => _companyName = val,
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
                                        style:
                                            TextStyle(color: Color(0xff716E74)),
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey, width: 1.0),
                                            ),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey, width: 1.0),
                                            ),
                                            labelText: "Company Abbreviation"),
                                        validator: (val) => val.isEmpty
                                            ? 'Abbreviation Required'
                                            : null,
                                        onSaved: (val) => _companyABB = val,
                                      ),
                                    ),
                                    Divider(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        style:
                                            TextStyle(color: Color(0xff716E74)),
                                        obscureText: true,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey, width: 1.0),
                                            ),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0)),
                                            labelText: "Company PIN"),
                                        validator: (val) =>
                                            val.isEmpty ? 'PIN Required' : null,
                                        onSaved: (val) => _companyPIN = val,
                                      ),
                                    ),
                                    Divider(
                                      height: 5,
                                    ),
                                    RaisedButton(
                                        color: Colors.blue,
                                        child: Text('Log In',
                                            style:
                                                TextStyle(color: Colors.white)),
                                        onPressed: () {
                                          if (_formKey.currentState.validate()) {
                                            _formKey.currentState.save();

                                            createCompany(_companyName,
                                                _companyPIN, _companyABB);
                                            createUser(widget.user, widget.email,
                                                _companyName);
                                            _auth.add(CreateAccount(
                                                widget.email, widget.password,
                                                displayName: widget.user));
                                          }
                                        }),
                                  ])
                                : Column(children: <Widget>[
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                        width: MediaQuery.of(context).size.width *
                                            .5,
                                        child: StreamBuilder<fs.QuerySnapshot>(
                                            stream: company,
                                            builder: (BuildContext context,
                                                AsyncSnapshot<fs.QuerySnapshot>
                                                    snapshot) {
                                              if (snapshot.hasError)
                                                return new Text(
                                                    'Error: ${snapshot.error}');
                                              switch (snapshot.connectionState) {
                                                case ConnectionState.waiting:
                                                  return new Text('Loading...');
                                                default:
                                                  return FormField(
                                                    builder:
                                                        (FormFieldState state) {
                                                      return InputDecorator(
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Company Name',
                                                        ),
                                                        isEmpty:
                                                            _companyName == '',
                                                        child:
                                                            new DropdownButtonHideUnderline(
                                                          child: DropdownButton(
                                                            value: _companyName,
                                                            isDense: true,
                                                            onChanged: (dynamic
                                                                newValue) {
                                                              setState(() {
                                                                _companyName =
                                                                    newValue;
                                                                state.didChange(
                                                                    newValue);
                                                              });
                                                            },
                                                            items: snapshot
                                                                .data.docs
                                                                .map((fs.DocumentSnapshot
                                                                    document) {
                                                              return new DropdownMenuItem(
                                                                value: document
                                                                        .data()[
                                                                    'Company Name'],
                                                                child: new Text(
                                                                    document.data()[
                                                                        'Company Name']),
                                                              );
                                                            }).toList(),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                              }
                                            })),
                                    Divider(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        style:
                                            TextStyle(color: Color(0xff716E74)),
                                        obscureText: true,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey, width: 1.0),
                                            ),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide: const BorderSide(
                                                        color: Colors.grey,
                                                        width: 1.0)),
                                            labelText: "Company PIN"),
                                        validator: (val) =>
                                            val.isEmpty ? 'PIN Required' : null,
                                        onSaved: (val) => _companyPIN = val,
                                      ),
                                    ),
                                    Divider(
                                      height: 5,
                                    ),
                                    Container(
                                        child: FutureBuilder<bool>(
                                      future: doesNameAlreadyExist(
                                          _companyName, _companyPIN),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return CircularProgressIndicator();
                                        } else if (snapshot.hasData) {
                                          if (snapshot.data) {
                                            return FlatButton(
                                              child:
                                                  Text("Success! Press To Login"),
                                              color: Colors.blue,
                                              textColor: Colors.white,
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          HomeScreen(
                                                              )),
                                                );
                                              },
                                            );
                                          } else {
                                            return Text('Failure');
                                          }
                                        } else if (snapshot.hasError) {
                                          return Text("${snapshot.error}");
                                        }
                                        // By default, show a loading spinner
                                        return CircularProgressIndicator();
                                      },
                                    )),
                                    RaisedButton(
                                      color: Colors.blue,
                                      child: Text('Log In',
                                          style: TextStyle(color: Colors.white)),
                                      onPressed: () {
                                        if (_formKey.currentState.validate()) {
                                          _formKey.currentState.save();
                                          doesNameAlreadyExist(
                                              _companyName, _companyPIN);
                                          setState(() {});
                                        }
                                      },
                                    ),
                                  ]),
                          ],
                        ),
                      ),
                      RaisedButton(
                        color: Colors.blue,
                        child: Text(!_isReg
                            ? 'Company Already Registered?'
                            : 'Create A New Company Account?',style: TextStyle(color: Colors.white)),

                            onPressed: () {
                                      if (mounted)
                                        setState(() {
                                          _isReg = !_isReg;
                                        });
                                    }
                      ),
                      if (state is AuthLoadingState) ...[
                        CircularProgressIndicator()
                      ],
                    ],
                  ),
                ),
              ),
        ));
  }
}
