import 'dart:convert';
import 'package:http/http.dart' as http;

class Course {
  final int id;
  final String name;
  final String desc;

  static List<Course> listCourse = [];

  Course({required this.id, required this.name, required this.desc});

  static getCourse() async {
    listCourse = [];
    final response = await http.get(
      Uri.parse("https://nodejsdeployowl.et.r.appspot.com/courses"),
    );

    if (response.statusCode == 200) {
      final List bodyResponse = jsonDecode(response.body)['data'];
      bodyResponse
          .map(
            (data) => listCourse.add(
              Course(
                id: data['id'],
                name: data['name'],
                desc: data['description'],
              ),
            ),
          )
          .toList();

      return true;
    }
  }
}
