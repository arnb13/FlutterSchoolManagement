import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:school_flutter/navigation_drawer/navigationDrawer.dart';
import 'package:school_flutter/page/dashboard/dashboard.dart';
import 'package:school_flutter/page/section/section.dart';
import 'package:school_flutter/page/student/addStudent.dart';
import 'package:school_flutter/page/student/editProfile.dart';
import 'package:school_flutter/page/student/student.dart';
import 'package:school_flutter/page/student/studentProfile.dart';
import 'package:school_flutter/page/teacher/editTeacher.dart';
import 'package:school_flutter/page/teacher/teacher.dart';
import 'package:school_flutter/page/teacher/teacherProfile.dart';

void main() {
  runApp(MyApp());
  //runApp(MyStatefulWidget());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //initialRoute: '/dashboard',
      routes: {
        '/dashboard': (context) => Dashboard(),
        '/student': (context) => Student(),
        '/teacher': (context) => Teacher(),
        '/section': (context) => Section(),
        '/studentProfile': (context) => StudentProfile(),
        '/editProfile': (context) => EditProfile(),
        '/addStudent': (context) => AddStudent(),
        '/teacherProfile': (context) => TeacherProfile(),
        '/editTeacher': (context) => EditTeacher(),
      },
      title: 'School',
      theme: ThemeData(primaryColor: Colors.teal),

      home: MyHomeStateful(),
    );
  }
}

class MyHomeStateful extends StatefulWidget {
  @override
  _MyHomeStatefulState createState() => _MyHomeStatefulState();
}

class _MyHomeStatefulState extends State<MyHomeStateful> {
  GlobalKey<StudentState> _globalKey = GlobalKey();

  int pos = 0;
  bool fab = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavigationDrawer(
          getDrawer: drawerPos,
          pos: pos,
        ),
        appBar: AppBar(
          title: Text(
            'School Management',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: getView(),
        floatingActionButton: getFab());
  }

  drawerPos(int pos) {
    setState(() {
      this.pos = pos;
    });
  }

  getView() {
    int pos = this.pos;
    print(pos);
    if (pos == 0) {
      return Dashboard();
    } else if (pos == 1) {
      return Student(key: _globalKey);
    } else if (pos == 2) {
      return Teacher();
    } else if (pos == 3) {
      return Section();
    }
  }

  getFab() {
    int pos = this.pos;
    if (pos == 1) {
      return FloatingActionButton(
          backgroundColor: Colors.teal,
          child: Icon(
            Icons.group_add_outlined,
            color: Colors.black,
          ),
          onPressed: () async {
            await Navigator.pushNamed(context, '/addStudent');
            // call it to refresh your data
            _globalKey.currentState.refreshData();
          });
    } else if (pos == 2) {
      return FloatingActionButton(
          backgroundColor: Colors.teal,
          child: Icon(
            Icons.person_add_alt_1_outlined,
            color: Colors.black,
          ),
          onPressed: () {});
    } else if (pos == 3) {
      return FloatingActionButton(
          backgroundColor: Colors.teal,
          child: Icon(
            Icons.addchart_rounded,
            color: Colors.black,
          ),
          onPressed: () {});
    } else {
      return null;
    }
  }
}
