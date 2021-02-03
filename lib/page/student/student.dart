import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:school_flutter/page/student/studentData.dart';

class Student extends StatefulWidget {
  Student({
    Key key,
  }) : super(key: key);

  @override
  StudentState createState() => StudentState();
}

class StudentState extends State<Student> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<studentData>>(
        future: studentData().allStudentApi(),
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
                    subtitle: Text('Roll: ${snapshot.data[index].roll}'),
                    tileColor: Colors.blueGrey[100],
                    onTap: () async {
                      await Navigator.pushNamed(context, '/studentProfile',
                          arguments: {
                            'roll': snapshot.data[index].roll,
                          });
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
