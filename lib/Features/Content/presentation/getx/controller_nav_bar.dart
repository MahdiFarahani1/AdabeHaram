import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController {
  double height = 25;

  bool isPlaying = false;

  IconData iconDataArrow = FontAwesomeIcons.anglesUp;
  IconData iconDataPlay = Icons.play_arrow;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  initState(AudioPlayer audioPlayer) {
    audioPlayer.onPlayerStateChanged.listen((stateA) {
      bool play = stateA == PlayerState.playing;
      isPlaying = play;
      update();
    });

    audioPlayer.onDurationChanged.listen((newDur) {
      duration = newDur;
      update();
    });
    audioPlayer.onPositionChanged.listen((newPos) {
      position = newPos;
      update();
    });
  }

  openNavbar(double newSize) {
    if (height == 25) {
      height = newSize;
      iconDataArrow = FontAwesomeIcons.anglesDown;
    } else {
      height = 25;
      iconDataArrow = FontAwesomeIcons.anglesUp;
    }
    update();
  }

  changeStateAudio(AudioPlayer audioPlayer, String url) async {
    if (!isPlaying) {
      iconDataPlay = Icons.pause;
      await audioPlayer.play(UrlSource(url));
    } else {
      iconDataPlay = Icons.play_arrow;

      await audioPlayer.pause();
    }
    update();
  }

  changeSliderValue(AudioPlayer audioPlayer, double value) async {
    final pos = Duration(seconds: value.toInt());
    await audioPlayer.seek(pos);
    await audioPlayer.resume();
  }
}
