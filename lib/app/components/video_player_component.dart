import 'dart:io';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';

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
        aspectRatio: 16/9,
      autoPlay: true,
      allowFullScreen: true,
      fullScreenByDefault: true,

    );
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
