import 'dart:convert';

import 'package:http/http.dart';

class studentData {
  final int id;
  final String firstName;
  final String lastName;
  final String roll;
  final String email;
  final String phone;

  String url_all_student = 'http://10.0.2.2:8000/api/all_student';
  String url_update_student = 'http://10.0.2.2:8000/api/update_student';
  String url_add_student = 'http://10.0.2.2:8000/api/add_student';
  String url_delete_student = 'http://10.0.2.2:8000/api/delete_student';

  studentData(
      {this.id,
      this.firstName,
      this.lastName,
      this.roll,
      this.email,
      this.phone});

  factory studentData.fromJson(Map<String, dynamic> json) {
    return studentData(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        roll: json['roll'],
        email: json['email'],
        phone: json['phone']);
  }

  /*
    Add new student
  */

  Future<List<studentData>> allStudentApi() async {
    Response response = await get(url_all_student);

    if (response.statusCode == 200) {
      Iterable iterable = jsonDecode(response.body);
      return iterable.map((e) => studentData.fromJson(e)).toList();
    } else {
      return null;
    }
  }

  /*
    Update existing student profile. can not update roll. roll unique.
  */

  Future<Response> updateStudentApi(studentData data) async {
    Response response = await post(
      url_update_student,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'first_name': data.firstName,
        'last_name': data.lastName,
        'roll': data.roll,
        'email': data.email,
        'phone': data.phone
      }),
    );

    return response;
  }

  /*
    Add new student
  */

  Future<Response> addStudentApi(studentData data) async {
    Response response = await post(
      url_add_student,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'first_name': data.firstName,
        'last_name': data.lastName,
        'roll': data.roll,
        'email': data.email,
        'phone': data.phone
      }),
    );

    return response;
  }

  /*
    Delete a student. Param = roll, return bool success
  */

  Future<bool> deleteStudentApi(String roll) async {
    Response response = await post(
      url_delete_student,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'roll': roll,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
