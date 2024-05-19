import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/shared/utils/token_handler.dart';

class Topic {
  final String name;
  final String id;
  final bool quizAvailable;
  static List<Topic> listTopic = [];

  Topic({required this.name, required this.id, required this.quizAvailable});

  static getTopic(int id) async {
    listTopic = [];
    final String? tokenJWT = await Token.getToken();
    try {
      final response = await http.post(
        Uri.parse("https://nodejsdeployowl.et.r.appspot.com/topics/${id}"),
        body: jsonEncode({
          "access_token": tokenJWT,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      final bodyResponse = await jsonDecode(response.body)['data'];
      bodyResponse
          .map(
            (data) => listTopic.add(
              Topic(
                name: data['name'].toString(),
                id: data['id'].toString(),
                quizAvailable: data['quizAvailable'],
              ),
            ),
          )
          .toList();
    } catch (e) {
      print(e);
    }
  }
}
