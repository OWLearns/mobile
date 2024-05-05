import 'dart:convert';

import 'package:http/http.dart' as http;

class Materials {
  final String id;
  final String topicId;
  final String videoLink;
  final String textDescription;
  final String title;

  static List<Materials> listMaterial = [];

  Materials({
    required this.id,
    required this.topicId,
    required this.videoLink,
    required this.textDescription,
    required this.title,
  });

  static getMaterial(List<String> topic) async {
    listMaterial = [];

    for (var topicData in topic) {
      final response = await http.get(
        Uri.parse(
          "https://nodejsdeployowl.et.r.appspot.com/materials/$topicData",
        ),
      );

      final bodyResponse = await jsonDecode(response.body)['data'];

      bodyResponse.map((materialData) {
        listMaterial.add(
          Materials(
            id: materialData['id'].toString(),
            topicId: materialData['topic_id'].toString(),
            videoLink: materialData['yt_link'].toString(),
            textDescription: materialData['description'].toString(),
            title: materialData['title'].toString(),
          ),
        );
      }).toList();
    }
  }
}
