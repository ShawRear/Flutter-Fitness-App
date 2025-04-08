import 'package:flutter/material.dart';
import 'videoList.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const VideoList(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {


  //this class is for testing purpose only
  final YoutubePlayerController _ytcontrol = YoutubePlayerController(
      initialVideoId: 'LlruH02egi8',
      flags: const YoutubePlayerFlags(autoPlay: false,mute:true)
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
          child: YoutubePlayer(
            controller: _ytcontrol ,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.green,
            topActions: [
              const SizedBox(width: 8,),
              Text(_ytcontrol.metadata.title)
            ],
          )
      ),
    );
  }
}