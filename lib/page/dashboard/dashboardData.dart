import 'dart:convert';
import 'package:http/http.dart';

class dashboardData {
  final String student;
  final String teacher;
  final String section;
  final String totalSeat;
  final String bookedSeat;
  final String availableSeat;

  String url = 'http://10.0.2.2:8000/api/get_stat';

  dashboardData({
   this.student,
   this.teacher,
   this.section,
   this.totalSeat,
   this.bookedSeat,
   this.availableSeat
});

  factory dashboardData.fromJson(Map<String, dynamic> json) {
    return dashboardData(
      student: json['total_student'].toString(),
      teacher: json['total_teacher'].toString(),
      section: json['total_section'].toString(),
      totalSeat: json['total_seat'].toString(),
      bookedSeat: json['booked_seat'].toString(),
      availableSeat: json['available_seat'].toString()

    );
  }

  Future<dashboardData> dashboardApi() async {
    Response response = await get(url);

    if(response.statusCode == 200) {
      return dashboardData.fromJson(jsonDecode(response.body));

    } else {
      return null;

    }
  }

}