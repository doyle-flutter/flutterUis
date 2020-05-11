import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: MacAppDesign(),
    theme: ThemeData(
      accentColor: Colors.white10
    ),
  )
);

class MacAppDesign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://x86.co.kr/files/attach/images/1951610/241/539/003/32c7777c3292c3ea7991ebdec67dd2e5.jpg"
            ),
            fit: BoxFit.cover
          )
        ),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.only(top: 50.0),
                decoration: BoxDecoration(
                  color: Colors.grey[700],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      child: Icon(Icons.email),
                      padding: EdgeInsets.all(5.0),
                    ),
                    Container(
                      child: Icon(Icons.location_on),
                      padding: EdgeInsets.all(5.0),
                    ),Container(
                      child: Icon(Icons.camera_alt),
                      padding: EdgeInsets.all(5.0),
                    ),
                    Container(
                      child: Text("(화) 03:32"),
                      padding: EdgeInsets.all(5.0),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                margin: EdgeInsets.only(bottom: 40.0,left: 20.0,right: 20.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.grey[700]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(24.0)
                      ),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt, color: Colors.white,),
                        onPressed: (){},
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(24.0)
                      ),
                      child: IconButton(
                        icon: Icon(Icons.web_asset,color: Colors.white,),
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DetailPage()
                          )
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(24.0)
                      ),
                      child: IconButton(
                        icon: Icon(Icons.map,color: Colors.white,),
                        onPressed: (){},
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(24.0)
                      ),
                      child: IconButton(
                        icon: Icon(Icons.send,color: Colors.white,),
                        onPressed: (){},
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(24.0)
                      ),
                      child: IconButton(
                        icon: Icon(Icons.email,color: Colors.white,),
                        onPressed: (){},
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color wh = Colors.white;
  TextStyle wts = TextStyle(color: Colors.white,fontSize: 12.0);

  double upText = 0.0;

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), (){}).then((_) => this.update());
    super.initState();
  }

  void update() async{
    if(upText >= MediaQuery.of(context).size.height) return;
    await Future.delayed(Duration(milliseconds: 200), (){
      upText += 5.0;
    });
    setState(() {});
    return update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: CachedNetworkImage(
                imageUrl: "https://cdn.pixabay.com/photo/2020/05/08/01/22/rong-5143693__480.jpg",
                colorBlendMode: BlendMode.overlay,
                color: Colors.black38,
                fit: BoxFit.fitWidth,
              ),
            ),
            Positioned(
              bottom: upText,
              left: 0,
              right: 0,
              height: MediaQuery.of(context).size.height/6,
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 100.0,vertical: 10.0),
                child: Text(
                  "desdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdesdes",
                  style: wts,
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(Icons.location_on,color: wh,)
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(Icons.camera,color: wh,)
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(Icons.camera_alt,color: wh,)
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(Icons.email,color: wh,)
              ),
            ],
          ),
        ),
      ),
    );
  }
}


