import 'dart:convert';

import 'package:http/http.dart' as http;

class Topic {
  final String name;
  final String id;
  static List<Topic> listTopic = [];

  Topic({required this.name, required this.id});

  static getTopic(int id) async {
    listTopic = [];
    final response = await http.get(
      Uri.parse("https://nodejsdeployowl.et.r.appspot.com/topics/${id}"),
    );

    if (response.statusCode == 200) {
      final bodyResponse = await jsonDecode(response.body)['data'];
      print(bodyResponse);
      bodyResponse
          .map(
            (data) => listTopic.add(
              Topic(
                name: data['name'].toString(),
                id: data['id'].toString(),
              ),
            ),
          )
          .toList();

      // return true;
    }
  }
}
