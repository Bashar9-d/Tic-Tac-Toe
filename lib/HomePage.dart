import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final score = Provider.of<PlayerScore>(context);
    return Scaffold(
      backgroundColor: const Color(0xff00061a),
      body: Column(
        children: [
          const SizedBox(height: 50),
          Expanded(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  playerScore("O", score.ps1),
                  playerScore("X", score.ps2),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Consumer<PlayerScore>(
                  builder: (context, score, child) {
                    return GestureDetector(
                      onTap: () {
                        score.tapped(
                          index,
                          () {
                            _showWinDialog(context, score.winner);
                          },
                          () {
                            _showDrawDialog(context);
                          },
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: const Color(0xff001554),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Center(
                          child: Text(
                            score.list[index],
                            style: TextStyle(
                              color:
                                  score.list[index] == "X"
                                      ? const Color(0xffdf1f7b)
                                      : const Color(0xff2197f8),
                              fontSize: 50,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: InkWell(
              onTap: () {
               launchUrl( Uri.parse(
                  "https://www.linkedin.com/in/bashar-shaqour-320b922a7/",
                ));
              },
              child: Text(
                "@Created By Bashar",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget playerScore(String player, int ps) {
    return Column(
      children: [
        Text(
          "Player $player",
          style: const TextStyle(color: Colors.white, fontSize: 40),
        ),
        Text("$ps", style: const TextStyle(color: Colors.white, fontSize: 35)),
      ],
    );
  }

  void _showWinDialog(BuildContext context, String winner) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Winner is: $winner"),
          actions: [
            FilledButton(
              onPressed: () {
                Provider.of<PlayerScore>(context, listen: false).clearBoard();
                Navigator.of(context).pop();
              },
              child: const Text("Play Again"),
            ),
          ],
        );
      },
    );
  }

  void _showDrawDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Draw"),
          actions: [
            FilledButton(
              onPressed: () {
                Provider.of<PlayerScore>(context, listen: false).clearBoard();
                Navigator.of(context).pop();
              },
              child: const Text("Play Again"),
            ),
          ],
        );
      },
    );
  }
}
