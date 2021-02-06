import 'dart:convert';

import 'package:http/http.dart';

class teacherData {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final List sections;

  String url_all_teacher = 'http://10.0.2.2:8000/api/all_teacher';
  String url_delete_teacher = 'http://10.0.2.2:8000/api/delete_teacher';
  String url_update_teacher = 'http://10.0.2.2:8000/api/update_teacher';
  String url_get_teacher = 'http://10.0.2.2:8000/api/get_teacher';
  String url_add_teacher = 'http://10.0.2.2:8000/api/add_teacher';

  teacherData(
      {this.id,
      this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.sections});

  factory teacherData.fromJson(Map<String, dynamic> json) {
    return teacherData(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        phone: json['phone'],
        sections: json['section']);
  }

  /*
    Show all teacher in Teacher tab
  */
  Future<List<teacherData>> allTeacherApi() async {
    Response response = await get(url_all_teacher);

    if (response.statusCode == 200) {
      Iterable iterable = jsonDecode(response.body);
      return iterable.map((json) => teacherData.fromJson(json)).toList();
    } else {
      return null;
    }
  }

  /*
    Delete teacher. param email. return success bool
  */
  Future<bool> deleteTeacherApi(String email) async {
    Response response = await post(
      url_delete_teacher,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  /*
    update teacher. return success bool. email unique
  */
  Future<Response> updateTeacher(teacherData data) async {
    Response response = await post(
      url_update_teacher,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'first_name': data.firstName,
        'last_name': data.lastName,
        'email': data.email,
        'phone': data.phone
      }),
    );

    return response;
  }

  /*
    Get teacher profile and sections by email
   */
  Future<teacherData> getTeacherApi(String email) async {
    Response response = await post(
      url_get_teacher,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{'email': email}),
    );

    if (response.statusCode == 200) {
      return teacherData(
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

  /*
    Add new teacher. Email unique
   */
  Future<Response> addTeacherApi(teacherData data) async {
    Response response = await post(
      url_add_teacher,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'first_name': data.firstName,
        'last_name': data.lastName,
        'email': data.email,
        'phone': data.phone
      }),
    );

    return response;
  }
}
