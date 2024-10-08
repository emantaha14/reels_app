import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/di/injection_container.dart' as di;
import 'features/reels_screen/presentation/cubit/reels_cubit.dart';
import 'features/reels_screen/presentation/pages/reels_screen.dart';

void main() {
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ReelsCubit(getReelsUseCase: di.sl())..getReels(),
        child: const VideoListPage(),
      ),
    );
  }
}
