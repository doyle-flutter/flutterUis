import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int pageIndex = 0;
  List data = [
    {
      "title":"Title 1",
      "img":"https://cdn.pixabay.com/photo/2017/06/20/09/39/psychology-2422442__480.png",
      "des":"1DesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDes",
      "name":"Name 1"
    },
    {
      "title":"Title 2",
      "img":"https://cdn.pixabay.com/photo/2016/03/28/22/51/man-1287106__480.png",
      "des":"22DesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDes",
      "name":"Name 2"
    },
    {
      "title":"Title 3",
      "img":"https://cdn.pixabay.com/photo/2016/04/09/22/43/boy-1319082__480.png",
      "des":"333DesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDesDes",
      "name":"Name 3"
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  radius: 10.0,
                  center: Alignment.topCenter,
                  colors: [
                    Colors.red[900],
                    Colors.deepOrange[900],
                    Colors.red[700],
                    Colors.red[800],
                    Colors.red,
                  ]
                )
              ),
            ),
            Positioned(
              top: 100,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height*0.6,
              child: Container(
                child: PageView.builder(
                  itemCount: this.data.length,
                  onPageChanged: (int v){
                    setState(() {
                      this.pageIndex = v;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) => Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          flex: 8,
                          child: Container(
                            padding: EdgeInsets.all(40.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20.0)
                            ),
                            child: CachedNetworkImage(
                              imageUrl: data[index]['img'].toString(),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(data[index]['title'].toString(),style: TextStyle(color: Colors.white),),
                                Text(data[index]['name'].toString(),style: TextStyle(color: Colors.white),),
                              ],
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: MaterialButton(
                            minWidth: 150.0,
                            elevation: 5.0,
                            child: Text("DES"),
                            textColor: Colors.redAccent[700],
                            onPressed: () async{
                              showModalBottomSheet(
                                context: context,
                                builder: (context) =>  BottomSheet(
                                  enableDrag: false,
                                  onClosing: (){},
                                  builder: (context) => Container(
                                    height: MediaQuery.of(context).size.height/3,
                                    margin: EdgeInsets.all(20.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Expanded(
                                          flex:8,
                                          child: SingleChildScrollView(
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                bottom: 20.0
                                              ),
                                              child: Text(data[index]['des'].toString()),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex:2,
                                          child: Container(
                                            margin: EdgeInsets.only(top: 20.0,bottom: 10.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                MaterialButton(
                                                  minWidth: 100.0,
                                                  child: Text("BUY"),
                                                  color: Colors.red,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20.0)
                                                  ),
                                                  textColor: Colors.white,
                                                  onPressed: (){},
                                                ),
                                                MaterialButton(
                                                  minWidth: 100.0,
                                                  child: Text("Close"),
                                                  color: Colors.white,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(20.0)
                                                  ),
                                                  textColor: Colors.red[900],
                                                  onPressed: () => Navigator.of(context).pop(),
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)
                            ),
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ),
              ),
            ),
            Positioned(
              top: 60.0,
              right: 20.0,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: data.map((e) => Container(
                    margin: EdgeInsets.all(5.0),
                    child: this.pageIndex == data.indexOf(e)
                      ? Icon(Icons.brightness_1,color: Colors.deepOrange,size: 8,)
                      : Icon(Icons.brightness_1,color: Colors.white,size: 8,),
                  ),).toList(),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}
