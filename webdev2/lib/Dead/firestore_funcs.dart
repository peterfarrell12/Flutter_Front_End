import 'package:fb_auth/data/blocs/auth/auth_bloc.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/firebase.dart';

    fs.Firestore store = firestore();


void createProject(String user, String company, String name, String description)  async {
    fs.DocumentReference ref = await store.collection("companies").doc(company).collection('projects')
      .add({
        'Name': name,
        'User': user,
        'Company': company,
        'Date' : DateTime.now(),
        'Description' : description,
        'Last Edit' : DateTime.now()
      });
}

void createCompany(String companyName, String companyPIN, String companyABB)async {
  fs.DocumentReference ref = await store.collection('companies').doc(companyName);
  
  ref.set({

    'Company Name' : companyName,
    'Company PIN' : companyPIN,
    'Company ABB' : companyABB
  });
}

// Future<bool> checkPIN(String companyName, String companyPIN) async {
//   fs.DocumentReference ref =  store.collection('companies').doc(companyName);

//   Future<String> code = await ref.get().
  
// }

  Future<String> getCompanyPin(String companyName) async {
    String pin;
    await store
        .collection('companies') // Your Collections Name
        //.where("Company Name", "==", companyName).  // Your user Document Name
        .doc(companyName)
        .get()
        .then((val) {
          pin = val.data()['Company Pin'];  
    });

    return pin;
  }


  Future<bool> doesNameAlreadyExist(String name, String pin) async {
  final fs.DocumentSnapshot result = await store
    .collection('companies')
    .doc(name)
    .get();
  final fs.DocumentSnapshot documents = result;
  
  return documents.data()['Company PIN'].toString() == pin;
}

// void createCompany(String companyName, String companyPIN, String companyABB)async {
//   fs.DocumentReference ref = await store.collection('companies')
//   .add(
//     {

//     'Company Name' : companyName,
//     'Company PIN' : companyPIN,
//     'Company ABB' : companyABB
//   }
//   );
// }

void createUser(String userName, String email, String company) async {
  fs.DocumentReference ref = await store.collection('companies').doc(company).collection('users').add(
    {
      'Company' : company,
      'Username' : userName,
      'Email' : email
    }
  );
}

Future<String> getUsername(userName) async{
  String usr = await userName;

  return usr;
}



void deleteProject(String company, String docID) {
  try {
  store.collection("companies").doc(company).collection('projects').doc(docID).delete();
  } catch (e) {
    print(e.toString());
  }
}



