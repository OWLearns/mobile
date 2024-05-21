import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/shared/utils/token_handler.dart';

class Materials {
  final String id;
  final String topicId;
  final String videoLink;
  final String textDescription;
  final String title;
  final bool completed;

  static List<Materials> listMaterial = [];

  Materials({
    required this.id,
    required this.topicId,
    required this.videoLink,
    required this.textDescription,
    required this.title,
    required this.completed,
  });

  static getMaterial(List<String> topic) async {
    listMaterial = [];
    final jwt = await Token.getToken();
    for (var topicData in topic) {
      final response = await http.post(
          Uri.parse(
            "https://nodejsdeployowl.et.r.appspot.com/materials",
          ),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            'access_token': jwt,
            'topic_id': topicData,
          }));

      final bodyResponse = await jsonDecode(response.body)['data'];

      bodyResponse.map((materialData) {
        listMaterial.add(
          Materials(
            id: materialData['id'].toString(),
            topicId: materialData['topic_id'].toString(),
            videoLink: materialData['yt_link'].toString(),
            textDescription: materialData['description'].toString(),
            title: materialData['title'].toString(),
            completed: materialData['completed'],
          ),
        );
      }).toList();
    }

    listMaterial.sort((a, b) => a.id.compareTo(b.id));
  }

  static completeMaterial(String id) async {
    final jwt = await Token.getToken();
    final response = await http.post(
      Uri.parse(
        "https://nodejsdeployowl.et.r.appspot.com/materialCompleted",
      ),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'access_token': jwt,
        'materials_id': id,
      }),
    );

    print(response.body);
  }
}
