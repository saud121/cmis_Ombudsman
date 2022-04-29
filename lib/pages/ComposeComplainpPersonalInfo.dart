
import 'package:cmis/Constants/Costants_english.dart';
import 'package:cmis/pages/ComposeComplainAccuseInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComposeComplainPersonalInfo extends StatefulWidget {
  const ComposeComplainPersonalInfo({Key key}) : super(key: key);

  @override
  State<ComposeComplainPersonalInfo> createState() => _ComposeComplainPersonalInfoState();
}

class _ComposeComplainPersonalInfoState extends State<ComposeComplainPersonalInfo> {
  final Namecontroller = TextEditingController();
  final departmentcontroller = TextEditingController();
  final designationcontroller = TextEditingController();
  final CNICcontroller = TextEditingController();
  // final cniccontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final complaineeName  = TextField(
      obscureText: false,
      controller: Namecontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: Constants_english.complainantName ,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );
    final departmentName  = TextField(
      obscureText: false,
      controller: departmentcontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: Constants_english.departmentname ,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );
    final designation  = TextField(
      obscureText: false,
      controller: designationcontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: Constants_english.designation ,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );
    final CNIC  = TextField(
      obscureText: false,
      controller: CNICcontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: Constants_english.CNIC ,
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );
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
                Constants_english.ComposeNewComplain,
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
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child:Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Personal Information",style: TextStyle(color:Colors.red,fontWeight: FontWeight.bold,fontSize:25)),

                  SizedBox(height: 45.0),
                  complaineeName,
                  SizedBox(height: 25.0),
                  departmentName,
                  SizedBox(height: 25.0),
                  CNIC,
                  SizedBox(height: 25.0),
                  designation,
                  SizedBox(height: 30.0),
                  FloatingActionButton.extended(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ComposeComplainAccuseInfo()));
                    },
                    icon:Icon(Icons.task_alt, color: Colors.white, size: 29,),
                    label: Text("Procced to next step 1/4"),
                    backgroundColor: Colors.green,
                    tooltip: 'Capture Picture',
                    elevation: 5,
                    splashColor: Colors.grey,
                  )
                ]),
              ) ,
            ),
          ),
        ),
      ),
    );
  }
}
