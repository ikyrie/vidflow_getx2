import 'package:flutter/material.dart';
import 'package:vidflow/components/video_card.dart';
import 'package:vidflow/model/video.dart';
import 'package:vidflow/utils/colors.dart';

class FullDashboard extends StatelessWidget {
  const FullDashboard({super.key, required this.videosList});

  final List<Video> videosList;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
            itemCount: videosList.length,
            itemBuilder: (context, index) => VideoCard(imageURL: videosList[index].thumbURL, profilePictureURL: videosList[index].profileURL, videoTitle: videosList[index].title),
    );
  }
}

class FullDashboardTitle extends StatelessWidget {
  const FullDashboardTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: Text(
          "Seus vídeos",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.blueAccent,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

