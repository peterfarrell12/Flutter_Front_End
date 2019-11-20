import 'package:flutter/material.dart';
import '../Models/project.dart';
import 'package:webdev2/Dead/firestore_funcs.dart';

class NewProject extends StatefulWidget {
  final String user;
  final String company;

  NewProject(this.user, this.company);
  @override
  _NewProjectState createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    
                  return AlertDialog(
                    title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text('Adding New Project'),
                              IconButton(
                                icon: Icon(Icons.close),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              )
                            ],
                          ),
                    content: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: _titleController,
                              decoration: InputDecoration(
    labelText: 'Enter Project Title'
  ),),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              child: Text("Create"),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  createProject(widget.user, widget.company, _titleController.text);
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  );
              
          
  }
}