
import 'dart:convert';
import 'package:cmis/pages/SingleComplain_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';

import '../Constants/Costants_english.dart';
import '../Constants/Globals.dart';
import '../widgets/ContainerForComplains.dart';

class NewComplains extends StatefulWidget {
  const NewComplains({Key key}) : super(key: key);

  @override
  State<NewComplains> createState() => _NewComplainsState();
}

class _NewComplainsState extends State<NewComplains> {
  Future<List<User>> _getUsers() async {

    var data = await http.get(Uri.parse(Constant_api.ApiForComplains));

    var jsonData = json.decode(data.body);

    List<User> users = [];

    for(var u in jsonData){

      User user = User(u["id"],u["casetype"],u["casetimedate"],u["casedetail"],u["status"],u["casetilldate"], u["email"], u["first_name"], u["last_name"], u["avatar"]);
      if(user.status=="NEW") {
      users.add(user);
      }
    }

    print(users.length);

    return users;

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
                child: new Text(
                  Constants_english.New+" Complains",
                  textAlign: TextAlign.center,
                  style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
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
          body: Container(
            child: FutureBuilder(
              future: _getUsers(),
              builder: (BuildContext context, AsyncSnapshot snapshot){

                print(snapshot.data);
                if(snapshot.data == null){
                  return Container(
                      child: Center(
                          child: Text("Loading...")
                      )
                  );
                } else {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      var c;
                      if(snapshot.data[index].status.toString()=="NEW"){
                        c=Colors.green;
                      };
                      if(snapshot.data[index].status.toString()=="PENDING"){
                        c=Colors.blue;
                      };
                      if(snapshot.data[index].status.toString()=="END"){
                        c=Colors.red;
                      };
                      return Container(
                        margin: EdgeInsets.only(top:10),
                        child: LimitedBox(
                          maxHeight: 150,
                          child: Container(

                            child: CustomContainer(CaseType:snapshot.data[index].casetype,CaseDetail:snapshot.data[index].casedetail,CaseTimeDate:snapshot.data[index].casetimedate,CaseTillDate:snapshot.data[index].casetilldate,Status:snapshot.data[index].status,StatusColor:c, buttonText: "Test text",
                                onPressed: (){
                                  setState(() {
                                    Globals.ComplainID=snapshot.data[index].id;
                                    Globals.CopmainBody=snapshot.data[index].casedetail;
                                    Globals.ComplainStatus=snapshot.data[index].status;
                                  });
                                  print("object2 "+Globals.ComplainID.toString());
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SingleComplain()));
                                }),
                          ),
                        ),
                      );
                      //   ListTile(
                      //   leading: CircleAvatar(
                      //     backgroundImage: NetworkImage(
                      //         snapshot.data[index].picture
                      //     ),
                      //   ),
                      //   title: Text(snapshot.data[index].name),
                      //   subtitle: Text(snapshot.data[index].email),
                      //   onTap: (){
                      //
                      //     Navigator.push(context,
                      //         new MaterialPageRoute(builder: (context) => DetailPage(snapshot.data[index]))
                      //     );
                      //
                      //   },
                      // );
                    },
                  );
                }
              },
            ),
          )
      ),
    );
  }

}
class User {
  final int id;
  final String casetype;
  final String casetimedate;
  final String casedetail;
  final String status;
  final String casetilldate;
  final String name;
  final String lastname;
  final String email;
  final String picture;

  User(this.id,this.casetype,this.casetimedate,this.casedetail,this.status,this.casetilldate, this.email,this.lastname, this.name, this.picture,);

}
