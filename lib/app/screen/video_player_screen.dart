import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        children: const  [
          VideoPlayerComponent(url: 'images/test.mp4', dataSourceType: DataSourceType.asset),
          VideoPlayerComponent(url: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4', dataSourceType: DataSourceType.network),

        ],
      ),
    );
  }
}

class VideoPlayerComponent extends StatefulWidget {
  const VideoPlayerComponent({
    super.key,
    required this.url,
    required this.dataSourceType,
  });

  final String url;
  final DataSourceType dataSourceType;

  @override
  State<VideoPlayerComponent> createState() => _VideoPlayerComponentState();
}

class _VideoPlayerComponentState extends State<VideoPlayerComponent> {
  late VideoPlayerController _videoPlayerController;
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    switch (widget.dataSourceType) {
      case DataSourceType.asset:
        _videoPlayerController = VideoPlayerController.asset(widget.url);
        break;
      case DataSourceType.network:
        _videoPlayerController = VideoPlayerController.network(widget.url);
        break;
      case DataSourceType.file:
        _videoPlayerController = VideoPlayerController.file(File(widget.url));

        break;
      case DataSourceType.contentUri:
        _videoPlayerController =
            VideoPlayerController.contentUri(Uri.parse(widget.url));

        break;
    }

    _chewieController = ChewieController(videoPlayerController: _videoPlayerController,
        aspectRatio: 16/9);
  }


  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.dataSourceType.name.toUpperCase(),
        style: GoogleFonts.poppins(
          color: Colors.white,
          fontSize: 14
        ),),
        const Divider(),
        AspectRatio(
            aspectRatio: 16 / 9,
          child: Chewie(controller:_chewieController ),

        )
      ],
    );
  }
}
