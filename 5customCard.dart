import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() => runApp(
  MaterialApp(
    home: AnimPage(),
    theme: ThemeData(
      accentColor: Colors.white10
    ),
  )
);

class AnimPage extends StatefulWidget {
  @override
  _AnimPageState createState() => _AnimPageState();
}

class _AnimPageState extends State<AnimPage> {
  List<dynamic> check = [
    {
      "title":"card 1",
      "check" : false,
      "color" : Colors.red,
      "left": 10.0
    },
    {
      "title":"card 1",
      "check" : false,
      "color" : Colors.blue,
      "left": 100.0
    },
    {
      "title":"card 1",
      "check" : false,
      "color" : Colors.pinkAccent,
      "left": 190.0
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 400.0,
              left: MediaQuery.of(context).size.width/5,
              child: Container(
                width: 250.0,
                height: 140.0,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey[400],
                    style: BorderStyle.solid
                  ),
                  borderRadius: BorderRadius.circular(20.0)
                ),
                child: Center(
                  child: Text(
                    "Card",
                    style: TextStyle(
                      color: Colors.grey
                    ),
                  ),
                ),
              ),
            ),
            Stack(
              children: this.check.map((e) => CustomCard(
                left: e['left'],
                colors: e['color'],
              )).toList(),
            )
          ],
        ),
      ),
    );
  }
}

class CustomCard extends StatefulWidget {
  double left;
  Color colors;
  CustomCard({this.left, this.colors});

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool check = false;

  double rotateValue = 0.40;
  double rotateValueMax = 0.40;

  double bottomSpace = 0;
  double bottomSpaceMax = 400.0;
  double leftSpace;

  void bottomSpaceIncrese() async {
    if (this.bottomSpace >= this.bottomSpaceMax) {
      ignoringCheck = false;
      return;
    }

    else{
      leftSpace = MediaQuery.of(context).size.width/5;
      ignoringCheck = true;
      await Future.delayed(Duration(milliseconds: 15),(){})
          .then((_) => this.bottomSpace += 20.0);
      setState(() {});
      bottomSpaceIncrese();
      return;
    }
  }
  void bottomSpaceDecrese() async{
    if(this.bottomSpace <= 0.0){
      ignoringCheck = false;
      return;
    }
    else{
      leftSpace = widget.left;
      ignoringCheck = true;
      await Future.delayed(Duration(milliseconds: 15),(){})
          .then((_) => this.bottomSpace = this.bottomSpace - 20.0);
      setState(() {});
      bottomSpaceDecrese();
      return;
    }
  }
  void cardRotate() async{
    if(this.rotateValue <= 0.2) return;
    else{
      await Future.delayed(Duration(milliseconds: 25),(){})
          .then((_) => this.rotateValue -= 0.1);
      setState(() {});
      cardRotate();

      return;
    }
  }
  void cardRotateReset() async{
    if(this.rotateValue >= this.rotateValueMax) return;
    else{
      await Future.delayed(Duration(milliseconds: 25),(){})
          .then((_) => this.rotateValue += 0.1);
      setState(() {});
      cardRotateReset();
      return;
    }
  }

  bool ignoringCheck = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: leftSpace ?? widget.left,
      bottom: bottomSpace,
      child: Transform.rotate(
        angle: math.pi / rotateValue,
        child: IgnorePointer(
          ignoring: ignoringCheck,
          child: GestureDetector(
            onTap: (){
              check = !check;
              if(check){
                ignoringCheck = true;
                bottomSpaceIncrese();
                this.cardRotate();
              }
              else{
                ignoringCheck = true;
                bottomSpaceDecrese();
                cardRotateReset();
              }
            },

            child: Container(
              width: 250.0,
              height: 140.0,
              decoration: BoxDecoration(
                  color: widget.colors ?? Colors.red,
                  borderRadius: BorderRadius.circular(20.0)
              ),

            ),
          ),
        ),
      ),
    );
  }
}

