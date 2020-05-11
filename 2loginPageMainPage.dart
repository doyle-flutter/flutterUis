// 패키지 : https://pub.dev/packages/cached_network_image

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: LoginTwo(),
    theme: ThemeData(
      accentColor: Colors.white10
    ),
  )
);

// 로그인 화면

class LoginTwo extends StatelessWidget {

  TextStyle titleTxtStyle = TextStyle(
    color: Colors.white,
    fontSize: 42.0,
    fontWeight: FontWeight.bold
  );
  TextStyle subTitleTxtStyle = TextStyle(
      color: Colors.white,
      fontSize: 22.0
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: CachedNetworkImage(
                  imageUrl: "https://cdn.pixabay.com/photo/2016/11/21/11/17/beautiful-1844729__480.jpg",
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 55.0,
                left: 30.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      child: Text("subTitle",style: subTitleTxtStyle,),
                    ),
                    Text("TitleTitleTitle\nTitleTitle",style: titleTxtStyle,),
                  ],
                ),
              ),
              Positioned(
                bottom: 50.0,
                left: 20.0,
                right: 20.0,
                height: 200.0,
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      MaterialButton(
                        minWidth: MediaQuery.of(context).size.width/2,
                        child: Text("Sign In",style: TextStyle(color: Colors.white),),
                        color: Colors.grey[900],
                        elevation: 0,
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MainPage()
                          )
                        ),
                      ),
                      MaterialButton(
                        child: Text("Sign Up",style: TextStyle(color: Colors.white),),
                        minWidth: MediaQuery.of(context).size.width/2,
                        color: Colors.grey[850],
                        onPressed: (){},
                      ),
                      GestureDetector(
                        child: Text("Forget ...",style: TextStyle(color: Colors.white),),
                      )
                    ],
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


// 메인 화면

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List data = [
    {
      "title" : "TITLE 1\nsub title sub title 1",
      "img" : "https://cdn.pixabay.com/photo/2020/02/28/09/27/fashion-4886956__480.jpg",
      "des" : "DESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDES",
    },
    {
      "title" : "TITLE 2\nsub title sub title 2",
      "img" : "https://cdn.pixabay.com/photo/2017/05/13/12/40/fashion-2309519__480.jpg",
      "des" : "DESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDES",
    },
    {
      "title" : "TITLE 3\nsub title sub title 3",
      "img" : "https://cdn.pixabay.com/photo/2018/05/06/03/39/woman-3377839__480.jpg",
      "des" : "DESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDESDES",
    }
  ];

  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                Container(
                  height: 80.0,
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: data.map(
                              (e) => this.pageIndex == data.indexOf(e)
                                ? Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Icon(Icons.brightness_1,size: 12.0,)
                                  )
                                : Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Icon(Icons.brightness_1,size: 8.0,color: Colors.white,)
                                  ),
                          ).toList()
                        ),
                      ),
                      Container(
                        child: FlatButton(
                          child: Text("LogOut"),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  color: Colors.brown[200],
                  height: MediaQuery.of(context).size.height-180.0,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: this.data.length,
                    controller: PageController(viewportFraction: 0.95),
                    onPageChanged: (int v){
                      setState(() {
                        this.pageIndex = v;
                      });
                    },
                    itemBuilder: (BuildContext context, int index) => Container(
                      padding: EdgeInsets.only(right: 20.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 20.0),
                              child: Container(
                                padding: EdgeInsets.only(left: 20.0),
                                child: Text(data[index]['title'].toString(), style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height*0.4,
                              margin: EdgeInsets.symmetric(vertical: 10.0),
                              child: CachedNetworkImage(
                                imageUrl: data[index]['img'].toString(),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(left:20.0, top: 10.0, right: 40.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    child: Text(
                                      data[index]['des'].toString(),
                                      style: TextStyle(fontSize: 16.0),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 20.0),
                                    child: MaterialButton(
                                      child: Text("Go Shop"),
                                      color: Colors.black54,
                                      textColor: Colors.white,
                                      onPressed: (){},
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
