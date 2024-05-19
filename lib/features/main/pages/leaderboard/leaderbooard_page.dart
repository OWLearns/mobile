import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/color.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: owlBase,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const Text(
                'Leaderboard',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              dataLeaderboard("1", "sophia.png", "Sophia Anderson", "5"),
              const SizedBox(height: 8),
              dataLeaderboard("2", "sophia.png", "John Doe", "3"),
              const SizedBox(height: 8),
              dataLeaderboard("3", "sophia.png", "Abigain Davis", "2"),
            ],
          ),
        ),
      ),
    );
  }

  Widget dataLeaderboard(String rank, String img, String name, String level) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Color(0xff606DD9), Color(0xff387ADF)]),
          borderRadius: BorderRadius.circular(7)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 13),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Text(rank,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  )),
            ),
            Expanded(
              flex: 2,
              child: Image.asset(
                "assets/$img",
                width: 35,
                height: 35,
              ),
            ),
            Expanded(
              flex: 6,
              child: Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                "Level $level",
                textAlign: TextAlign.end,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
