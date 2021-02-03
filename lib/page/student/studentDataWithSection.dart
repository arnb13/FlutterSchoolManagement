import 'dart:convert';

import 'package:http/http.dart';

class studentDataWithSection {
  final int id;
  final String firstName;
  final String lastName;
  final String roll;
  final String email;
  final String phone;
  final List sections;

  String url_get_student = 'http://10.0.2.2:8000/api/get_student';

  studentDataWithSection(
      {this.id,
      this.firstName,
      this.lastName,
      this.roll,
      this.email,
      this.phone,
      this.sections});

  factory studentDataWithSection.fromJson(Map<String, dynamic> json) {
    return studentDataWithSection(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        roll: json['roll'],
        email: json['email'],
        phone: json['phone'],
        sections: json['section']);
  }

  Future<studentDataWithSection> studentDataWithSectionApi(String roll) async {
    Response response = await post(
      url_get_student,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'roll': roll}),
    );

    if (response.statusCode == 200) {
      return studentDataWithSection(
          id: jsonDecode(response.body)['student']['id'],
          firstName: jsonDecode(response.body)['student']['first_name'],
          lastName: jsonDecode(response.body)['student']['last_name'],
          roll: jsonDecode(response.body)['student']['roll'],
          email: jsonDecode(response.body)['student']['email'],
          phone: jsonDecode(response.body)['student']['phone'],
          sections: jsonDecode(response.body)['section']);
    } else {
      return null;
    }
  }
}
