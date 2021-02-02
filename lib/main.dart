

import 'package:flutter/material.dart';


void main(){
  runApp(
      MaterialApp(
    home: MyHomePage(),
  )
  );
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  AnimationController animationController;
  Animation firstAnimation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: Duration(seconds: 3),
        vsync: this
    );
    firstAnimation = Tween(
        begin: 200.0,
        end: 0.0
    ).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Curves.bounceOut
        )
    );

    animationController.addListener(() {setState(() {

    });});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: firstAnimation.value),
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.cyanAccent,

                ),
              )

            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        animationController.forward();
      }),
    );
  }
}




