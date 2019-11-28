// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:webdev2/Dead/firestore_funcs.dart';
// import 'package:firebase/firebase.dart';
// import 'package:firebase/firestore.dart' as fs;
// import 'package:fb_auth/fb_auth.dart';

// class CompanyCheckScreen extends StatefulWidget {
//   final String name;
//   final String email;
//   final String password;
//   final bool createAccount;

//   CompanyCheckScreen(
//       {this.name, this.email, this.password, this.createAccount});
//   @override
//   _CompanyCheckScreenState createState() => _CompanyCheckScreenState();
// }

// class _CompanyCheckScreenState extends State<CompanyCheckScreen> {
//   static fs.Firestore store = firestore();
//   fs.CollectionReference companyRef = store.collection("companies");
//   bool isSwitched = true;
//   String _selectedCompany, _pin, _companyAbb;
//   final _formKey = GlobalKey<FormState>();
//   bool _companyChosen = false;

//   @override
//   Widget build(BuildContext context) {
//     final _auth = BlocProvider.of<AuthBloc>(context); //Creating an Auth Bloc

//     return Center(
//       child: Container(
//         height: MediaQuery.of(context).size.height * .8,
//         child: AlertDialog(
//             title: Center(
//                 child: Text(
//               "Company Login",
//               style: TextStyle(color: Colors.blue),
//             )),
//             content: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: <Widget>[
//                     Row(
//                       children: <Widget>[
//                         Text("Company Registered?"),
//                         Switch(
//                           value: isSwitched,
//                           activeColor: Colors.blue,
//                           onChanged: (val) {
//                             setState(() {
//                               isSwitched = val;
//                             });
//                           },
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       child: isSwitched
//                           ? StreamBuilder<fs.QuerySnapshot>(
//                               stream: companyRef.get().asStream(),
//                               builder: (BuildContext context,
//                                   AsyncSnapshot<fs.QuerySnapshot> snapshot) {
//                                 if (snapshot.hasError)
//                                   return new Text('Error: ${snapshot.error}');
//                                 switch (snapshot.connectionState) {
//                                   case ConnectionState.waiting:
//                                     return new Text('Loading...');
//                                   default:
//                                     return FormField(
//                                       builder: (FormFieldState state) {
//                                         return InputDecorator(
//                                           decoration: InputDecoration(
//                                             labelText: 'Company Name',
//                                           ),
//                                           isEmpty: _selectedCompany == '',
//                                           child:
//                                               new DropdownButtonHideUnderline(
//                                             child: DropdownButton(
//                                               value: _selectedCompany,
//                                               isDense: true,
//                                               onChanged: (dynamic newValue) {
//                                                 setState(() {
//                                                   _selectedCompany = newValue;
//                                                   _companyChosen = true;
//                                                   state.didChange(newValue);
//                                                 });
//                                               },
//                                               items: snapshot.data.docs.map(
//                                                   (fs.DocumentSnapshot
//                                                       document) {
//                                                 return new DropdownMenuItem(
//                                                   value: document
//                                                       .data()['Company Name'],
//                                                   child: new Text(document
//                                                       .data()['Company Name']),
//                                                 );
//                                               }).toList(),
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     );
//                                 }
//                               })
//                           : Column(
//                               children: <Widget>[
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: TextFormField(
//                                     style: TextStyle(color: Color(0xff716E74)),
//                                     textAlign: TextAlign.center,
//                                     decoration: InputDecoration(
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                               color: Colors.grey, width: 1.0),
//                                         ),
//                                         enabledBorder: const OutlineInputBorder(
//                                             borderSide: const BorderSide(
//                                                 color: Colors.grey,
//                                                 width: 1.0)),
//                                         labelText: "Company Name"),
//                                     onSaved: (val) => _selectedCompany = val,
//                                     onChanged: (val) {
//                                       setState(() {
//                                         _companyChosen = true;
//                                       });
//                                     },
//                                     validator: (val) =>
//                                         val.isEmpty ? 'Name Required' : null,
//                                   ),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: TextFormField(
//                                     style: TextStyle(color: Color(0xff716E74)),
//                                     textAlign: TextAlign.center,
//                                     decoration: InputDecoration(
//                                         focusedBorder: OutlineInputBorder(
//                                           borderSide: BorderSide(
//                                               color: Colors.grey, width: 1.0),
//                                         ),
//                                         enabledBorder: const OutlineInputBorder(
//                                             borderSide: const BorderSide(
//                                                 color: Colors.grey,
//                                                 width: 1.0)),
//                                         labelText: "Company Abbreviations"),
//                                     onSaved: (val) => _companyAbb = val,
//                                     onChanged: (val) {
//                                       setState(() {
//                                         _companyChosen = true;
//                                       });
//                                     },
//                                     validator: (val) => val.isEmpty
//                                         ? 'Abbreviation Required'
//                                         : null,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextFormField(
//                         obscureText: true,
//                         maxLength: 4,
//                         style: TextStyle(color: Color(0xff716E74)),
//                         textAlign: TextAlign.center,
//                         decoration: InputDecoration(
//                             focusedBorder: OutlineInputBorder(
//                               borderSide:
//                                   BorderSide(color: Colors.grey, width: 1.0),
//                             ),
//                             enabledBorder: const OutlineInputBorder(
//                                 borderSide: const BorderSide(
//                                     color: Colors.grey, width: 1.0)),
//                             labelText: "Company PIN"),
//                         onSaved: (val) => _pin = val,
//                         // validator: (val) => val.isEmpty
//                         //     ? 'Name Required'
//                         //     : null,
//                         //validator: email,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Material(
//                       child: RaisedButton(
//                         padding: EdgeInsets.all(5),
//                         child: Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: isSwitched
//                                 ? Text("Check Credentials")
//                                 : Text("Create Company")),
//                         color: Colors.blue,
//                         textColor: Colors.white,
//                         onPressed: () {
//                           if (widget.createAccount) {
//                             if (isSwitched) {
//                               if (_selectedCompany.isNotEmpty) {
//                                 _auth.add(CreateAccount(
//                                     widget.email, widget.password,
//                                     displayName: widget.name));
//                                 createUser(widget.name, widget.email,
//                                     _selectedCompany);
//                               }
//                             } else {
//                               createCompany(_selectedCompany, _pin);
//                               _auth.add(CreateAccount(
//                                   widget.email, widget.password,
//                                   displayName: widget.name));
//                               createUser(
//                                   widget.name, widget.email, _selectedCompany);
//                             }
//                           } else {
//                             _auth
//                                 .add(LoginEvent(widget.email, widget.password));
//                           }
//                           Navigator.pop(context);
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             )),
//       ),
//     );
//   }
// }
