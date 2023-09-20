import 'package:flutter/material.dart';
import 'package:move_app/app/components/video_player_component.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App BarVideo '),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          VideoPlayerComponent(
              url: 'images/test.mp4', dataSourceType: DataSourceType.asset),
          // VideoPlayerComponent(
          //     url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
          //     dataSourceType: DataSourceType.network),

        ],
      ),
    );
  }
}
