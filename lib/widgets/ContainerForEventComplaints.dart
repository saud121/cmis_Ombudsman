
import 'dart:ffi';

import 'package:cmis/Constants/Costants_english.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerEvent extends StatelessWidget {
  final String ComplaintRemarks;
  // bool Isseen=false;
  // IconData Check;


  ContainerEvent({this.ComplaintRemarks});

  @override
  Widget build(BuildContext context) {
    // _checkIsseen(Isseen);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[

        Center(

          //Create Colunm to add more icons for tree
          child:Padding(
              padding: const EdgeInsets.only(left: 2,right: 8),
              child: Icon(Icons.view_week,color:Colors.deepOrangeAccent,)),


        ),
        Flexible(
          child: Column(
              children: <Widget>[
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text("Remarks:",style:TextStyle(fontWeight:FontWeight.bold,fontSize:20,),),
                  ),
                ),
                Text(ComplaintRemarks,style:TextStyle(color:Colors.grey,fontSize:15),),
                SizedBox(height: 30,),
                Expanded(
                  flex: 0,
                  child: Align(
                    alignment: FractionalOffset.bottomLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left:3),
                        child:Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color:Colors.lightGreen),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(Constants_english.Forwardedto+" test user admin",style: TextStyle(fontSize: 15,color: Colors.white),),
                          ),
                        )  //Your widget here,
                    ),
                  ),
                ),
                SizedBox(height:5),
                Expanded(
                  flex: 0,
                  child: Align(
                    alignment: FractionalOffset.bottomLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left:3,bottom:5),
                        child:Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color:Colors.grey),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(Constants_english.Forwardedfrom+" test user admin",style: TextStyle(fontSize: 15,color: Colors.white),),
                          ),
                        ) //Your widget here,
                    ),
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget> [
                      Padding(
                          padding: EdgeInsets.only(left:3,bottom:5),
                          child:Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color:Colors.red),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(Constants_english.Daysago,style: TextStyle(fontSize: 15,color: Colors.white),),
                            ),
                          ) //Your widget here,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left:3,bottom:5),
                          child:Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color:Colors.brown),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(Constants_english.Suggestedate,style: TextStyle(fontSize: 15,color: Colors.white),),
                            ),
                          ) //Your widget here,
                      ),
                    ]),
                Center(
                  child: SizedBox(
                    height: 2,
                    width: double.infinity,
                    child: const DecoratedBox(
                      decoration: const BoxDecoration(
                          color: Colors.red
                      ),
                    ),
                  ),
                )]
          ),

        ),








      ],
    );

  }
  //
  // _checkIsseen(bool isseen) {
  //   if(Isseen=false){
  //
  //     return Check=Icons.check;
  //   }
  //   return Check=Icons.done_all;
  // }
}
