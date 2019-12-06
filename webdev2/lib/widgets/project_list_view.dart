import 'package:fb_auth/data/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import '../ui/projects_screen.dart';
import 'package:intl/intl.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:intl/intl.dart';
import 'package:webdev2/Dead/firestore_funcs.dart';



    fs.Firestore store = firestore();
    fs.CollectionReference companyRef = store.collection("companies").doc("CRH plc").collection("projects");
    fs.CollectionReference projectRef = store.collection('projects');


class ProjectList extends StatefulWidget {

  bool fil;
  final String company;

  ProjectList(this.fil, this.company);


  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {

  // Future getCompanies()async {
  //   fs.fs.QuerySnapshot qn = await store.collection("companies").get();

  //   return qn.docs;
  // }

    @override
  void initState() {
    super.initState();
      }

  @override
  Widget build(BuildContext context) {
  final _user = AuthBloc.currentUser(context);
  final _company = "CRH plc";
  //bool filter = true;


    return Center(
        child: Container(
          child: StreamBuilder<fs.QuerySnapshot>(
                stream: !widget.fil ? companyRef.where("Company", "==", widget.company)
                  .get().asStream() : companyRef.where("User", "==", _user.displayName)
                  .get().asStream(),
                builder: (BuildContext context,
                  AsyncSnapshot<fs.QuerySnapshot> snapshot) {
                    if (snapshot.hasError)
                      return new Text('Error: ${snapshot.error}');
                    switch (snapshot.connectionState) {
                      case ConnectionState.waiting:
                        return Center(child: CircularProgressIndicator());
                      default:
                        return new ListView(
                          children: snapshot.data.docs
                            .map((fs.DocumentSnapshot document) {
                              return new CustomCard(
                                projectTitle: document.data()['Name'],
                                projectUser: document.data()["User"],
                                projectDate: document.data()['Date'],
                                projectColour: Colors.green[900],
                                projectID: document.id,
                              );
                          }).toList(),
                        );
                              }})),
      
    );
  }
}



      
class CustomCard extends StatelessWidget {
  CustomCard({@required this.projectTitle, this.projectUser, this.projectDate, this.projectColour, this.projectID});

  final projectTitle;
  final projectUser;
  final projectDate;
  final projectColour;
  final f = new DateFormat('dd-MMM-yy');
  final projectID;
  


  @override
  Widget build(BuildContext context) {
    return 
    Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.only(top: 5.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Card(

          child: 
          Padding(
           padding: const EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.delete_sweep), onPressed: (){
                      showDialog(
                        context: context,
                        child: AlertDialog(
                          title: Text("Delete Project?"),
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              hoverColor: Colors.blue,
                              child: Text("Delete"),
                              onPressed: () {
                                deleteProject("CRH plc", projectID);
                                Navigator.pop(context);
                              })
                           
                          ),
                        )
                      );
                    },),
                                    SizedBox(width: 30,),

                    CircleAvatar(backgroundColor: Colors.green,),
                    SizedBox(width: 30,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(projectTitle, style: TextStyle(color: Colors.black),),
                        Text(projectUser.toString()),
                      ],
                    )
                  ],
                ),
                Row(
                  children: <Widget>[
                    Text("Created On: " + f.format(projectDate).toString()),
                    SizedBox(width: 30,),
                     Container(
                       decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
            Radius.circular(5.0)),
                         border: Border.all(color: Colors.grey)
                       ),
                       child: Padding(
                         padding: const EdgeInsets.all(8.0),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
                             Icon(Icons.show_chart, color: Colors.green,),
                            Text("Visualize", )
                           ],
                         ),
                       ),
                     )
                     
                  ],)
              ],
            ),
          )
        ),
      ),
    );
  }}