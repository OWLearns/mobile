import 'package:flutter/material.dart';
import 'package:mobile/features/main/pages/leaderboard/leaderboard_model.dart';
import 'package:mobile/shared/themes/color.dart';

class LeaderboardPage extends StatefulWidget {
  const LeaderboardPage({super.key});

  @override
  State<LeaderboardPage> createState() => _LeaderboardPageState();
}

class _LeaderboardPageState extends State<LeaderboardPage> {
  @override
  void initState() {
    super.initState();
    Leaderboard.getLeaderboard().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

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
              ...Leaderboard.listLeaderboard.asMap().entries.map((entry) {
                int index = entry.key;
                var e = entry.value;
                return dataLeaderboard(index + 1, e.img, e.name, e.level);
              }).toList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget dataLeaderboard(int rank, String img, String name, String level) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
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
                child: Text(rank.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    )),
              ),
              Expanded(
                flex: 2,
                child: Image.network(
                  img,
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
      ),
    );
  }
}
