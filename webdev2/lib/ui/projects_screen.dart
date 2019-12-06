import 'package:fb_auth/data/blocs/auth/auth_bloc.dart';
import 'package:flutter/material.dart';
import '../widgets/new_project.dart';
import 'project_sidebar.dart';
import 'package:webdev2/widgets/project_list_view.dart';

class ProjectsScreen extends StatefulWidget {
  Color mainColour;
  Color titleColour;
  String userName;
  String company;
  bool isFiltered;

  ProjectsScreen(this.mainColour, this.titleColour, this.userName, this.company);
  @override
  _ProjectsScreenState createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final _user = AuthBloc.currentUser(context);
    

    return Material(
      child: Container(
        color: widget.mainColour,
        //Split Project / Sidebar
        child: Row(
          children: <Widget>[
            //Project Container
            Container(
              decoration: BoxDecoration(
                  color: widget.titleColour,
                  borderRadius: new BorderRadius.horizontal(
                    left: new Radius.circular(25.0),
                  )),
              width: MediaQuery.of(context).size.width * .7,
              height: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                //Project Column
                child: Column(
                  children: <Widget>[
                    //AppBar Container
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xff999999))),
                          color: widget.mainColour),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                _user.displayName,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text("Project List",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              FloatingActionButton(
                                backgroundColor: widget.titleColour,
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    child:  
                                    
                                    NewProject(_user.displayName, widget.company),
                                  );
                                  
                                },
                                child: Icon(
                                  Icons.add,
                                  color: widget.mainColour,
                                ),
                              )
                            ]),
                      ),
                    ),
                    //Sized Box Between
                    SizedBox(
                      height: 20,
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: widget.mainColour)),
                                //Tab Row
                                child: Row(
                                  children: <Widget>[
                                    //Users Button
                                    Expanded(
                                      child: Container(
                                        color: widget.isFiltered
                                            ? widget.mainColour
                                            : widget.titleColour,
                                        child: FlatButton(
                                          child: Text(
                                            "User",
                                            style: TextStyle(
                                                color: !widget.isFiltered
                                                    ? widget.mainColour
                                                    : widget.titleColour),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              widget.isFiltered = true;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    //Company Button
                                    Expanded(
                                      child: Container(
                                        color: !widget.isFiltered
                                            ? widget.mainColour
                                            : widget.titleColour,
                                        child: FlatButton(
                                          padding: EdgeInsets.all(0),
                                          child: Text(
                                            "Company",
                                            style: TextStyle(
                                                color: widget.isFiltered
                                                    ? widget.mainColour
                                                    : widget.titleColour),
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              widget.isFiltered = false;
                                            });
                                          },
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                    ),

                                        //         //Divider Between Tabs and Projects
                            SizedBox(
                              height: 20,
                              child: new Center(
                                child: new Container(
                                  margin: new EdgeInsetsDirectional.only(
                                      start: 1.0, end: 1.0),
                                  height: 2.0,
                                  color: widget.mainColour,
                                ),
                              ),
                            ),
                    Expanded(child: 
                    Container(child: ProjectList(widget.isFiltered, widget.company),),)
                  ],
                ),

              ),
            ),
            //SideBar Container
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
