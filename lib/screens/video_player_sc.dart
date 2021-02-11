import 'package:flutter/material.dart';
import 'package:yoyo_player/yoyo_player.dart';


class VideoPlayerSC extends StatefulWidget {
  static String route = '/playerScreen';
  final String url;

  const VideoPlayerSC({Key key, this.url}) : super(key: key);

  @override
  _VideoPlayerSCState createState() => _VideoPlayerSCState();
}

class _VideoPlayerSCState extends State<VideoPlayerSC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: YoYoPlayer(
        aspectRatio: 16 / 9,
        url: widget.url,
        videoStyle: VideoStyle(),
        videoLoadingStyle: VideoLoadingStyle(),
      ),
    );
  }

  @override
  void initState() {
    print(widget.url+" url video");
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
