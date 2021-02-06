import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';
import 'package:school_flutter/page/student/studentData.dart';

class AddStudent extends StatefulWidget {
  @override
  AddStudentState createState() => AddStudentState();
}

class AddStudentState extends State<AddStudent> {
  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameCont = TextEditingController();
    TextEditingController lastNameCont = TextEditingController();
    TextEditingController rollCont = TextEditingController();
    TextEditingController emailCont = TextEditingController();
    TextEditingController phoneCont = TextEditingController();

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add New Student',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: firstNameCont,
                keyboardType: TextInputType.name,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  helperText: '',
                  helperStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  hintText: 'First Name',
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
                  helperText: '',
                  helperStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  hintText: 'Last Name',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: rollCont,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  helperText: '',
                  helperStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  hintText: 'Roll',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailCont,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                  helperText: '',
                  helperStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  hintText: 'Email Address',
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
                  helperText: '',
                  helperStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  hintText: 'Phone Number',
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
                      submit(firstNameCont, lastNameCont, rollCont, emailCont,
                          phoneCont, context);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }

  /*
    Submit student data
   */
  void submit(
      TextEditingController firstNameCont,
      TextEditingController lastNameCont,
      TextEditingController rollCont,
      TextEditingController emailCont,
      TextEditingController phoneCont,
      BuildContext context) {
    String firstName = firstNameCont.text;
    String lastName = lastNameCont.text;
    String roll = rollCont.text;
    String email = emailCont.text;
    String phone = phoneCont.text;

    if (firstName.isNotEmpty &&
        lastName.isNotEmpty &&
        roll.isNotEmpty &&
        email.isNotEmpty &&
        phone.isNotEmpty) {
      studentData data = studentData(
          id: 0,
          firstName: firstName,
          lastName: lastName,
          roll: roll,
          email: email,
          phone: phone);
      Future success = studentData().addStudentApi(data);

      success.then((value) {
        Response response = value;
        if (response.statusCode == 200) {
          Fluttertoast.showToast(
            msg: 'New student added successfully',
            backgroundColor: Colors.green[300],
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.black,
          );

          Navigator.pop(context);

          Navigator.pushNamed(context, '/studentProfile', arguments: {
            'roll': roll,
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
        textColor: Colors.black,
      );
    }
  }
}
