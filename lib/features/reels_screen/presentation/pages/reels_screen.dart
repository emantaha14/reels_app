import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/reels_cubit.dart';
import '../widgets/video_player_widget.dart';

class VideoListPage extends StatefulWidget {
  const VideoListPage({super.key});

  @override
  VideoListPageState createState() => VideoListPageState();
}

class VideoListPageState extends State<VideoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Reels",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              Icons.camera_alt_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: BlocBuilder<ReelsCubit, ReelsState>(
        builder: (context, state) {
          if (state is ReelsLoadedState) {
            return PageView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.getReelsModel.data.length,
              itemBuilder: (context, index) {
                return VideoPlayerWidget(
                    videoUrl: state.getReelsModel.data[index].video);
              },
            );
          } else if (state is ReelsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          } else if (state is ReelsErrorState) {
            return Center(
              child: Text(state.errorMessage.toString()),
            );
          }
          return Container();
        },
      ),
    );
  }
}
