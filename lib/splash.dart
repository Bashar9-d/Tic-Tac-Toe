
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';


import 'HomePage.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff00061a),
      body:Center(child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
        Text("Tic Tac Toe",style: TextStyle(color: Colors.white,fontSize: 50),),
        AvatarGlow(child: Image.asset("assets/tictactoelogo.png",height: 200,width: 200,), ),
        Text(
              "@Created By Bashar",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
        FilledButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));},style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white),), child: Text("Start Game",style: TextStyle(color: Colors.black,fontSize: 30),),)
      ]),)
    );
  }
}
