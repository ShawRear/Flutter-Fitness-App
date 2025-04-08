import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YtVideoPlayerPage extends StatefulWidget {
 String yturl;
  YtVideoPlayerPage({Key? key,required this.yturl}) : super(key: key);

  @override
  State<YtVideoPlayerPage> createState() => _YtVideoPlayerPageState();
}

class _YtVideoPlayerPageState extends State<YtVideoPlayerPage> {
  YoutubePlayerController? _ytController;

 String? videoId;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   videoId = YoutubePlayer.convertUrlToId(widget.yturl);
    _ytController = YoutubePlayerController(
        initialVideoId: videoId!,

    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: YoutubePlayer(controller:_ytController! ,)
      ),
    );
  }
}
