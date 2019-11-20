import 'package:firebase/firestore.dart' as fs;
import 'package:firebase/firebase.dart';

    fs.Firestore store = firestore();


void createProject(String user, String company, String name)  async {
    fs.DocumentReference ref = await store.collection("companies").doc(company).collection('projects')
      .add({
        'Name': name,
        'User': user,
        'Company': company,
        'Date' : DateTime.now()
      });
}