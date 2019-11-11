import 'package:fb_auth/fb_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _createAccount = true;
  final _formKey = GlobalKey<FormState>();
  String _email, _password, _name;

  @override
  Widget build(BuildContext context) {
    final _auth = BlocProvider.of<AuthBloc>(context);
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) => Material(
          child: new Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Color(0xff242A41),
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage('assets/images/login_pic.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: new Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(100.0),
              child: Center(
                child: Icon(
                  FontAwesomeIcons.quidditch,
                  color: Colors.teal,
                  size: 50.0,
                ),
              ),
            ),
           Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Visibility(
                  visible: _createAccount,
                  child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: Center(
                      child: new Text(
                        "DISPLAY NAME",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
             
            
            new Container(
              width: MediaQuery.of(context).size.width * .5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.teal,
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              padding: const EdgeInsets.only(left: 0.0, right: 10.0),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                      onSaved: (val) => _name = val,
                       validator: (val) =>
                        val.isEmpty ? 'Name Required' : null,
                    ),
                  ),
                ],
              ),
            ),
               ],
              ),),
              Divider(
              height: 24.0,
            ),
                            new Row(
              children: <Widget>[
                new Expanded(
                  child: Center(
                    child: new Text(
                      "EMAIL",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
                ),
          
            new Container(
              width: MediaQuery.of(context).size.width * .5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.teal,
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: Center(
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          border: InputBorder.none,

                        ),
                           validator: (val) =>
                        val.isEmpty ? 'Email Required' : null,
                        onSaved: (val) => _email = val,
                      ),
                    ),
                  ),
                ],
              ),
            ),
              ]
                
                            ),
            Divider(
              height: 24.0,
            ),
                        new Row(
              children: <Widget>[
                new Expanded(
                  child: Center(
                    child: new Text(
                      "PASSWORD",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                        fontSize: 15.0,
                      ),
                    ),
                  ),
           
            ),
            new Container(
              width: MediaQuery.of(context).size.width * .5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      color: Colors.teal,
                      width: 0.5,
                      style: BorderStyle.solid),
                ),
              ),
              child: new Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                         validator: (val) =>
                        val.isEmpty ? 'Password Required' : null,
                      onSaved: (val) => _password = val,
                    ),
                  ),
                ],
              ),
            ),
              ],
                        ),
            Divider(
              height: 24.0,
            ),
                if (_createAccount) ...[
                  ListTile(
                      title: RaisedButton(
                    child: Text('Sign Up'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _auth.add(CreateAccount(_email, _password,
                            displayName: _name));
                      }
                    },
                  )),
                ] else ...[
                  ListTile(
                      title: RaisedButton(
                    child: Text('Login'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        _auth.add(LoginEvent(_email, _password));
                      }
                    },
                  )),
                ],
                ListTile(
                    title: FlatButton(
                  child: Text(_createAccount
                      ? 'Already have an account?'
                      : 'Create a new account?'),
                  onPressed: () {
                    if (mounted)
                      setState(() {
                        _createAccount = !_createAccount;
                      });
                  },
                )),
                ListTile(
                    title: RaisedButton(
                  child: Text('Start as Guest'),
                  onPressed: () {
                    _auth.add(LoginGuest());
                  },
                )),
                if (state is AuthLoadingState) ...[CircularProgressIndicator()],
              ],
            ),
          ),
        
          ]),),
    ));
  }
}