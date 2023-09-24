import 'dart:developer';

import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class audio_functions {
  audio(String url) async {
    // try {
    AudioPlayer just = AudioPlayer();
    await just.setAudioSource(AudioSource.uri(Uri.parse(url)));
    Duration duration = just.duration!;
    log(duration.toString());
    return duration;
    // } catch (e) {}
    // return duration;
  }
}
