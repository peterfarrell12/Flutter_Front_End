import 'package:flutter/material.dart';
import 'package:webdev2/widgets/project_list_view.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .2,
          width: double.infinity,
          color: Colors.amberAccent,
        ),
                  Expanded(
                                      child: Container(child: ProjectList(true, "h"),
          
        ),
                  ),
      ],
    );
  }
}