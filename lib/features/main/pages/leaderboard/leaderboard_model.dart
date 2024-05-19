import 'dart:convert';

import 'package:http/http.dart' as http;

class Leaderboard {
  final String img;
  final String name;
  final String level;

  Leaderboard({
    required this.img,
    required this.name,
    required this.level,
  });

  static List<Leaderboard> listLeaderboard = [];

  static getLeaderboard() async {
    listLeaderboard = [];

    final response = await http.get(
      Uri.parse("https://nodejsdeployowl.et.r.appspot.com/leaderboard"),
    );

    final bodyResponse = await jsonDecode(response.body)['data'];
    bodyResponse.map((data) {
      listLeaderboard.add(
        Leaderboard(
          img: data['avatar'].toString(),
          name: data['username'].toString(),
          level: data['level'].toString(),
        ),
      );
    }).toList();
  }
}
