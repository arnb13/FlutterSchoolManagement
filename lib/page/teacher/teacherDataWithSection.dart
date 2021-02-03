import 'dart:convert';

import 'package:http/http.dart';

class teacherDataWithSection {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final List sections;

  String url_get_teacher = 'http://10.0.2.2:8000/api/get_teacher';

  teacherDataWithSection(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.sections});

  factory teacherDataWithSection.fromJson(Map<String, dynamic> json) {
    return teacherDataWithSection(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        phone: json['phone'],
        sections: json['section']);
  }

  Future<teacherDataWithSection> getTeacherApi(String email) async {
    Response response = await post(
      url_get_teacher,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email}),
    );

    if (response.statusCode == 200) {
      return teacherDataWithSection(
          id: jsonDecode(response.body)['teacher']['id'],
          firstName: jsonDecode(response.body)['teacher']['first_name'],
          lastName: jsonDecode(response.body)['teacher']['last_name'],
          email: jsonDecode(response.body)['teacher']['email'],
          phone: jsonDecode(response.body)['teacher']['phone'],
          sections: jsonDecode(response.body)['section']);
    } else {
      return null;
    }
  }
}
