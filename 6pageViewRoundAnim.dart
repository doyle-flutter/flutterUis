import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter/services.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      home: PageViewMain(),
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      showSemanticsDebugger: false,
      theme: ThemeData(
        accentColor: Colors.white10,
      ),
    )
  );
}

class PageViewMain extends StatefulWidget {
  @override
  _PageViewMainState createState() => _PageViewMainState();
}

class _PageViewMainState extends State<PageViewMain> {


  List<Widget> viewPages = [
    new Ads1Page(),
    new Ads2Page(),
    new Ads3Page(),
  ];

  int currentPageIndex = 0;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarBrightness: Brightness.dark)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              child: PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: this.viewPages.length,
                onPageChanged: (int index) => setState((){this.currentPageIndex = index;}),
                itemBuilder: (BuildContext context, int index) => this.viewPages[index],
              ),
            ),
            Positioned(
              right: 20.0,
              bottom: 60.0,
              child: Container(
                child: Column(
                  children: this.viewPages.map(
                    (e) => Container(
                      margin: EdgeInsets.all(5.0),
                      child: this.currentPageIndex == this.viewPages.indexOf(e)
                      ? Icon(
                          Icons.brightness_1,
                          size: 10,
                          color: Colors.yellow[300],
                        )
                      : Icon(
                          Icons.brightness_1,
                          size: 6,
                          color: Colors.grey[300],
                        )
                    )
                  ).toList(),
                ),
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: Colors.white10
                      ),
                      child: IconButton(
                        icon: Icon(Icons.send),
                        color: Colors.white,
                        onPressed: (){},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: Colors.white10
                      ),
                      child: IconButton(
                        icon: Icon(Icons.email),
                        color: Colors.white,
                        onPressed: (){},
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: Colors.white10
                      ),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt),
                        color: Colors.white,
                        onPressed: (){},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Ads1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: "https://cdn.pixabay.com/photo/2019/04/11/13/38/myeongdong-4119806__480.jpg",
      imageBuilder: (BuildContext context, imgProvider) => Container(
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
            image: imgProvider,
            colorFilter: ColorFilter.mode(Colors.black54, BlendMode.overlay),
            fit: BoxFit.cover
          )
        ),
      ),
    );
  }
}


class Ads2Page extends StatefulWidget {
  @override
  _Ads2PageState createState() => _Ads2PageState();
}

class _Ads2PageState extends State<Ads2Page> {

  Color changeColor1 = Colors.white;
  Color changeColor2 = Colors.white;
  Color changeColor3 = Colors.white;
  Color changeColor4 = Colors.white;

  double changeWidth1 = 0;
  double changeWidth2 = 0;
  double changeWidth3 = 0;
  double changeWidth4 = 0;

  double changeOp1 = 0;
  double changeOp2 = 0;
  double changeOp3 = 0;
  double changeOp4 = 0;

  Future<Color> randomColor() async{
    int i = math.Random.secure().nextInt(4);
    switch(i){
      case 0: return Colors.red; break;
      case 1: return Colors.blue; break;
      case 2: return Colors.yellowAccent; break;
      case 3: return Colors.deepPurple; break;
    }
  }

  Future<double> outIn() async{
    int i = math.Random.secure().nextInt(4);
    switch(i){
      case 0: return 0.45; break;
      case 1: return 0.40; break;
      case 2: return 0.35; break;
      case 3: return 0.30; break;
    }
  }

  Future<double> outInOp() async{
    int i = math.Random.secure().nextInt(4);
    switch(i){
      case 0: return 0.3; break;
      case 1: return 0.5; break;
      case 2: return 0.7; break;
      case 3: return 0.1; break;
    }
  }

  Timer animPlay;

  @override
  void initState() {
    animPlay = Timer.periodic(Duration(milliseconds: 300), (timer) async{
      changeColor1 = await randomColor();
      changeColor2 = await randomColor();
      changeColor3 = await randomColor();
      changeColor4 = await randomColor();

      changeWidth1 = await outIn();
      changeWidth2 = await outIn();
      changeWidth3 = await outIn();
      changeWidth4 = await outIn();

      changeOp1 = await outInOp();
      changeOp2 = await outInOp();
      changeOp3 = await outInOp();
      changeOp4 = await outInOp();
      if(mounted){
        setState(() {});
        return;
      }

    });
    super.initState();
  }

  @override
  void dispose() {
    this.animPlay?.cancel();
    this.animPlay = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width*0.50,
          height: MediaQuery.of(context).size.width*0.50,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                child: Opacity(
                  opacity: this.changeOp1,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: this.changeColor1,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MediaQuery.of(context).size.width*0.50),
                        bottomLeft: Radius.circular(MediaQuery.of(context).size.width * this.changeWidth1),
                        bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.50),
                        topRight: Radius.circular(MediaQuery.of(context).size.width*0.50),
                      )
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                child: Opacity(
                  opacity: this.changeOp2,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: this.changeColor2,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MediaQuery.of(context).size.width * this.changeWidth2),
                        bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.50),
                        bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.50),
                        topRight: Radius.circular(MediaQuery.of(context).size.width*0.50),
                      )
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                child: Opacity(
                  opacity: this.changeOp3,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: this.changeColor3,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MediaQuery.of(context).size.width*0.50),
                        bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.50),
                        bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.50),
                        topRight: Radius.circular(MediaQuery.of(context).size.width * this.changeWidth3),
                      )
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                child: Opacity(
                  opacity: this.changeOp4,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      color: this.changeColor4,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MediaQuery.of(context).size.width*0.50),
                        bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.50),
                        bottomRight: Radius.circular(MediaQuery.of(context).size.width * this.changeWidth4),
                        topRight: Radius.circular(MediaQuery.of(context).size.width*0.50),
                      )
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                child: Transform.rotate(
                  angle: math.pi / 0.30,
                  child: Opacity(
                    opacity: this.changeOp1,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: this.changeColor1,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(MediaQuery.of(context).size.width*0.50),
                          bottomLeft: Radius.circular(MediaQuery.of(context).size.width * this.changeWidth1),
                          bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.50),
                          topRight: Radius.circular(MediaQuery.of(context).size.width*0.50),
                        )
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                child: Transform.rotate(
                  angle: math.pi / 1.20,
                  child: Opacity(
                    opacity: this.changeOp1,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: this.changeColor1,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(MediaQuery.of(context).size.width*0.50),
                          bottomLeft: Radius.circular(MediaQuery.of(context).size.width * this.changeWidth1),
                          bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.50),
                          topRight: Radius.circular(MediaQuery.of(context).size.width*0.50),
                        )
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                child: Transform.rotate(
                  angle: math.pi / 1.50,
                  child: Opacity(
                    opacity: this.changeOp2,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: this.changeColor2,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(MediaQuery.of(context).size.width*0.50),
                          bottomLeft: Radius.circular(MediaQuery.of(context).size.width * this.changeWidth2),
                          bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.50),
                          topRight: Radius.circular(MediaQuery.of(context).size.width*0.50),
                        )
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                child: Transform.rotate(
                  angle: math.pi / 1.650,
                  child: Opacity(
                    opacity: this.changeOp3,
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: this.changeColor3,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(MediaQuery.of(context).size.width*0.50),
                          bottomLeft: Radius.circular(MediaQuery.of(context).size.width * this.changeWidth3),
                          bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.50),
                          topRight: Radius.circular(MediaQuery.of(context).size.width*0.50),
                        )
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                right: 0,
                child: Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(MediaQuery.of(context).size.width*0.50),
                      bottomLeft: Radius.circular(MediaQuery.of(context).size.width*0.50),
                      bottomRight: Radius.circular(MediaQuery.of(context).size.width*0.50),
                      topRight: Radius.circular(MediaQuery.of(context).size.width*0.50),
                    )
                  ),
                  child: Center(
                    child: Text(
                      "Jamesssss",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: this.changeColor1
                      ),
                    ),
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

class Ads3Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: CachedNetworkImage(
        imageUrl: "https://cdn.pixabay.com/photo/2016/12/18/19/33/tourism-1916633__340.jpg",
        colorBlendMode: BlendMode.xor,
        color: Colors.black38,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}



