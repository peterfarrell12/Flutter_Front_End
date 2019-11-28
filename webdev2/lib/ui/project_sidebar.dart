import 'package:flutter/material.dart';
import 'package:webdev2/widgets/project_list_view.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Sidebar extends StatefulWidget {
  @override
  _SidebarState createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: PageView(
          controller: pageController,
          children: <Widget>[
            SideBarHome(),
            Container(
              color: Colors.yellow,
              child: Text("Invoice Extraction"),
            ),
            Container(
              color: Colors.yellow,
              child: Text("Spend Classification"),
            )
          ],
        ),
      ),
    );
  }
}

class SideBarHome extends StatelessWidget {
  const SideBarHome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[

            Column(

              children: <Widget>[
                            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    child: Icon(
                  Icons.comment,
                  color: Colors.blue,
                )
                    ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text("Project Name",
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 20))),
                ),
              ],
            ),
            SizedBox(height: 10,),
                ProjectDetailRow(
                  text1: "Project User",
                  text2: "PeterF4282",
                ),
                ProjectDetailRow(
              text1: "Created On",
              text2: "23 Nov 2019",
            ),
            ProjectDetailRow(
              text1: "Last Edit",
              text2: "01 Dec 2019",
            ),
            DescriptionBox(),
              ],
            ),
            
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Divider(
                color: Colors.grey,
                height: 5,
              ),
            ),
            InfoTile(
              title: "Invoice Extraction",
              color: Colors.pink,
              percentageComplete: 1,
            ),
            InfoTile(
              title: "Spend Classification",
              color: Colors.amber,
              percentageComplete: .7,
            ),
            Container(
              width: MediaQuery.of(context).size.width * .2,
              child: Card(
                elevation: 2,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Uploaded Files",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.adjust,
               
              ),
               iconSize: 50,
              color: Colors.green,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  double percentageComplete;
  Color color;
  String title;
  String subtitle;
  InfoTile({this.percentageComplete, this.color, this.subtitle, this.title});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: ListTile(
          leading: CircularPercentIndicator(
            radius: 45.0,
            lineWidth: 4.0,
            percent: percentageComplete,
            center: percentageComplete < 1
                ? Icon(Icons.clear, color: color)
                : Icon(Icons.check, color: color),
            progressColor: color,
          ),
          title: Text(
            title,
            style: TextStyle(color: color),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: color,
          ),
        ),
      ),
    );
  }
}

class DescriptionBox extends StatelessWidget {
  const DescriptionBox({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Column(
          children: <Widget>[
            Container(
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text("Description",
                          style: TextStyle(color: Colors.white))),
                )),
            Container(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                      "This is a project for tyres in 2019-20209, RFP due out in october data for x supplier, y supplier and z supplier")),
            ))
          ],
        ),
      ),
    );
  }
}

class ProjectDetailRow extends StatelessWidget {
  final String text1;
  final String text2;

  ProjectDetailRow({this.text1, this.text2});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      text1,
                      style: TextStyle(color: Colors.white),
                    )),
                  )),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      text2,
                      style: TextStyle(),
                    )),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
