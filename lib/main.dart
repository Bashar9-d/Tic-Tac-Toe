import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_courses/splash.dart';
import 'HomePage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PlayerScore(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,home: Splash(),);
  }
}


class PlayerScore with ChangeNotifier {
  List<String> _list = List.generate(9, (_) => "");
  bool _XorO = true;
  int _ps1 = 0;
  int _ps2 = 0;
  int _fillBox = 0;

  List<String> get list => _list;
  bool get XorO => _XorO;
  int get ps1 => _ps1;
  int get ps2 => _ps2;
  int get fillBox => _fillBox;

  void tapped(int index, VoidCallback onWin, VoidCallback onDraw) {
    if (_list[index] == "") {
      _fillBox++;
      _list[index] = _XorO ? "O" : "X";
      if (_checkWinner()) {
        if (_XorO) {
          _ps1++;
        } else {
          _ps2++;
        }
        notifyListeners();
        onWin();
      } else if (_fillBox == 9) {
        onDraw();
      }
      _XorO = !_XorO;
      notifyListeners();
    }
  }

  bool _checkWinner() {
    final l = _list;
    return
      (l[0] == l[1] && l[1] == l[2] && l[0] != "") ||
          (l[3] == l[4] && l[4] == l[5] && l[3] != "") ||
          (l[6] == l[7] && l[7] == l[8] && l[6] != "") ||
          (l[0] == l[3] && l[3] == l[6] && l[0] != "") ||
          (l[1] == l[4] && l[4] == l[7] && l[1] != "") ||
          (l[2] == l[5] && l[5] == l[8] && l[2] != "") ||
          (l[0] == l[4] && l[4] == l[8] && l[0] != "") ||
          (l[2] == l[4] && l[4] == l[6] && l[2] != "");
  }

  String get winner => _XorO ? "O" : "X";

  void clearBoard() {
    _list = List.generate(9, (_) => "");
    _fillBox = 0;
    notifyListeners();
  }
}

