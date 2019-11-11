import 'package:flutter/material.dart';
import '../widgets/new_project.dart';
import '../widgets/project_list.dart';
import 'package:webdev2/Models/project.dart';

class ProjectsScreen extends StatefulWidget {
  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final _formKey = GlobalKey<FormState>();
  List<Project> _projects = [
    Project(
        id: "12345678",
        title: "CRH Ireland Tooling 2019",
        user: "Peter Farrell",
        date: DateTime.now(),
        invoiceExtractor: false,
        reporter: false,
        spendClassifier: false),
    Project(
        id: "12345678",
        title: "CRH Ireland Mobile Equipment 2019",
        user: "Stephen McCann",
        date: DateTime.now(),
        invoiceExtractor: false,
        reporter: false,
        spendClassifier: false),
    Project(
        id: "12345678",
        title: "CRH Ireland Crane Hire 2019",
        user: "Stephen McCann",
        date: DateTime.now(),
        invoiceExtractor: false,
        reporter: false,
        spendClassifier: false),
    Project(
        id: "12345678",
        title: "CRH Ireland Samson 2019",
        user: "Stephen McCann",
        date: DateTime.now(),
        invoiceExtractor: false,
        reporter: false,
        spendClassifier: false),
    Project(
        id: "12345678",
        title: "CRH Ireland Tyres 2019",
        user: "Peter Farrell",
        date: DateTime.now(),
        invoiceExtractor: false,
        reporter: false,
        spendClassifier: false),
    Project(
        id: "12345678",
        title: "CRH Ireland Mobile Crushing 2019",
        user: "Peter Farrell",
        date: DateTime.now(),
        invoiceExtractor: false,
        reporter: false,
        spendClassifier: false),
    Project(
        id: "12345678",
        title: "CRH Ireland Extraction 2019",
        user: "Peter Farrell",
        date: DateTime.now(),
        invoiceExtractor: false,
        reporter: false,
        spendClassifier: false),
    Project(
        id: "12345678",
        title: "CRH Ireland PPE 2019",
        user: "Eoin Kieran",
        date: DateTime.now(),
        invoiceExtractor: false,
        reporter: false,
        spendClassifier: false),
    Project(
        id: "12345678",
        title: "CRH Ireland Water 2019",
        user: "Brian Connolly",
        date: DateTime.now(),
        invoiceExtractor: false,
        reporter: false,
        spendClassifier: false),
  ];

  void _addNewProject(String pjTitle, String pjUser, String pjID, bool pjIE,
      bool pjSC, bool pjR) {
    final newPJ = Project(
        title: pjTitle,
        date: DateTime.now(),
        id: pjID,
        invoiceExtractor: pjIE,
        reporter: pjR,
        spendClassifier: pjSC,
        user: pjUser);

    setState(() {
      _projects.add(newPJ);
    });
  }

  void _deleteProject(String id) {
    setState(() {
      _projects.removeWhere((pj) => pj.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Color(0xff0E0A15),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.18,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Color(0xff999999))),
                  color: Color(0xff1B1820)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Projects",
                              style: TextStyle(
                                  color: Color(0xff999999),
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Roboto")),
                        ),
                        IconButton(
                            icon: Icon(Icons.add_circle_outline),
                            iconSize: 50,
                            color: Color(0xff999999),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return NewProject(_addNewProject);
                                  });
                            })
                      ]),

                
              
              
            ),
                                  Container(
                                    color: Color(0xff1B1820),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text("ID", style: TextStyle(color: Color(0xff716E74)),),
                          Text("TITLE", style: TextStyle(color: Color(0xff716E74)),),
                          Text("OWNER", style: TextStyle(color: Color(0xff716E74)),),
                          Text("DATE", style: TextStyle(color: Color(0xff716E74)),),
                          Text("IE", style: TextStyle(color: Color(0xff716E74)),),
                          Text("SC", style: TextStyle(color: Color(0xff716E74)),),
                          Text("DASHBOARD", style: TextStyle(color: Color(0xff716E74)),)
                        ],
                      ),
                                    ),
                                  ),
            SizedBox(
              height: 20,
            ),
            ProjectList(_projects, _deleteProject)
          ],
        ),
      ),
    );
  }
}
