import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_video_player_plus/cached_video_player_plus.dart';
import 'package:reels_app_spider_tech/features/reels_screen/presentation/cubit/reels_cubit.dart';
import '../widgets/reels_appbar.dart';
import '../widgets/video_player_widget.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  final List<CachedVideoPlayerPlusController> controllers = [];
  final PageController _pageController = PageController(initialPage: 0);
  bool isLoading = true;
  bool showButton = false;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_onPageChanged);
  }

  void _initializeControllers(List<String> videoUrls) {
    for (String videoUrl in videoUrls) {
      final controller = CachedVideoPlayerPlusController.networkUrl(
        Uri.parse(videoUrl),
        httpHeaders: {
          'Connection': 'keep-alive',
        },
        invalidateCacheIfOlderThan: const Duration(minutes: 10),
      );

      controller.initialize().then((_) {
        controller.setLooping(true);
        controllers.add(controller);

        if (controllers.length == 1) {
          controller.play();
          setState(() {
            isLoading = false;
          });
        }

        setState(() {});
      });
    }
  }

  void _togglePlayback(int index) {
    final controller = controllers[index];
    setState(() {
      if (controller.value.isPlaying) {
        controller.pause();
      } else {
        controller.play();
      }
    });
  }

  void _showButton() {
    setState(() {
      showButton = true;
    });
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        showButton = false;
      });
    });
  }

  void _onPageChanged() {
    for (int i = 0; i < controllers.length; i++) {
      if (i == _pageController.page!.round()) {
        controllers[i].play();
      } else {
        controllers[i].pause();
      }
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: const ReelsAppbar(),
      body: BlocBuilder<ReelsCubit, ReelsState>(
        builder: (context, state) {
          if (state is ReelsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (state is ReelsLoadedState) {
            final videoUrls =
                state.getReelsModel.data.map((reel) => reel.video).toList();
            _initializeControllers(videoUrls);

            return PageView.builder(
              scrollDirection: Axis.vertical,
              controller: _pageController,
              itemCount: videoUrls.length,
              itemBuilder: (context, index) {
                if (controllers.length > index) {
                  return VideoPlayerWidget(
                    controller: controllers[index],
                    togglePlayback: () {
                      _togglePlayback(index);
                      _showButton();
                    },
                    showButton: showButton,
                  );
                } else {
                  return const SizedBox();
                }
              },
            );
          } else if (state is ReelsErrorState) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else {
            return const Center(child: Text('Unexpected state'));
          }
        },
      ),
    );
  }
}
