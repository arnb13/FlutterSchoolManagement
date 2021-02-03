import 'dart:convert';

import 'package:http/http.dart';

class teacherData {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  String url_all_teacher = 'http://10.0.2.2:8000/api/all_teacher';
  String url_delete_teacher = 'http://10.0.2.2:8000/api/delete_teacher';
  String url_update_teacher = 'http://10.0.2.2:8000/api/update_teacher';

  teacherData({this.id, this.firstName, this.lastName, this.email, this.phone});

  factory teacherData.fromJson(Map<String, dynamic> json) {
    return teacherData(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        phone: json['phone']);
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
  Future<bool> updateTeacher(teacherData data) async {
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

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
