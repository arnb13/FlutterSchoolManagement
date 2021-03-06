import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:school_flutter/page/teacher/teacherData.dart';

class TeacherProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map map = ModalRoute.of(context).settings.arguments;
    String firstName = '';
    String lastName = '';
    String email = map['email'];
    String phone = '';
    List sections;

    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.teal),
      home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Teacher Profile',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
          body: FutureBuilder<teacherData>(
            future: teacherData().getTeacherApi(email),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                firstName = snapshot.data.firstName;
                lastName = snapshot.data.lastName;
                email = snapshot.data.email;
                phone = snapshot.data.phone;
                sections = snapshot.data.sections;

                return Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'First Name: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        snapshot.data.firstName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        color: Colors.black12,
                        thickness: 3,
                        height: 20,
                      ),
                      Text(
                        'Last Name: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        snapshot.data.lastName,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        color: Colors.black12,
                        thickness: 3,
                        height: 20,
                      ),
                      Text(
                        'Email: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        snapshot.data.email,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(
                        color: Colors.black12,
                        thickness: 3,
                        height: 20,
                      ),
                      Text(
                        'Phone: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        snapshot.data.phone,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          //fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return SpinKitFadingCircle(
                  color: Colors.black,
                  size: 70,
                );
              }
            },
          ),
          floatingActionButton: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: null,
                child: Icon(
                  Icons.edit_rounded,
                  color: Colors.black,
                ),
                backgroundColor: Colors.teal,
                onPressed: () {
                  Navigator.pushNamed(context, '/editTeacher', arguments: {
                    'firstName': firstName,
                    'lastName': lastName,
                    'email': email,
                    'phone': phone,
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              FloatingActionButton(
                heroTag: null,
                child: Icon(
                  Icons.delete_forever,
                  color: Colors.red[800],
                ),
                backgroundColor: Colors.teal,
                onPressed: () {
                  AlertDialog alert = AlertDialog(
                    title: Text(
                      'Warning!',
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    content: Text(
                      'Are you sure you want to delete?',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    actions: [
                      FlatButton(
                        child: Text('Dismiss'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text('Confirm'),
                        onPressed: () {
                          deleteTeacher(email, context);
                        },
                      ),
                    ],
                  );

                  showDialog(
                    context: context,
                    builder: (_) => alert,
                    barrierDismissible: true,
                  );
                },
              ),
            ],
          )),
    );
  }

  void deleteTeacher(String email, BuildContext context) {
    teacherData().deleteTeacherApi(email).then((value) {
      if (value) {
        Navigator.of(context).pop();
        Navigator.of(context).pop();

        Fluttertoast.showToast(
          msg: 'student deleted successfully!',
          backgroundColor: Colors.green[100],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.black,
        );
      } else {
        Navigator.of(context).pop();

        Fluttertoast.showToast(
          msg: 'Student was not deleted!',
          backgroundColor: Colors.red[100],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          textColor: Colors.black,
        );
      }
    });
  }
}
