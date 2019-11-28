// import 'package:firebase/firebase.dart';
// import 'package:firebase/firestore.dart' as fs;
// import 'package:flutter/material.dart';
// import 'package:fb_auth/fb_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:pin_code_text_field/pin_code_text_field.dart';

//   fs.Firestore store = firestore();
//   fs.CollectionReference companyRef = store.collection("companies");
//   String _selectedCompany;

//   Future<dynamic> getCompanyPin(String cName) async{


//     final docRef =  await companyRef
//     .where("Company Name", "==", cName)
//     .onSnapshot.listen((data) => 
//     data.docs.forEach((doc)=> pin = doc.data()['Company Code']));

//   }


//   Future<bool> checkPin(String cName, dynamic pin) async {
//     dynamic dbCode = await getCompanyPin(cName);
//     if (dbCode == pin){
//       return true;
//     } else{
//       return false;
//     }
//   }


// return StreamBuilder(
//   stream: Firestore.instance
//       .collection('users')
//       .document(widget.userId.toString())
//       .snapshots(),
//   builder: (context, snapshot) {
//     if (!snapshot.hasData) {
//       return Center(
//         child: CircularProgressIndicator(
//           valueColor: AlwaysStoppedAnimation<Color>(Colors.deepOrange),
//         ),
//       );
//     } else {
//       return _buildUserTile(context, snapshot.data);
//     }
//   },
// );

// //   class CompLogin extends StatefulWidget {
// //     bool login;
// //  CompLogin(this.login);

// //   @override
// //   _CompLoginState createState() => _CompLoginState();
// // }

// class _CompLoginState extends State<CompLogin> {
//   @override
//   Widget build(BuildContext context) {
//     return widget.login ?
//   AlertDialog(
//     content:  Column(children: <Widget>[
//       StreamBuilder<fs.QuerySnapshot>(
//           stream: companyRef
//               .get()
//               .asStream(),
//           builder: (BuildContext
//                   context,
//               AsyncSnapshot<
//                       fs.QuerySnapshot>
//                   snapshot) {
//             if (snapshot.hasError)
//               return new Text(
//                   'Error: ${snapshot.error}');
//             switch (snapshot
//                 .connectionState) {
//               case ConnectionState
//                   .waiting:
//                 return new Text(
//                     'Loading...');
//               default:
//                 return FormField(
//                   builder:
//                       (FormFieldState
//                           state) {
//                     return InputDecorator(
//                       decoration:
//                           InputDecoration(
//                         labelText:
//                             'Company Name',
//                       ),
//                       isEmpty:
//                           _selectedCompany  ==
//                               '',
//                       child:
//                           new DropdownButtonHideUnderline(
//                         child:
//                             DropdownButton(
//                           value:
//                               _selectedCompany,
//                           isDense:
//                               true,
//                           onChanged:
//                               (dynamic
//                                   newValue) {
//                             setState(
//                                 () {
//                               _selectedCompany = newValue;                                                                            
//                               state.didChange(
//                                   newValue);
//                             });
//                           },
//                           items: snapshot
//                               .data
//                               .docs
//                               .map((fs.DocumentSnapshot
//                                   document) {
//                             return new DropdownMenuItem(
//                               value: document
//                                   .data()['Company Name'],
//                               child: new Text(
//                                   document.data()['Company Name']),
//                             );
//                           }).toList(),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//             }
//           }),
//      SizedBox(height: 10,),
//       FlatButton(child: Text("Check Credentials"),onPressed: () {
       
       
//       }),                                                  
      
// //     ]),
// //   )
                                              
// //                                               :

// //                                               Text("Hello");
// // }
// // }

  
                                        

 


  
