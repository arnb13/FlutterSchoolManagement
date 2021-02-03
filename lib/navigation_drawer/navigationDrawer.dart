import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  static int pos = 0;
  final Function(int pos) getDrawer;

  const NavigationDrawer({Key key, this.getDrawer, pos, fab}) : super(key: key);

  @override
  _NavigationDrawer createState() => _NavigationDrawer();

}

class _NavigationDrawer extends State<NavigationDrawer> {

  String user = 'Arnob';
  bool isLogin = true;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.teal,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(user,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),

                (isLogin? FlatButton(onPressed: () {
                  //Log out

                },
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.logout,
                        size: 20,),
                      SizedBox(width: 5,),
                      Text('Logout',
                        style: TextStyle(
                            fontSize: 20
                        ),
                      ),
                    ],
                  ),

                ) : FlatButton(onPressed: () {
                  //Go to login page

                },
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.login_rounded,
                        size: 20,),
                      SizedBox(width: 5,),
                      Text('Login',
                        style: TextStyle(
                            fontSize: 20
                        ),
                      )
                    ],
                  ),

                )
                )
              ],
            )
        ),
          ListTile(
            selected: (NavigationDrawer.pos == 0)? true: false,
            leading: Icon(Icons.dashboard_rounded),
            title: Text('Dashboard',
              style: TextStyle(
                  fontSize: 20
              ),
            ),
            onTap: () {
              if (NavigationDrawer.pos != 0) {
                setState(() {
                  NavigationDrawer.pos = 0;
                  widget.getDrawer(NavigationDrawer.pos);
                  Navigator.pop(context);
                });
              }
            },
          ),

          ListTile(
            selected: (NavigationDrawer.pos == 1)? true: false,
            leading: Icon(Icons.wc_rounded),
            title: Text('Student',style: TextStyle(
                fontSize: 20
            ),),
            onTap: () {
              if (NavigationDrawer.pos != 1) {
                NavigationDrawer.pos = 1;

                widget.getDrawer(NavigationDrawer.pos);

                Navigator.pop(context);
              }
            },
          ),

          ListTile(
            selected: (NavigationDrawer.pos == 2)? true: false,
            leading: Icon(Icons.follow_the_signs_rounded),
            title: Text('Teacher',style: TextStyle(
                fontSize: 20
            ),
            ),
            onTap: () {
              if (NavigationDrawer.pos != 2) {
                NavigationDrawer.pos = 2;

                widget.getDrawer(NavigationDrawer.pos);
                Navigator.pop(context);
              }
            },

          ),
          ListTile(
            selected: (NavigationDrawer.pos == 3)? true: false,
            leading: Icon(Icons.backup_table_rounded),
            title: Text('Section',style: TextStyle(
                fontSize: 20
            ),
            ),
            onTap: () {
              if (NavigationDrawer.pos != 3) {
                NavigationDrawer.pos = 3;

                widget.getDrawer(NavigationDrawer.pos);
                Navigator.pop(context);
              }
            },
          ),
        ],
      ),
    );
  }
}
