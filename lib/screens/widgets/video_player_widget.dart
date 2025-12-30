import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProvider with ChangeNotifier {
  VideoPlayerController? controller;
  bool initialized = false;

  Future<void> init() async {
    controller = VideoPlayerController.asset("assets/intro.mp4");

    await controller!.initialize();
    controller!.setLooping(true);
    controller!.setVolume(0);
    controller!.play();

    initialized = true;
    notifyListeners();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
