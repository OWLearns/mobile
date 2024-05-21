import 'dart:convert';

import 'package:http/http.dart' as http;

class Leaderboard {
  final String img;
  final String name;
  final int level;

  Leaderboard({
    required this.img,
    required this.name,
    required this.level,
  });

  static List<Leaderboard> listLeaderboard = [];

  static getLeaderboard() async {
    List<Leaderboard> tempListLeaderboard = [];

    final response = await http.get(
      Uri.parse("https://nodejsdeployowl.et.r.appspot.com/leaderboard"),
    );

    final bodyResponse = await jsonDecode(response.body)['data'];
    bodyResponse.map((data) {
      tempListLeaderboard.add(
        Leaderboard(
          img: data['avatar'].toString(),
          name: data['username'].toString(),
          level: (data['exp'] ~/ 100 + 1),
        ),
      );
    }).toList();

    listLeaderboard = tempListLeaderboard;
  }
}
