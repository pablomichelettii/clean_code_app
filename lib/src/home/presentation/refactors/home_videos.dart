import 'package:flutter/material.dart';

class HomeVideos extends StatefulWidget {
  const HomeVideos({super.key});

  @override
  State<HomeVideos> createState() => _HomeVideosState();
}

class _HomeVideosState extends State<HomeVideos> {
  void getVideos() {
    // context.read<VideoCubit>().getVideos(context.courseOfTheDay!.id);
  }

  @override
  void initState() {
    super.initState();
    getVideos();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
    // return BlocConsumer<VideoCubit, VideoState>(
    //   listener: (context, state) {
    //     if (state is VideoError) {
    //       CoreUtils.showSnackBar(context, state.message);
    //     }
    //   },
    //   builder: (context, state) {
    //     if (state is LoadingVideos) {
    //       return const LoadingView();
    //     } else if ((state is VideosLoaded && state.videos.isEmpty) ||
    //         state is VideoError) {
    //       return NotFoundText(
    //         'No videos found for ${context.courseOfTheDay!.title}',
    //       );
    //     } else if (state is VideosLoaded) {
    //       return Column(
    //         mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           SectionHeader(
    //             sectionTitle: '${context.courseOfTheDay!.title} Videos',
    //             seeAll: state.videos.length > 4,
    //             onSeeAll: () => context.push(
    //               BlocProvider(
    //                 create: (_) => sl<VideoCubit>(),
    //                 // child: CourseVideosView(),
    //               ),
    //             ),
    //           ),
    //           const SizedBox(height: 20),
    //           for (final video in state.videos.take(5))
    //             VideoTile(video, tappable: true),
    //         ],
    //       );
    //     }
    //     return const SizedBox.shrink();
    //   },
    // );
  }
}
