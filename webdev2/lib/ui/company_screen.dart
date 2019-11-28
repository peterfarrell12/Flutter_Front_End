import 'package:flutter/material.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:webdev2/Dead/firestore_funcs.dart';
import 'package:webdev2/ui/home_screen.dart';

class CompanyScreen extends StatefulWidget {
  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  final _logFormKey = GlobalKey<FormState>();
  final _signFormKey = GlobalKey<FormState>();
  static fs.Firestore store = firestore();
  fs.CollectionReference companyRef = store.collection("companies");
  bool _reg = true;
  String _selectedCompany, _name, _pin, _companyAbb;
  bool match;
  String cpin = 'no';

  void checkPin(newPin, pin) {
    if (newPin == pin) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      //error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                  child: Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Is Your Company Registered With SpendCentre?",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(8),
                        child: Text("Yes"),
                        onPressed: () {
                          setState(() {
                            _reg = true;
                          });
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    FlatButton(
                        color: Colors.blue,
                        textColor: Colors.white,
                        padding: EdgeInsets.all(8),
                        child: Text("No"),
                        onPressed: () {
                          setState(() {
                            _reg = false;
                          });
                        })
                  ],
                ),
              ),
              _reg
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _logFormKey,
                        child: Column(
                          children: <Widget>[
                            Container(
                                width: MediaQuery.of(context).size.width * .5,
                                child: StreamBuilder<fs.QuerySnapshot>(
                                    stream: companyRef.get().asStream(),
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
                                            builder: (FormFieldState state) {
                                              return InputDecorator(
                                                decoration: InputDecoration(
                                                  labelText: 'Company Name',
                                                ),
                                                isEmpty: _selectedCompany == '',
                                                child:
                                                    new DropdownButtonHideUnderline(
                                                  child: DropdownButton(
                                                    value: _selectedCompany,
                                                    isDense: true,
                                                    onChanged:
                                                        (dynamic newValue) {
                                                      setState(() {
                                                        _selectedCompany =
                                                            newValue;
                                                        state.didChange(
                                                            newValue);
                                                      });
                                                    },
                                                    items: snapshot.data.docs
                                                        .map(
                                                            (fs.DocumentSnapshot
                                                                document) {
                                                      return new DropdownMenuItem(
                                                        value: document.data()[
                                                            'Company Name'],
                                                        child: new Text(document
                                                                .data()[
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
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * .5,
                                child: TextFormField(
                                  obscureText: true,
                                  maxLength: 4,
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
                                      labelText: "Company PIN"),
                                  onSaved: (val) => _pin = val,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Material(
                                  child: RaisedButton(
                                      textColor: Colors.white,
                                      color: Colors.blue,
                                      child: Text("Company Log In"),
                                      onPressed: () {
                                        if (_logFormKey.currentState
                                            .validate()) {
                                          _logFormKey.currentState.save();

                                          doesNameAlreadyExist(
                                              _selectedCompany, _pin);
                                          setState(() {});
                                        }
                                      })),
                            )
                          ],
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8),
                      child: Form(
                        key: _signFormKey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * .5,
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
                                      labelText: "Company Name"),
                                  onSaved: (val) => _name = val,
                                  validator: (val) =>
                                      val.isEmpty ? 'Name Required' : null,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * .5,
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
                                      labelText: "Company Abbreviations"),
                                  onSaved: (val) => _companyAbb = val,
                                  validator: (val) => val.isEmpty
                                      ? 'Abbreviation Required'
                                      : null,
                                ),
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .5,
                                  child: TextFormField(
                                    obscureText: true,
                                    maxLength: 4,
                                    style: TextStyle(color: Color(0xff716E74)),
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 1.0),
                                        ),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.grey,
                                                width: 1.0)),
                                        labelText: "Company PIN"),
                                    onSaved: (val) => _pin = val,
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child: Material(
                                child: RaisedButton(
                                  textColor: Colors.white,
                                  color: Colors.blue,
                                  child: Text("Register Company"),
                                  onPressed: () {
                                    if (_signFormKey.currentState.validate()) {
                                      _signFormKey.currentState.save();
                                      createCompany(_name, _pin, _companyAbb);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomeScreen()),
                                      );
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
              new Container(
                  child: FutureBuilder<bool>(
                future: doesNameAlreadyExist(_selectedCompany, _pin),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data) {
                      return Text('Success');
                    } else {
                      return Text('Failure');
                    }
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default, show a loading spinner
                  return CircularProgressIndicator();
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
