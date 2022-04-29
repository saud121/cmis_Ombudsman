
import 'package:cmis/widgets/timer_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../soundRecorderPlayer/sound_player.dart';
import '../soundRecorderPlayer/sound_recorder.dart';
import 'ComposeComplainFirstPage.dart';

class recordPage extends StatefulWidget {
  const recordPage({Key key}) : super(key: key);

  @override
  State<recordPage> createState() => _recordPageState();
}

class _recordPageState extends State<recordPage> {
    final timerController= TimeController();
    final recorder = SoundRecorder();
    final player = SoundPlayer();
    @override
    void initState(){
      super.initState();
      recorder.init();
      player.init();
    }
    @override
    void dispose(){
      player.dispose();
      recorder.dispose();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text("Audio Recorder"),
      centerTitle: true,
    ),
    backgroundColor: Colors.black87,
    body: buildStart(),
  );
  Widget buildStart() {
    bool isRecording;
    if (recorder.isRecording != null) {
      isRecording = recorder.isRecording;
    }
    else {
      isRecording = false;
    }
    final buttonIcon = isRecording ? Icons.stop : Icons.mic;
    final buttonText = isRecording ? "STOP" : "START";
    final primary = isRecording ? Colors.red : Colors.white;
    final onPrimar = isRecording ? Colors.white : Colors.black;
    bool isPlaying;
    if(player.isPlaying!= null){
      isPlaying= player.isPlaying;
    }
    else{
      isPlaying = false;
  }
    final PlaybuttonIcon= isPlaying ? Icons.stop : Icons.play_circle_filled;
    final PlaybuttonText= isPlaying ? "Stop Playing" : "Start Playing";
    final Playprimary= isPlaying ? Colors.red : Colors.white;
    final PlayonPrimar= isPlaying ? Colors.white : Colors.black;
    return
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              color: Colors.white,
                child: TimerWidget(controller: timerController,)),
            Container(
              padding: EdgeInsets.all(5),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(175,50),
                  primary: primary,
                  onPrimary: onPrimar,
                ),
                icon: Icon(buttonIcon),
                label: Text(buttonText,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                onPressed: () async{
                  await recorder.toggleRecording();
                  final isRecording = recorder.isRecording;
                  setState(() {

                  });
                  if(isRecording){
                    timerController.startTimer();
                  }
                  else{
                    timerController.stopTimer();
                  }
                },
              ),
            ),
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
            ),
             FloatingActionButton.extended(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ComplainFirstPage()));
              },
              icon:Icon(Icons.record_voice_over, color: Colors.white, size: 29,),
              label: Text("Submit Recording"),
              backgroundColor: Colors.green,
              tooltip: 'Capture Picture',
              elevation: 5,
              splashColor: Colors.grey,
            ),

          ],

    ),
      );

  }
}
