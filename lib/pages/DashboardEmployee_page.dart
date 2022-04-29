
import 'package:cmis/Constants/Costants_english.dart';
import 'package:cmis/pages/AllComplains_page.dart';
import 'package:cmis/pages/InprocessComplains_page.dart';
import 'package:cmis/pages/NewComplains_page.dart';
import 'package:cmis/pages/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ComposeComplainFirstPage.dart';
import 'ComposeComplainpPersonalInfo.dart';
import 'ComposeNewComplain_page.dart';


class DashboardEmployee extends StatefulWidget {

  @override
  State<DashboardEmployee> createState() => _DashboardEmployeeState();

}

class _DashboardEmployeeState extends State<DashboardEmployee> {
  var Const1= Constants_english;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(

        appBar: new PreferredSize(
          child: new Container(
            padding: new EdgeInsets.only(
                top: MediaQuery.of(context).padding.top
            ),
            child: new Padding(
              padding: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 20.0
              ),
              child: Row(
                children: [
                  Container(margin: EdgeInsets.only(left:10),child: InkWell(child: Icon(Icons.logout,color: Colors.white,),
                    onTap: () async {
                    SharedPreferences sharedprefrences=  await SharedPreferences.getInstance();
                    sharedprefrences.remove("token");
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                    },

                  )),
                  Container(
                    margin: EdgeInsets.only(left: 60),
                    child: new Text(
                      'CMIS DASHBOARD',
                      textAlign: TextAlign.center,
                      style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
            ),

            decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      Colors.blue,
                      Colors.white70
                    ]
                ),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey[500],
                    blurRadius: 20.0,
                    spreadRadius: 1.0,
                  )
                ]
            ),
          ),
          preferredSize: new Size(
              MediaQuery.of(context).size.width,
              150.0
          ),
        ),
      body: SafeArea(
        // decoration: BoxDecoration(
        //   gradient:
        //   LinearGradient(colors: [Color(0xFFffffff), Color(0xFF6DD5FA), Color(0xFF2980B9)],begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //   ),
        // ),
          child: SingleChildScrollView(
            child:Center(

            child:Column(
              children: <Widget>[

                Image(image:AssetImage( 'assets/images/Complains.png'),height:200,),
                Text("Complains",style: TextStyle(fontWeight:FontWeight.bold,fontSize:20.0 ),),
                SizedBox(height: 25.0),
                 Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      splashColor: Colors.blue,
                      child: Container(
                        margin: EdgeInsets.only(left: 10, top: 20, right: 5, bottom: 20),
                        height: 150,
                        width:150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF3366FF),
                              const Color(0xFF00CCFF),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp,
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topCenter,//apply margin and padding using Container Widget.
                              padding: EdgeInsets.all(2), //You can use EdgeInsets like above
                              margin: EdgeInsets.all(4),
                              child: Text("11",style: TextStyle(fontSize:25,color: Colors.white,fontWeight: FontWeight.bold),),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.bottomLeft,//apply margin and padding using Container Widget.
                                  padding: EdgeInsets.all(2), //You can use EdgeInsets like above
                                  margin: EdgeInsets.only(top:10),
                                  child: Text(Constants_english.Total,style: TextStyle(fontSize:25,color:Colors.white ),),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,//apply margin and padding using Container Widget.
                                  padding: EdgeInsets.all(2), //You can use EdgeInsets like above
                                  margin: EdgeInsets.only(top:10),
                                  child: Icon(Icons.view_carousel ,color: Colors.white,),
                                )
                              ],
                            )
                          ],
                        ) ,
                      ),
                      onTap: (){
                        // Ink(height: 100, width: 100, color: Colors.black);
                        print("total 1 clicked");
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => AllComplains()));
                      },

                    )
                    ,
                    InkWell(
                      splashColor: Colors.blue,
                      child: Container(
                        margin: EdgeInsets.only(left: 10, top: 20, right: 5, bottom: 20),
                        height: 150,
                        width:150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFFd1913c),
                              const Color(0xFFffd194),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp,
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topCenter,//apply margin and padding using Container Widget.
                              padding: EdgeInsets.all(2), //You can use EdgeInsets like above
                              margin: EdgeInsets.all(4),
                              child: Text("11",style: TextStyle(fontSize:25,color: Colors.white,fontWeight: FontWeight.bold),),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.bottomLeft,//apply margin and padding using Container Widget.
                                  padding: EdgeInsets.all(2), //You can use EdgeInsets like above
                                  margin: EdgeInsets.only(top:10),
                                  child: Text(Constants_english.New,style: TextStyle(fontSize:25,color:Colors.white ),),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,//apply margin and padding using Container Widget.
                                  padding: EdgeInsets.all(2), //You can use EdgeInsets like above
                                  margin: EdgeInsets.only(top:10),
                                  child: Icon(Icons.fiber_new ,color: Colors.white,),
                                )
                              ],
                            )
                          ],
                        ) ,
                      ),
                      onTap: (){
                        Ink(height: 100, width: 100, color: Colors.black);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewComplains()));
                      },

                    )
                  ],
                ),
                Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    InkWell(
                      splashColor: Colors.blue,
                      child: Container(
                        margin: EdgeInsets.only(left: 10, top: 20, right: 5, bottom: 20),
                        height: 150,
                        width:150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFFfd746c),
                              const Color(0xFFff9068),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp,
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topCenter,//apply margin and padding using Container Widget.
                              padding: EdgeInsets.all(2), //You can use EdgeInsets like above
                              margin: EdgeInsets.all(4),
                              child: Text("11",style: TextStyle(fontSize:25,color: Colors.white,fontWeight: FontWeight.bold),),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.bottomLeft,//apply margin and padding using Container Widget.
                                  padding: EdgeInsets.all(2), //You can use EdgeInsets like above
                                  margin: EdgeInsets.only(top:10),
                                  child: Text(Constants_english.InProcess,style: TextStyle(fontSize:25,color:Colors.white ),),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,//apply margin and padding using Container Widget.
                                  padding: EdgeInsets.all(2), //You can use EdgeInsets like above
                                  margin: EdgeInsets.only(top:10),
                                  child: Icon(Icons.hourglass_top ,color: Colors.white,),
                                )
                              ],
                            )
                          ],
                        ) ,
                      ),
                      onTap: (){
                        Ink(height: 100, width: 100, color: Colors.black);
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => InprocessComplains()));
                      },

                    )
                    ,
                    InkWell(
                      splashColor: Colors.blue,
                      child: Container(
                        margin: EdgeInsets.only(left: 10, top: 20, right: 5, bottom: 20),
                        height: 150,
                        width:150,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFFF7971E),
                              const Color(0xFFFFD200),
                            ],
                            begin: const FractionalOffset(0.0, 0.0),
                            end: const FractionalOffset(1.0, 0.0),
                            stops: [0.0, 1.0],
                            tileMode: TileMode.clamp,
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topCenter,//apply margin and padding using Container Widget.
                              padding: EdgeInsets.all(2), //You can use EdgeInsets like above
                              margin: EdgeInsets.all(4),
                              child: Text("11",style: TextStyle(fontSize:25,color: Colors.white,fontWeight: FontWeight.bold),),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.bottomLeft,//apply margin and padding using Container Widget.
                                  padding: EdgeInsets.all(2), //You can use EdgeInsets like above
                                  margin: EdgeInsets.only(top:10),
                                  child: Text(Constants_english.Resolved,style: TextStyle(fontSize:25,color:Colors.white ),),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,//apply margin and padding using Container Widget.
                                  padding: EdgeInsets.all(2), //You can use EdgeInsets like above
                                  margin: EdgeInsets.only(top:10),
                                  child: Icon(Icons.verified ,color: Colors.white,),
                                )
                              ],
                            )
                          ],
                        ) ,
                      ),
                      onTap: (){
                        Ink(height: 100, width: 100, color: Colors.black);
                        print("Container clicked");
                      },

                    )
                  ],
                ),
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ComposeComplainPersonalInfo()));
                  },
                  icon:Icon(Icons.add_circle, color: Colors.white, size: 29,),
                  label: Text("Create New Complain"),
                  backgroundColor: Colors.green,
                  tooltip: 'Capture Picture',
                  elevation: 5,
                  splashColor: Colors.grey,
                ),

              ],

            ),

            ),
          ),

      ),


      ),
    );
  }
}
