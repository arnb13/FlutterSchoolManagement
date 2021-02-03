import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:school_flutter/page/teacher/teacherData.dart';

class Teacher extends StatefulWidget {
  Teacher({
    Key key,
  }) : super(key: key);

  @override
  _TeacherState createState() => _TeacherState();
}

class _TeacherState extends State<Teacher> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<teacherData>>(
        future: teacherData().allTeacherApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    title: Text(
                      '${snapshot.data[index].firstName}' +
                          ' ' +
                          '${snapshot.data[index].lastName}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(snapshot.data[index].email),
                    tileColor: Colors.blueGrey[100],
                    onTap: () async {
                      await Navigator.pushNamed(context, '/teacherProfile',
                          arguments: {'email': snapshot.data[index].email});
                      refreshData();
                    },
                  ),
                );
              },
            );
          } else {
            return SpinKitFadingCircle(
              color: Colors.black,
              size: 70,
            );
          }
        });
  }

  void refreshData() {
    setState(() {});
  }
}
