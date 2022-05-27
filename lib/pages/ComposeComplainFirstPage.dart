
import 'package:cmis/Constants/Globals.dart';
import 'package:cmis/pages/ComposeComplainpPersonalInfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants/Costants_english.dart';
import '../soundRecorderPlayer/sound_player.dart';
import 'AudioRecord_page.dart';
import 'ComposeNewComplain_page.dart';

class ComplainFirstPage extends StatefulWidget {
  const ComplainFirstPage({Key key}) : super(key: key);

  @override
  State<ComplainFirstPage> createState() => _ComplainFirstPageState();
}

class _ComplainFirstPageState extends State<ComplainFirstPage> {
  final player = SoundPlayer();
  int selectedIndex = 0 ;
  @override
  void initState(){
    super.initState();
    player.init();

  }
  @override
  void dispose(){
    player.dispose();
    super.dispose();
  }
   bool affirmationvalue = false;
  bool OmbudsmanrelatingValue = false;
  bool otherTribunalvalue = false;
  bool contactvalue = false;
  @override
  Widget build(BuildContext context) {
    print("pathtouri11 ${Globals.PathToAudioUri}");
    bool isPlaying;
    if(player.isPlaying!= null){
      isPlaying= player.isPlaying;
    }
    else{
      isPlaying = false;
    }
    final PlaybuttonIcon= isPlaying ? Icons.stop : Icons.play_circle_filled;
    final PlaybuttonText= isPlaying ? "Stop Recorded Complain" : "Play Recorded Complain";
    final Playprimary= isPlaying ? Colors.red : Colors.white;
    final PlayonPrimar= isPlaying ? Colors.white : Colors.black;
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
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(Constants_english.Reliventinfo,style: TextStyle(color:Colors.red,fontWeight:FontWeight.bold),textDirection:TextDirection.ltr)),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(Constants_english.AttachAudio,style: TextStyle(color:Colors.red,fontWeight:FontWeight.bold),textDirection:TextDirection.ltr)),
              ),
              Container(
                margin: EdgeInsets.only(top:5),
                child: Padding(
                  padding: const EdgeInsets.only(top:5,bottom: 5),
                  child: Center(
                    child: Text(Constants_english.Complaintbody,style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white60,
                    borderRadius: BorderRadius.circular(32),
                    border: Border.all(color: Colors.black)
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'Write your Complain here.',
                    suffixIcon: Icon(Icons.edit_note_outlined),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
              ),
              Text("If you can not type complain please record audio complain"),
              Container(
                child: Material(
                  child: InkWell(
                      splashColor: Colors.blue,
                      onTap: ()  {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => recordPage()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(color:Colors.grey)),
                          child: Column(
                            children: [

                              Icon(Icons.mic_outlined,size: 50,),

                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Text("Audio"),
                              )
                            ],
                          ),
                        ),
                      )),
                ),
              ),
              if(Globals.PathToAudioUri!=null)
              Container(
                padding: EdgeInsets.all(5),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(175,50),
                    primary: Playprimary,
                    onPrimary: PlayonPrimar,
                  ),
                  icon: Icon(PlaybuttonIcon),
                  label: Text(PlaybuttonText,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  onPressed: () async{
                    await player.togglePlaying(whenFinished: () => setState((){}) );
                    setState(() {});
                  },
                ),
              )
                else
                  SizedBox(height: 2),
              SizedBox(height: 5),
              Center(
                child: Container(
                  padding: EdgeInsets.all(2.0),
                  color: Colors.white60,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RaisedButton(
                        child: Row(
                          children: [
                            Icon(Icons.abc),
                            SizedBox(width:9,),
                            Text('Affadavit English'),
                          ],
                        ),
                        textColor: Colors.white,
                        color: selectedIndex == 0 ? Colors.blueAccent : Colors.grey,
                        onPressed: (){
                          setState(() {
                            selectedIndex = 0 ;
                          });
                        },
                      ),
                      RaisedButton(
                        child: Row(
                          children: [
                            Icon(Icons.flag_circle),
                            SizedBox(width:9,),

                            Text('حلفی بیان اردو'),
                          ],
                        ),
                        textColor: Colors.white,
                        color: selectedIndex == 1 ? Colors.lightGreen : Colors.grey,
                        onPressed: (){
                          setState(() {
                            selectedIndex = 1 ;
                          });
                        },
                      ),

                    ],
                  ),
                ),
              ),
              if (selectedIndex == 0)
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.yellow, spreadRadius: 8),
                      BoxShadow(color: Colors.green, spreadRadius: 5),

                    ],
                  ),
                  child: Column(

                    children: [
                      Center(
                        child:Text("Affidavit",style: TextStyle(fontWeight:FontWeight.bold,fontSize:19),),
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 30,
                              direction: Axis.horizontal,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                                  child: Text(
                                    'I do hereby solemnly affirm that (i) all the information and events given as above are ture to the best of my knowledge '.trim(),
                                    style: TextStyle(fontSize: 12.0,fontWeight:FontWeight.bold),
                                  ),
                                ), //Text
                                Checkbox(
                                  value: this.affirmationvalue,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.affirmationvalue = value;
                                    });
                                  },
                                ),],
                            ),
                          )
                           //Checkbox
                        ], //<Widget>[]
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 30,
                              direction: Axis.horizontal,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(left: 5,right: 5),
                                  child: Text(
                                    '(ii) any complaint relating to the same matter has never been submitted at Ombudsman Secretariat Balochistan'.trim(),
                                    style: TextStyle(fontSize: 12.0,fontWeight:FontWeight.bold),
                                  ),
                                ), //Text
                                Row(
                                  children: [
                                    Checkbox(
                                      value: this.OmbudsmanrelatingValue,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.OmbudsmanrelatingValue = value;
                                        });
                                      },
                                    ),
                                    Icon(
                                      Icons.info,
                                      color: Colors.red,
                                    ),
                                    Flexible(
                                      child: Wrap(
                                        crossAxisAlignment: WrapCrossAlignment.center,
                                        alignment: WrapAlignment.spaceBetween,
                                        spacing: 30,
                                        direction: Axis.horizontal,
                                        children: [
                                          Text("Please mention Complaint No. and date in complain body if matter is submitted at Ombudsman Secretariat Balochistan",style: TextStyle(fontSize: 10.0))
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          )
                          //Checkbox
                        ], //<Widget>[]
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 30,
                              direction: Axis.horizontal,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(left: 5,right: 5),
                                  child: Text(
                                    '(iii) any complaint relating to the above matter/event has not been under trial in any other judicial forum/tribunal'.trim(),
                                    style: TextStyle(fontSize: 12.0,fontWeight:FontWeight.bold),
                                  ),
                                ), //Text
                                Row(
                                  children: [
                                    Checkbox(
                                      value: this.otherTribunalvalue,
                                      onChanged: (bool value) {
                                        setState(() {
                                          this.otherTribunalvalue = value;
                                        });
                                      },
                                    ),
                                    Icon(
                                      Icons.info,
                                      color: Colors.red,
                                    ),
                                    Flexible(
                                      child: Wrap(
                                        crossAxisAlignment: WrapCrossAlignment.center,
                                        alignment: WrapAlignment.spaceBetween,
                                        spacing: 30,
                                        direction: Axis.horizontal,
                                        children: [
                                          Text("Please mention trial No. and subject and date in complain body if matter/event is already under trial other judicial forum",style: TextStyle(fontSize: 10.0))
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          )
                          //Checkbox
                        ], //<Widget>[]
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.spaceBetween,
                              spacing: 30,
                              direction: Axis.horizontal,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                                  child: Text(
                                    '(iv) I have already contacted the department regarding the above complaint/matter/event (copies to be attached ) but did not get heard off or if the complaint is rejected attach the copy of rejection'.trim(),
                                    style: TextStyle(fontSize: 12.0,fontWeight:FontWeight.bold),
                                  ),
                                ), //Text
                                Checkbox(
                                  value: this.contactvalue,
                                  onChanged: (bool value) {
                                    setState(() {
                                      this.contactvalue = value;
                                    });
                                  },
                                ),],
                            ),
                          )
                          //Checkbox
                        ], //<Widget>[]
                      ),
                    ],
                  ),
                ),
              )
                else
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(color: Colors.yellow, spreadRadius: 8),
                        BoxShadow(color: Colors.green, spreadRadius: 5),

                      ],
                    ),
                    child: Column(

                      children: [
                        Center(
                          child:Text("حلفی بیان",style: TextStyle(fontWeight:FontWeight.bold,fontSize:19),),
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 30,
                                direction: Axis.horizontal,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                                    child: Text(
                                      'میں سنجیدگی سے اس بات کی تصدیق کرتا ہوں کہ (i) اوپر دی گئی تمام معلومات اور واقعات میرے بہترین علم کے مطابق ہیں'.trim(),
                                      style: TextStyle(fontSize: 12.0,fontWeight:FontWeight.bold),
                                    ),
                                  ), //Text
                                  Checkbox(
                                    value: this.affirmationvalue,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.affirmationvalue = value;
                                      });
                                    },
                                  ),],
                              ),
                            )
                            //Checkbox
                          ], //<Widget>[]
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 30,
                                direction: Axis.horizontal,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(left: 5,right: 5),
                                    child: Text(
                                      '(ii) اسی معاملے سے متعلق کوئی شکایت محتسب سیکرٹریٹ بلوچستان میں کبھی بھی جمع نہیں کروائی گئی۔ '.trim(),
                                      style: TextStyle(fontSize: 12.0,fontWeight:FontWeight.bold),
                                    ),
                                  ), //Text
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: this.OmbudsmanrelatingValue,
                                        onChanged: (bool value) {
                                          setState(() {
                                            this.OmbudsmanrelatingValue = value;
                                          });
                                        },
                                      ),
                                      Icon(
                                        Icons.info,
                                        color: Colors.red,
                                      ),
                                      Flexible(
                                        child: Wrap(
                                          crossAxisAlignment: WrapCrossAlignment.center,
                                          alignment: WrapAlignment.spaceBetween,
                                          spacing: 30,
                                          direction: Axis.horizontal,
                                          children: [
                                            Text("اگر معاملہ محتسب سیکرٹریٹ بلوچستان جمع کرایا جائے تو براہ کرم شکایت میں شکایت نمبر اور تاریخ درج کریں",style: TextStyle(fontSize: 10.0))
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            )
                            //Checkbox
                          ], //<Widget>[]
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 30,
                                direction: Axis.horizontal,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(left: 5,right: 5),
                                    child: Text(
                                      '(iii) مذکورہ معاملے/واقعہ سے متعلق کوئی شکایت کسی دوسرے عدالتی فورم/ٹربیونل میں زیر سماعت نہیں ہے۔'.trim(),
                                      style: TextStyle(fontSize: 12.0,fontWeight:FontWeight.bold),
                                    ),
                                  ), //Text
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: this.otherTribunalvalue,
                                        onChanged: (bool value) {
                                          setState(() {
                                            this.otherTribunalvalue = value;
                                          });
                                        },
                                      ),
                                      Icon(
                                        Icons.info,
                                        color: Colors.red,
                                      ),
                                      Flexible(
                                        child: Wrap(
                                          crossAxisAlignment: WrapCrossAlignment.center,
                                          alignment: WrapAlignment.spaceBetween,
                                          spacing: 30,
                                          direction: Axis.horizontal,
                                          children: [
                                            Text(" براہ کرم شکایت میں مقدمہ نمبر اور موضوع اور تاریخ کا ذکر کریں اگر معاملہ/ واقعہ پہلے ہی دوسرے عدالتی فورم پر زیر سماعت ہے",style: TextStyle(fontSize: 10.0))
                                          ],
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            )
                            //Checkbox
                          ], //<Widget>[]
                        ),
                        Row(
                          children: <Widget>[
                            Flexible(
                              child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                alignment: WrapAlignment.spaceBetween,
                                spacing: 30,
                                direction: Axis.horizontal,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0,right: 5.0),
                                    child: Text(
                                      '(iv) میں نے پہلے ہی مذکورہ شکایت/معاملہ/واقعہ (نقلیں منسلک کی جانی ہے) کے حوالے سے محکمہ سے رابطہ کیا ہے لیکن میری کوئی شنوائی نہیں ہوئی یا اگر شکایت مسترد ہوجاتی ہے تو مسترد ہونے کی کاپی منسلک کریں۔'.trim(),
                                      style: TextStyle(fontSize: 12.0,fontWeight:FontWeight.bold),
                                    ),
                                  ), //Text
                                  Checkbox(
                                    value: this.contactvalue,
                                    onChanged: (bool value) {
                                      setState(() {
                                        this.contactvalue = value;
                                      });
                                    },
                                  ),],
                              ),
                            )
                            //Checkbox
                          ], //<Widget>[]
                        ),
                      ],
                    ),
                  ),
                ),

              Container(
                margin: EdgeInsets.only(top: 5),
                child: FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewComplain()));
                  },
                  icon:Icon(Icons.task_alt, color: Colors.white, size: 29,),
                  label: Text("Procced to next step 2/3"),
                  backgroundColor: Colors.green,
                  tooltip: 'Capture Picture',
                  elevation: 5,
                  splashColor: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
