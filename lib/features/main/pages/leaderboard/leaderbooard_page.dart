import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/color.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: owlBase,
      body: Text('Leaderboard'),
    );
  }
}
