// import 'dart:html';
// import 'package:flutter_sound/flutter_sound.dart';
import 'package:cmis/Constants/Costants_english.dart';
import 'package:cmis/Constants/Globals.dart';
import 'package:cmis/pages/AudioRecord_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
// import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path/path.dart' as path;
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

// import '../recorder/recorder_home_view.dart';

class NewComplain extends StatefulWidget {
  const NewComplain({Key key}) : super(key: key);

  @override
  State<NewComplain> createState() => _NewComplainState();
}

class _NewComplainState extends State<NewComplain> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  File CnicFile;
  File ThumbFile;

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
                child: new Text(
                  "Complain Attachment",
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
              children: <Widget>[
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Please Upload your CNIC",style: TextStyle(color:Colors.red,fontWeight:FontWeight.bold),textDirection:TextDirection.ltr)),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Please Upload Picture of your Signature or thumbprint",style: TextStyle(color:Colors.red,fontWeight:FontWeight.bold),textDirection:TextDirection.ltr)),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Please Upload any evidences if available at the moment",style: TextStyle(color:Colors.red,fontWeight:FontWeight.bold),textDirection:TextDirection.ltr)),
                ),

                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(width:2,color: Colors.grey)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        Container(
                          child: Material(
                            child: InkWell(
                                splashColor: Colors.blue,
                                onTap: () {
                                  _getFromGallery();
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(color:Colors.grey)),
                                    child: Column(
                                      children: [

                                        Icon(Icons.badge_outlined,size: 50,),

                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text("CNIC"),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),
                        Container(
                          child: Material(
                            child: InkWell(
                                splashColor: Colors.blue,
                                onTap: (){_getThumbFromGallery();},
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(color:Colors.grey)),
                                    child: Column(
                                      children: [

                                        Icon(Icons.fingerprint_outlined,size: 50,),

                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text("Fingerprint"),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),

                        Container(
                          child: Material(
                            child: InkWell(
                                splashColor: Colors.blue,
                                onTap: ()  {
                                  _pickEvidence();
// now do something with list of files selected/picked by a user
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(color:Colors.grey)),
                                    child: Column(
                                      children: [

                                        Icon(Icons.description_outlined,size: 50,),

                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Text("Evidence"),
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                        ),
                        // Container(
                        //   child: Material(
                        //     child: InkWell(
                        //         splashColor: Colors.blue,
                        //         onTap: ()  {
                        //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => recordPage()));
                        //             },
                        //         child: Padding(
                        //           padding: const EdgeInsets.all(8.0),
                        //           child: Container(
                        //             decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),border: Border.all(color:Colors.grey)),
                        //             child: Column(
                        //               children: [
                        //
                        //                 Icon(Icons.mic_outlined,size: 50,),
                        //
                        //                 Padding(
                        //                   padding: const EdgeInsets.all(3.0),
                        //                   child: Text("Audio"),
                        //                 )
                        //               ],
                        //             ),
                        //           ),
                        //         )),
                        //   ),
                        // ),

                      ],
                    ),
                  ),
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white60,
                //     borderRadius: BorderRadius.circular(32),
                //     border: Border.all(color: Colors.black)
                //   ),
                //   child: TextField(
                //     decoration: InputDecoration(
                //       hintStyle: TextStyle(fontSize: 17),
                //       hintText: 'Write your Complain here.',
                //       suffixIcon: Icon(Icons.edit_note_outlined),
                //       border: InputBorder.none,
                //       contentPadding: EdgeInsets.all(20),
                //     ),
                //   ),
                // ),
                     if(CnicFile!=null)
                     SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        margin:EdgeInsets.only(top:20,left: 3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly
                            ,children: <Widget>[
                          if(CnicFile!=null)
                            Container(
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
                              padding: EdgeInsets.all(2),
                              margin: EdgeInsets.only(left: 3),
                              child: Column(
                                children: [
                                  Image.file(CnicFile,
                                    fit: BoxFit.cover,
                                    height: 300,
                                    width: 300,),
                                  Text("CNIC"
                                    , style: TextStyle(fontSize: 20,color:Colors.black,fontWeight: FontWeight.bold),)
                                ],

                              ),
                            ),
                          if(ThumbFile!=null)
                          Container(
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
                                    padding: EdgeInsets.all(2),
                                    margin:EdgeInsets.only(left:3),
                                    child: Column(
                                     children: [
                                       Image.file(ThumbFile,
                            fit: BoxFit.cover,height: 300,width:300,),
                                       Text("FingerPrint"
                                       ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                                     ],

                             ),
                                  ),







                          ]),
                      ),
                    )
                      else Text("No Cnic and Fingerprint attached to Complain")
                ,
                if(Evidence!=null)

                  Container(
                    margin: EdgeInsets.only(top:20),
                    child: Padding(
                      padding: const EdgeInsets.only(top:10,bottom: 5),
                      child: Center(
                        child: Text(Constants_english.Evidences,style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),),
                      ),
                    ),
                  )
                else SizedBox(height: 1,),
                if(Evidence!=null)
                  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: Evidence.length,
                      itemBuilder: (BuildContext context,int index){
                        return
                          Center(child: Text(index.toString()+": "+Evidence[index].path.split("/").last.toString(),style: TextStyle(fontWeight: FontWeight.bold),));

                      }
                  )
                else Text("No evidence attached") ,
              // if(Globals.PathToAudioUri!=null)
              //     Text("Audio File Attached")
              //   else Text("") ,
                SizedBox(height: 50,),
                FloatingActionButton.extended(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewComplain()));
                  },
                  icon:Icon(Icons.task_alt, color: Colors.white, size: 29,),
                  label: Text("Submit Complain !"),
                  backgroundColor: Colors.green,
                  tooltip: 'Capture Picture',
                  elevation: 5,
                  splashColor: Colors.grey,
                ),
              ]
          ),
        ),

      ),

    );
  }
  List<File> Evidence;

  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        CnicFile = File(pickedFile.path);
        print("test11 "+CnicFile.path);
      });
    }
  }
  _getThumbFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        ThumbFile = File(pickedFile.path);
        print("test11 "+CnicFile.path);
      });
    }
  }

   _pickEvidence() async {
    FilePickerResult result = await FilePicker.platform.pickFiles(allowMultiple: true);
   if (result == null) return;
setState(() {
  Evidence = result.paths.map((path) => File(path)).toList();
});

   }

}
