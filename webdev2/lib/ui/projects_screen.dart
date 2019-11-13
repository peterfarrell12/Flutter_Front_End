import 'package:flutter/material.dart';
import '../widgets/new_project.dart';
import '../widgets/project_list.dart';
import 'package:webdev2/Models/project.dart';
import 'project_sidebar.dart';

class ProjectsScreen extends StatefulWidget {
  Color mainColour;
  Color titleColour;
  String userName;

  ProjectsScreen(this.mainColour, this.titleColour, this.userName);
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
        color: widget.mainColour,
        child: Row(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: widget.titleColour,
                  borderRadius: new BorderRadius.horizontal(
                    left: new Radius.circular(25.0),
                  )),
              width: MediaQuery.of(context).size.width * .7,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.18,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xff999999))),
                          color: widget.titleColour),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Project List - CRH",
                              style: TextStyle(color: widget.mainColour, fontSize: 35)
                            )
                            // Padding(
                            //   padding: const EdgeInsets.only(left: 5),
                            //   child: Text("Welcome Back, " + widget.userName,
                            //       style: TextStyle(
                            //           color: widget.mainColour,
                            //           fontSize: 10,
                            //           fontFamily: "Roboto")),
                            // ),
                          ]),
                    ),
                    // Container(
                    //   color: widget.titleColour,
                    //   child: Padding(
                    //     padding: const EdgeInsets.all(8.0),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: <Widget>[
                    //         Text(
                    //           "ID",
                    //           style: TextStyle(color: Color(0xff716E74)),
                    //         ),
                    //         Text(
                    //           "TITLE",
                    //           style: TextStyle(color: Color(0xff716E74)),
                    //         ),
                    //         Text(
                    //           "OWNER",
                    //           style: TextStyle(color: Color(0xff716E74)),
                    //         ),
                    //         Text(
                    //           "DATE",
                    //           style: TextStyle(color: Color(0xff716E74)),
                    //         ),
                    //         Text(
                    //           "IE",
                    //           style: TextStyle(color: Color(0xff716E74)),
                    //         ),
                    //         Text(
                    //           "SC",
                    //           style: TextStyle(color: Color(0xff716E74)),
                    //         ),
                    //         Text(
                    //           "DASHBOARD",
                    //           style: TextStyle(color: Color(0xff716E74)),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 20,
                    ),
                    ProjectList(_projects, _deleteProject),
                    SizedBox(height: 10),
                    FloatingActionButton(
                      child: Icon(Icons.add),
                      backgroundColor: widget.mainColour,
                      elevation: 5,
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return NewProject(_addNewProject);
                            });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                          child: Container(
                            color: widget.titleColour,
                                                      child: Container(
                              decoration: BoxDecoration(
                                                  color: Colors.white,

                  borderRadius: new BorderRadius.only(
                    bottomLeft: new Radius.circular(25.0),
                    topLeft: new Radius.circular(25.0),
                  )),
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Sidebar(),
                    ],
                  )),
                          ),
            )
          ],
        ),
      ),
    );
  }
}
