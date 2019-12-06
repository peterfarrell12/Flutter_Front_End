import 'package:flutter/material.dart';
import 'package:webdev2/models/project.dart';
import 'package:webdev2/widgets/project_list_view_2.dart';
import 'package:webdev2/ui/Dashboard/test_data.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'charts/chart_funcs.dart';
import 'charts/charts.dart';
import 'test_data.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _isFil = true;
  bool _projectChosen = false;
  Project _selectProject;
  bool _toggleOn = true;

  void _updateProject(Project project) {
    setState(() {
      _selectProject = project;
      _projectChosen = true;
    });
  }

  /// Create one series with sample hard coded data.

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: Container(
                        decoration: new BoxDecoration(
                                          color: Colors.white,

          border: new Border(
            bottom: new BorderSide(
              color: Colors.blue,
              width:3,
              style: BorderStyle.solid
            ),
          ),),
                        height: MediaQuery.of(context).size.height * .12,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              //_projectChosen ? Text(_selectProject.user, style: TextStyle(fontSize: 20),) : Text("Choose Project!"),
                              _projectChosen ? Text(_selectProject.title + ' Dashboard', style: TextStyle(fontSize: 20),) : Text("Choose Project!"),
                              IconButton(
                                color: _toggleOn ? Colors.black : Colors.blue,
                                iconSize: 30,
                                icon: Icon(Icons.toc),
                                onPressed: () {
                                  setState(() {
                                    _toggleOn = !_toggleOn;
                                  });
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: !_projectChosen
                            ? Center(child: Text("No Data Yet"))
                            : SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            infoCard(context),
                                            infoCard(context),
                                            infoCard(context),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            infoCard(context),
                                            infoCard(context),
                                            infoCard(context),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 20),
                                        child: Card(
                                          elevation: 5,
                                          color: Colors.white,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  "Spend By Category",
                                                  style: TextStyle(fontSize: 30),
                                                ),
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      .5,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      .5,
                                                  child: CategoryPieChart(
                                                      createCategoryData(
                                                          categoryData)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 20),
                                        child: Card(
                                          elevation: 5,
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                                child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  "Spend Per Month",
                                                  style: TextStyle(fontSize: 30),
                                                ),
                                                Container(
                                                    height: MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        .5,
                                                    width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .5,
                                                    child: MonthlyBarChart(
                                                        createMonthlyData(
                                                            monthlyData))),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                     
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 20),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            Card(
                                              elevation: 5,
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                                          child: Container(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: TopSuppliersTable()),
                                            ),
                                            Card(
                                              elevation: 5,
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                                                          child: Container(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: TopLineItemsTable()),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: _toggleOn,
              child: Container(
                width: MediaQuery.of(context).size.width * .2,
                color: Color(0xff3B4254),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            
                            decoration: BoxDecoration(
                              color: _isFil ? Colors.blue : Colors.white,
                              borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(40.0),
                                  bottomLeft: const Radius.circular(40.0),
                                  topRight: const Radius.circular(0),
                                  bottomRight: const Radius.circular(0)),
                            ),
                            child: FlatButton(
                              
                              textColor: _isFil ? Colors.white : Colors.blue,
                              child: Text("User"),
                              onPressed: () {
                                setState(() {
                                  _isFil = true;
                                });
                              },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: _isFil ? Colors.white : Colors.blue,
                               borderRadius: new BorderRadius.only(
                                  topRight: const Radius.circular(40),
                                  bottomRight: const Radius.circular(40)),
                            ),
                            child: FlatButton(
                              textColor: _isFil ? Colors.blue : Colors.white,
                              child: Text("Company"),
                              onPressed: () {
                                setState(() {
                                  _isFil = false;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                          child: Container(
                        child: ProjectListView(_isFil, _updateProject),
                      ))
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Card infoCard(context) => Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    elevation: 8.0,
    margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * .16,
        width: MediaQuery.of(context).size.width * .2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "€240k",
              style: TextStyle(fontSize: 30),
            ),
            Text("Total Spend")
          ],
        ),
      ),
    ));
