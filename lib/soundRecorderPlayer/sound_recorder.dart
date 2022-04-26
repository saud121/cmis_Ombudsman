import 'dart:io';

import 'package:cmis/Constants/Globals.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
final pathToSave= "audio_attachment.aac";
final audioExt= ".aac";

class SoundRecorder {

  FlutterSoundRecorder _audioRecorder;
  bool _isRecorderInitialised = false;
  bool get isRecording => _audioRecorder.isRecording;
  Future init() async {
    _audioRecorder = FlutterSoundRecorder();
    await _audioRecorder.openAudioSession();
    _isRecorderInitialised= true;
    final status = await Permission.microphone.request();
    if(status != PermissionStatus.granted){
      throw RecordingPermissionException("Microphone Permission not granted");
    }
  }
  void dispose(){
    if (!_isRecorderInitialised) return;
    _audioRecorder.closeAudioSession();
    _audioRecorder=null;
    _isRecorderInitialised= false;
  }
  Future _record() async {
    if (!_isRecorderInitialised) return;
    await _audioRecorder.startRecorder(toFile:pathToSave);
  }
  Future _stop() async {
    if (!_isRecorderInitialised) return;
    await _audioRecorder.stopRecorder();
    // File file = await File(pathToSave);
    // print("heloo123${file.path}");
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/${DateTime.now().microsecondsSinceEpoch}+$audioExt');
    await file.writeAsString(pathToSave);
    print("hello1213 ${file.path}");
    Globals.PathToAudioUri=file.path;
  }
  Future toggleRecording() async {
    if (_audioRecorder.isStopped){
    await _record();}
    else{
      await _stop();
    }
  }
}