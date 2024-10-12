import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:flutter/material.dart';

class VideoPlayerWidget extends StatelessWidget {
  final CachedVideoPlayerPlusController controller;
  final VoidCallback togglePlayback;
  final bool showButton;

  const VideoPlayerWidget({
    super.key,
    required this.controller,
    required this.togglePlayback,
    required this.showButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: togglePlayback,
      child: Stack(
        children: [
          Positioned.fill(
            child: AspectRatio(
              aspectRatio: controller.value.isInitialized
                  ? controller.value.aspectRatio
                  : 16 / 9,
              child: CachedVideoPlayerPlus(controller),
            ),
          ),
          if (showButton)
            Center(
              child: IconButton(
                icon: Icon(
                  controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                  size: 64.0,
                ),
                onPressed: togglePlayback,
              ),
            ),
        ],
      ),
    );
  }
}
