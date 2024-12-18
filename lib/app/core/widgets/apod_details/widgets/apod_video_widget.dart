import 'package:flutter/material.dart';
import 'package:teste_apod/app/core/models/apod_model.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ApodVideoWidget extends StatefulWidget {
  final ApodModel value;
  const ApodVideoWidget({super.key, required this.value});

  @override
  State<ApodVideoWidget> createState() => _ApodVideoWidgetState();
}

class _ApodVideoWidgetState extends State<ApodVideoWidget> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();

    final videoId = YoutubePlayer.convertUrlToId(widget.value.url);

    _controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12, left: 12, right: 12),
      child: YoutubePlayer(
        aspectRatio: 16 / 9,
        controller: _controller,
        progressIndicatorColor: Theme.of(context).progressIndicatorTheme.color,
        showVideoProgressIndicator: true,
      ),
    );
  }
}
