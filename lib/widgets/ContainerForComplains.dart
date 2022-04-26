import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {

  //declare Required Vairables
  final String buttonText;
  final String CaseType;
  final Color StatusColor;
  final String CaseTimeDate;
  final String CaseDetail;
  final String Status;
  final String CaseTillDate;
  final VoidCallback onPressed;
  final bool loading;

  //constructor
  CustomContainer({this.CaseType,this.CaseTillDate,this.StatusColor,this.CaseTimeDate,this.CaseDetail,this.Status, this.buttonText,this.onPressed,this.loading});

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,boxShadow: [
                  BoxShadow(
                    color: Colors.black26.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 3), // changes position of shadow
                  ),

                ],
                  border: Border.all(color:Colors.grey) ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  splashColor: Colors.blue,
                  onTap: onPressed,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[

                            Text(CaseType,style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                            Text(CaseTimeDate),
                                // Icon(Icons.import_contacts_sharp)
                          ]

                          ),
                          Text(CaseDetail.trim()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(border: Border.all(width:2,color: Colors.grey)),
                                child:Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(CaseTillDate+" ago",style:TextStyle(fontWeight:FontWeight.bold),),
                                ),
                              ),
                            Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),color:StatusColor),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(Status,style: TextStyle(fontSize: 20,color: Colors.white),),
                              ),

                            )
                            ],
                          )

                        ]

                    )
                    // Center(child:
                    // loading==true?
                    // CircularProgressIndicator(backgroundColor: Colors.white,)
                    //     :
                    // Text(buttonText,style: TextStyle(fontSize: 30,color: Colors.black),
                    // ),
                    //
                    // )
                    ,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }


}