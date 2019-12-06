import 'package:fb_auth/data/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:webdev2/models/project.dart';
import '../ui/projects_screen.dart';
import 'package:intl/intl.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/firestore.dart' as fs;
import 'package:intl/intl.dart';
import 'package:webdev2/Dead/firestore_funcs.dart';
import 'package:webdev2/ui/Dashboard/dashboard_screen.dart';


fs.Firestore store = firestore();
fs.CollectionReference companyRef =
    store.collection("companies").doc("CRH plc").collection("projects");
fs.CollectionReference projectRef = store.collection('projects');

class ProjectListView extends StatefulWidget {

  Function updateProject;
  final bool fil;
  //final String company;

  ProjectListView(this.fil, this.updateProject );

  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectListView> {


  @override
  void initState() {
    super.initState();
  }

  Project _selectedProject;

  @override
  Widget build(BuildContext context) {
    //final _user = AuthBloc.currentUser(context);
    final _user = 'PeterF4282';
    final _company = "CRH plc";

    return Center(
      child: Container(
          child: StreamBuilder<fs.QuerySnapshot>(
              stream: !widget.fil
                  ? companyRef
                      //.where("Company", "==", _company)
                      .get()
                      .asStream()
                  : companyRef
                      .where("User", "==", _user)
                      .get()
                      .asStream(),
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
                        return makeCard(
                          document.data()['Title'],
                          document.data()["User"],
                          document.data()['Date'],
                          Colors.green[900],
                          document.id,
                                                    widget.updateProject,

                        );
                      }).toList(),
                    );
                }
              })),
    );
  }
}



Card makeCard(String projectTitle, String projectUser, DateTime projectDate,
        Color projectColor, String projectID, Function updateProject) =>
    Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: 
        //Color.fromRGBO(64, 75, 96, .9)
        Colors.white),
        child: makeListTile(
            projectTitle, projectUser, projectDate, projectColor, projectID, updateProject),
      ),
    );

ListTile makeListTile(String projectTitle, String projectUser,
        DateTime projectDate, Color projectColor, String projectID, Function updateProject) =>
    ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.blue))),
        child: Icon(Icons.show_chart, color: Colors.blue),
      ),
      title: Text(
        projectTitle,
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
      // subtitle: 

      //     Padding(
      //           padding: EdgeInsets.only(left: 10.0),
      //           child:
      //               Text(projectUser, style: TextStyle(color: Colors.blue))),
          
        
  
      // trailing:
      //     Icon(Icons.keyboard_arrow_right, color: Colors.blue, size: 30.0),
      onTap: () {
        Project project = Project(title: projectTitle, user: projectUser, date: projectDate, id: projectID);
        updateProject(project);
      },
    );
