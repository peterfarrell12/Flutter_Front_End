import 'package:flutter/material.dart';
import '../Models/project.dart';
import '../ui/projects_screen.dart';
import 'package:intl/intl.dart';

class ProjectList extends StatelessWidget {

  final List<Project> projects;
  final Function deletePj;

  ProjectList(this.projects, this.deletePj);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: projects.isEmpty 
        ? Center(child: Text(
          "No Projects Added Yet",
          style: TextStyle(color: Color(0xff999999)),
        ),)
        : ListView.builder(
          itemCount: projects.length,
          itemBuilder: (ctx, index){
            return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Card(
        margin: EdgeInsets.only(top: 5, bottom: 5),
        color: Color(0xff15111C),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              projects[index].id,
              style: TextStyle(color: Color(0xff5A7591)),
            ),
                        Text(
              projects[index].title,
              style: TextStyle(color: Color(0xff908D92)),
            ),
                                    SizedBox(width: 5,),

                        Text(
              projects[index].user,
              style: TextStyle(color: Color(0xff908D92)),
            ),
            Text(
              DateFormat('yyyy-MM-dd').format(projects[index].date),
              style: TextStyle(color: Color(0xff908D92))
            ),

                        IconButton(
             icon: Icon(Icons.add_circle_outline, color: Color(0xff908D92)),)
            ,
                        IconButton(
             icon: Icon(Icons.add_circle_outline, color: Color(0xff908D92)),)
            ,
                                    IconButton(
             icon: Icon(Icons.play_arrow, color: Colors.greenAccent))

          ],
        ),
      ),
      // child: Card(
      //   elevation: 5,
      //         child: ListTile(
      //     trailing: Row(
      //       mainAxisSize: MainAxisSize.min,
      //       children: <Widget>[
      //         IconButton(
      //           icon: Icon(Icons.edit),
      //           onPressed: () {
      //           },
      //           hoverColor: Colors.teal,
      //         ),
      //         IconButton(
      //           icon: Icon(Icons.file_download),
      //           onPressed: () {},
      //           hoverColor: Colors.teal,
      //         ),
      //         IconButton(
      //           icon: Icon(Icons.delete),
      //           onPressed: () {
      //             deletePj(projects[index].id);
      //           },
      //           hoverColor: Colors.teal,
      //         )
      //       ],
      //     ),
      //     title: Text(
      //       '${projects[index].title}',
      //     ),
      //     subtitle: Text(
      //       "Created On:  ${projects[index].date}  By ${projects[index].user}", style: TextStyle(),
      //     ),
      //   ),
      // ),
    );
          },
        )
      ),
      
    );
  }
}