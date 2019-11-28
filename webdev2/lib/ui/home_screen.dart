import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webdev2/ui/dashboard_screen.dart';
import 'package:webdev2/ui/projects_screen.dart';
import 'package:webdev2/ui/settings_screen.dart';
import 'package:fb_auth/fb_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'project_sidebar.dart';
import 'package:firebase/firebase.dart' as fb;
import 'package:firebase/firestore.dart' as fs;
import 'package:webdev2/widgets/project_list_view.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  bool _homeSelected = true;
  bool _dashSelected = false;
  bool _settingSelected = false;
  Color _mainColour = Colors.blue;
  Color _textColour = Colors.grey[200];
  Color _menuIconUnselected = Colors.white;
  Color _menuIconSelected = Colors.blue[900];

  @override
  Widget build(BuildContext context) {
    final _user = AuthBloc.currentUser(context);

    return Material(
      
      child: Row(children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * .07,
                child: Material(
                  color: _mainColour,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar( //Avatar
                                
                                backgroundColor: _textColour,
                                child: Text("CRH", style: TextStyle(color: _mainColour),),
                                radius: MediaQuery.of(context).size.width * .02,
                              ),
                              SizedBox(
                                height: 22.5,
                              ),
                              Divider(
                                height: 5,
                              ),
                              SizedBox(
                                height: 22.5,
                              ),
                              IconButton( //Home Button
                                  //Home Button
                                  hoverColor: Colors.grey[300].withOpacity(.5),
                                  icon: Icon(Icons.home),
                                  color: _homeSelected
                                      ? _menuIconSelected
                                      : _menuIconUnselected,
                                  iconSize: 30,
                                  onPressed: () {
                                    setState(() {
                                      _homeSelected = true;
                                      _dashSelected = false;
                                      _settingSelected = false;
                                      pageController.jumpToPage(0);
                                    });
                                  }),
                              SizedBox(
                                height: 50,
                              ),
                              IconButton(  //Dashboard Button
                                 
                                  hoverColor: Colors.grey[300].withOpacity(.5),
                                  icon: Icon(Icons.dashboard),
                                  color: _dashSelected
                                      ? _menuIconSelected
                                      : _menuIconUnselected,
                                  iconSize: 30,
                                  onPressed: () {
                                    setState(() {
                                      _homeSelected = false;
                                      _dashSelected = true;
                                      _settingSelected = false;
                                      pageController.jumpToPage(1);
                                    });
                                  }),
                              SizedBox(
                                height: 50,
                              ),
                              IconButton( //Settings Button
                                  
                                  hoverColor: Colors.grey[300].withOpacity(.5),
                                  icon: Icon(Icons.settings),
                                  color: _settingSelected
                                      ? _menuIconSelected
                                      : _menuIconUnselected,
                                  iconSize: 30,
                                  onPressed: () {
                                    setState(() {
                                      _homeSelected = false;
                                      _dashSelected = false;
                                      _settingSelected = true;
                                      pageController.jumpToPage(2);
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Column(
                            children: <Widget>[
                              Divider(
                                height: 5,
                              ),
                              SizedBox(
                                height: 22.5,
                              ),
                              IconButton( //Log Out
                                  hoverColor: Colors.grey[300].withOpacity(.5),
                                  icon: Icon(
                                    Icons.exit_to_app,
                                    color: _menuIconUnselected,
                                  ),
                                  iconSize: 30,
                                  onPressed: () {
                                    setState(() {
                                      BlocProvider.of<AuthBloc>(context)
                                          .add(LogoutEvent(_user));
                                    });
                                  }),
                            ],
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white),
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: pageController,
              children: <Widget>[
                ProjectsScreen(_mainColour, _textColour, _user.displayName, "h"),
                DashboardScreen(),
                SettingsScreen(),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
