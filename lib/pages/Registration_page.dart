import 'package:flutter/material.dart';

// void main() => runApp(SignUpForm());


class SignUpForm extends StatelessWidget{
  Widget build(BuildContext context){
    return MaterialApp(
      // resizeToAvoidBottomInset = false,
      debugShowCheckedModeBanner: false,
      title: 'Registration CMIS',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SignUp(),);
  }
}



class SignUp extends StatefulWidget{
  SignUpState createState()=>SignUpState();
}



class SignUpState extends State{
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final emailcontroller = TextEditingController();
  final namecontroller = TextEditingController();
  final mobilecontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final cniccontroller = TextEditingController();

  Widget build(BuildContext context){

    final emailField = TextField(
      obscureText: false,
      controller: emailcontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email Here",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );


    final name = TextField(
      obscureText: false,
      controller: namecontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name Here",
          prefixIcon: Icon(Icons.person),
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );
    final cnic = TextField(
      obscureText: false,
      controller: cniccontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Enter Cnic",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );


    final mobile = TextField(
      obscureText: false,
      controller: mobilecontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Mobile Here",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );


    final passwordField = TextField(
      obscureText: true,
      controller: passcontroller,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password Here",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(30.0))),
    );


    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Colors.red,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),

        onPressed: () {
          User user=User();
          user.email=emailcontroller.text;
          user.name=namecontroller.text;
          user.cnic=cniccontroller.text;
          user.mobile=mobilecontroller.text;
          user.pass=passcontroller.text;
          if(user.cnic.isEmpty){

            final snackBar = SnackBar(
                content: new Text("Please enter cnic",style:TextStyle(color: Colors.white),),
                backgroundColor: Colors.red);
            scaffoldKey.currentState
                .showSnackBar(snackBar);
          }
          else {
            showAlertDialog(context, user);
          }
        },

        child: Text("Submit",textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),),

      ),
    );


    return Scaffold(

      resizeToAvoidBottomInset : false,
      appBar: AppBar(title: Text("Signup Form")),
      key: scaffoldKey,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image:AssetImage( 'assets/images/signup.png'),height:120,),
                  Text("Registration Form",style: TextStyle(color:Colors.red)),

                  SizedBox(height: 45.0),
                  emailField,

                  SizedBox(height: 25.0),
                  name,
                  SizedBox(height: 25.0),
                  cnic,

                  SizedBox(height: 25.0),
                  mobile,

                  SizedBox(height: 25.0),
                  passwordField,

                  SizedBox(height: 35.0,),
                  loginButon,
                  SizedBox(height: 15.0,),

                ],),),),),
      ),);

  }
}



showAlertDialog(BuildContext context,User user){

  Widget gotIt = FlatButton(

    child: Text("Confirm"),
    onPressed: () {

      print("hello "+user.cnic);


      Navigator.of(context, rootNavigator: true).pop('alert');
    },
  );

  AlertDialog alert = AlertDialog(

    title: Text("Please Confirm Information"),

    content: Text(user.email+"\n"+user.name+"\n"+user.mobile+"\n"+user.pass),

    actions: [
      gotIt,
    ],
  );


  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}



//model class
class User{
  String email;
  String name;
  String cnic;
  String mobile;
  String pass;
}