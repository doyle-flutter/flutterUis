// cached_network_image: ^2.2.0+1 

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: LoginPage(),
    theme: ThemeData(
      accentColor: Colors.white10
    ),
  )
);

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  PageController pController = new PageController();

  List<String> tagItems = [ "Tag1","Tag2","Tag3","Tag4","Tag5","Tag6","Tag7","Tag8","Tag9","Tag10","Tag11","Tag12"];
  List<String> selectItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: CachedNetworkImage(
                  imageUrl: "https://cdn.pixabay.com/photo/2020/03/14/17/19/flower-4931280__340.jpg",
                  fit: BoxFit.fitHeight,
                ),
              ),
              Positioned(
                top: 180.0,
                left: 55.0,
                right: 55.0,
                bottom: 50.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black45,
                        offset: Offset(2.25, 2.25)
                      ),
                      BoxShadow(
                        color: Colors.grey[300],
                        offset: Offset(-0.5, -0.5)
                      ),
                    ]
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 10.0),
                  child: PageView(
                    // physics: NeverScrollableScrollPhysics(),
                    controller: pController,
                    children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              child: Text("LOGIN",style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                            ),
                            TextField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                hintText: "E-Mail",
                                prefixIcon:Icon(Icons.email,color: Colors.grey)
                              ),
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon:Icon(Icons.lock,color: Colors.grey)
                              ),
                            ),
                            MaterialButton(
                              child: Text("Sign In"),
                              textColor: Colors.white,
                              color: Colors.blue[200],
                              clipBehavior: Clip.antiAlias,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                              onPressed: () => pController.animateToPage(1, duration: Duration(milliseconds: 300), curve: Curves.linear),
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  FlatButton(
                                    child: Text("Sign Up"),
                                    onPressed: (){},
                                  ),
                                  FlatButton(
                                    child: Text("Forget...",style: TextStyle(color: Colors.grey[400]),),
                                    onPressed: (){},
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Wrap(
                              children: this.tagItems.map(
                                (e) => GestureDetector(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
                                    margin: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      color: selectItems.contains(e) ? Colors.red : Colors.red[200],
                                      borderRadius: BorderRadius.circular(10.0)
                                    ),
                                    child: Text(e.toString(),style: TextStyle(color: Colors.white),)
                                  ),
                                  onTap: (){
                                    if(!selectItems.contains(e)){
                                      setState(() {
                                        selectItems.add((e));
                                      });
                                    }
                                    else{
                                      setState(() {
                                        selectItems.remove((e));
                                      });
                                    }
                                  },
                                )
                              ).toList(),
                            ),
                            Container(
                              child: MaterialButton(
                                child: Text("Finish"),
                                textColor: Colors.white,
                                color: Colors.blue[200],
                                clipBehavior: Clip.antiAlias,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                onPressed: () => pController.animateToPage(2, duration: Duration(milliseconds: 300), curve: Curves.linear),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text("Hello world !",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0),)
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

