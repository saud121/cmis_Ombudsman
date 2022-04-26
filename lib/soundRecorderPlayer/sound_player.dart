import 'package:flutter/cupertino.dart';
import 'package:flutter_sound_lite/flutter_sound.dart';
final pathToReadUri= "audio_attachment.aac";

class SoundPlayer{
  FlutterSoundPlayer _audioPlayer;
  bool get isPlaying => _audioPlayer.isPlaying;
  Future init() async {
    _audioPlayer= FlutterSoundPlayer();
    await _audioPlayer.openAudioSession();
  }
  void dispose(){
    _audioPlayer.closeAudioSession();
    _audioPlayer=null;
  }
  Future _play(VoidCallback whenFinished) async{
    await _audioPlayer.startPlayer(
       fromURI: pathToReadUri,
      whenFinished: whenFinished
    );
    print("path 313" +pathToReadUri);
  }
  Future _stop() async{
    await _audioPlayer.stopPlayer ();
  }
  Future togglePlaying({VoidCallback whenFinished}) async {
    if (_audioPlayer.isStopped){
      await _play(whenFinished);}
    else{
      await _stop();
    }
  }
}