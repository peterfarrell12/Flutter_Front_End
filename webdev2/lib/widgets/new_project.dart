import 'package:flutter/material.dart';
import '../Models/project.dart';

class NewProject extends StatefulWidget {
  final Function addPj;

  NewProject(this.addPj);
  @override
  _NewProjectState createState() => _NewProjectState();
}

class _NewProjectState extends State<NewProject> {

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _userController = TextEditingController();
  final _idController = TextEditingController();
  bool _IE;
  bool _SP;
  bool _RE;

  void _submitData(){
    final enteredTitle = _titleController.text;
    final enteredUser = _userController.text;
    final enteredID = _idController.text;

    widget.addPj(
      enteredTitle,
      enteredUser,
      enteredID,
      _IE,
      _SP,
      _RE
    );

    Navigator.of(context).pop();
  }
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
                              onFieldSubmitted: (_) => _submitData(),
                              controller: _idController,
                              decoration: InputDecoration(
    labelText: 'Enter Project ID'
  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              onFieldSubmitted: (_) => _submitData(),
                              controller: _titleController,
                              decoration: InputDecoration(
    labelText: 'Enter Project Title'
                            ),
                          ),),
                                                    Padding(
                            padding: EdgeInsets.all(8.0),
                            child: TextFormField(
                              onFieldSubmitted: (_) => _submitData(),
                              controller: _userController,
                              decoration: InputDecoration(
    labelText: 'Enter Project User'
                            ),
                          ),),
                          // SwitchListTile(
                          //     title: const Text('Invoice Extraction'),
                          //     value: _IE,
                          //     onChanged: (bool val) =>
                          //         setState(() => _IE = val)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(
                              child: Text("Submitß"),
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  _submitData();
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