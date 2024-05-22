import 'dart:convert';
import 'package:http/http.dart' as http;

class Course {
  final int id;
  final String name;
  final String desc;
  final String image;
  final int topic;

  static List<Course> listCourse = [];

  Course({
    required this.id,
    required this.name,
    required this.desc,
    required this.image,
    required this.topic,
  });

  static getCourse() async {
    List<Course> tempListCourse = [];
    final response = await http.get(
      Uri.parse("https://nodejsdeployowl.et.r.appspot.com/courses"),
    );

    if (response.statusCode == 200) {
      final List bodyResponse = jsonDecode(response.body)['data'];
      bodyResponse
          .map(
            (data) => tempListCourse.add(
              Course(
                id: data['id'],
                name: data['name'],
                desc: data['description'],
                image: data['image'],
                topic: data['total_topics'],
              ),
            ),
          )
          .toList();

      listCourse = tempListCourse;
    }
  }
}
