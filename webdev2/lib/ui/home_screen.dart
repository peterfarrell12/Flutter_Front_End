import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webdev2/ui/dashboard_screen.dart';
import 'package:webdev2/ui/projects_screen.dart';
import 'package:webdev2/ui/settings_screen.dart';
import 'package:fb_auth/fb_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

    PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );
  int currentPage = 0;
  String _pageTitle;
  bool _homeSelected = false;
  bool _dashSelected = false;
  bool _settingSelected = false;
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
                color: Color(0xff332533),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Welcome ${_user?.displayName ?? 'Guest'}'),
                      Material(
                                color: Color(0xff332533),

        child: IconButton(
          hoverColor: Colors.grey[300].withOpacity(.5),

          icon: Icon(Icons.home),
          color: currentPage == 0 ? Colors.white : Colors.grey,
          iconSize: 30,
          onPressed: (){ 
            setState(() {
              _homeSelected  = true;
              _dashSelected = false;
              _settingSelected = false;
              pageController.jumpToPage(0);
            });
          }
        ),
      ),  
                      SizedBox(
                        height: 50,
                      ),
                                            Material(
        color: Color(0xff332533),
        child: IconButton(
          hoverColor: Colors.grey[300].withOpacity(.5),
          icon: Icon(Icons.dashboard),
          color: _dashSelected ? Colors.white : Colors.grey,
          iconSize: 30,
          onPressed: (){ 
            setState(() {
              _homeSelected  = false;
              _dashSelected = true;
              _settingSelected = false;
              pageController.jumpToPage(1);
            });
          }
        ),
      ),
                      SizedBox(
                        height: 50,
                      ),
                      Material(
        color: Color(0xff332533),
        child: IconButton(
          hoverColor: Colors.grey[300].withOpacity(.5),
          icon: Icon(Icons.settings),
          color: _settingSelected ? Colors.white : Colors.grey,
          iconSize: 30,
          onPressed: (){ 
            setState(() {
              _homeSelected  = false;
              _dashSelected = false;
              _settingSelected = true;
              pageController.jumpToPage(2);
            });
          }
        ),
      ),
      Material(
        child: IconButton(
          icon:Icon(Icons.exit_to_app),
          onPressed: (){
            BlocProvider.of<AuthBloc>(context).add(LogoutEvent(_user));
          },
        ),
      )
                    ]),
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
                  //physics: NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: <Widget>[
                    ProjectsScreen(),
                    DashboardScreen(),
                    SettingsScreen(),
                  ],
                  
                ),
              ),
            )
      ]),
    );
  }
}


