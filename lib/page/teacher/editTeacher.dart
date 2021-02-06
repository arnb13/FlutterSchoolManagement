import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:school_flutter/page/teacher/teacherData.dart';

class EditTeacher extends StatefulWidget {
  @override
  _EditTeacherState createState() => _EditTeacherState();
}

class _EditTeacherState extends State<EditTeacher> {
  static String firstName;
  static String lastName;
  static String email;
  static String phone;

  @override
  Widget build(BuildContext context) {
    final Map map = ModalRoute.of(context).settings.arguments;
    firstName = map['firstName'];
    lastName = map['lastName'];
    email = map['email'];
    phone = map['phone'];

    TextEditingController firstNameCont = TextEditingController()
      ..text = firstName;
    TextEditingController lastNameCont = TextEditingController()
      ..text = lastName;
    TextEditingController phoneCont = TextEditingController()..text = phone;

    /*
        Edit Teacher profile. NO EMAIL UPDATE. email must be unique
     */
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.teal),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Edit Teacher',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: firstNameCont,
                keyboardType: TextInputType.name,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  helperText: 'First Name',
                  helperStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  hintText: 'First Name',
                  errorText: (firstName.length == 0)
                      ? 'First Name can not be empty'
                      : null,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: lastNameCont,
                keyboardType: TextInputType.name,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  helperText: 'Last Name',
                  helperStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  hintText: 'Last Name',
                  errorText: (lastName.length == 0)
                      ? 'Last Name can not be empty'
                      : null,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: phoneCont,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  helperText: 'Phone',
                  helperStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  hintText: 'Phone Number',
                  errorText: (phone.length == 0)
                      ? 'Phone number can not be empty'
                      : null,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Align(
                alignment: Alignment.center,
                child: RaisedButton(
                    child: Text('Submit'),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    color: Colors.teal,
                    onPressed: () {
                      submit(firstNameCont, lastNameCont, phoneCont, context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  /*
  Submit form. call api
   */
  void submit(
      TextEditingController firstNameCont,
      TextEditingController lastNameCont,
      TextEditingController phoneCont,
      BuildContext context) {
    firstName = firstNameCont.text;
    lastName = lastNameCont.text;
    phone = phoneCont.text;

    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        email.isNotEmpty &&
        phone.isNotEmpty) {
      teacherData data = teacherData(
          id: 0,
          firstName: firstName,
          lastName: lastName,
          email: email,
          phone: phone);

      Future success = teacherData().updateTeacher(data);

      success.then((value) {
        Response response = value;
        if (response.statusCode == 200) {
          Fluttertoast.showToast(
            msg: 'Teacher info updated!',
            backgroundColor: Colors.green[300],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.black,
          );

          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.pushNamed(context, '/teacherProfile', arguments: {
            'email': email,
          });
        } else {
          Fluttertoast.showToast(
            msg: jsonDecode(response.body)['status'],
            backgroundColor: Colors.red[300],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.black,
          );
        }
      });
    } else {
      Fluttertoast.showToast(
        msg: 'Please fill up all fields',
        backgroundColor: Colors.red[300],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
    }
  }
}
