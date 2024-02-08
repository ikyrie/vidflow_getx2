import 'package:flutter/material.dart';
import 'package:vidflow/components/custom_button.dart';
import 'package:vidflow/components/header.dart';
import 'package:vidflow/components/video_card.dart';
import 'package:vidflow/utils/colors.dart';
import 'package:vidflow/utils/images.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueVoid,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 64, 16, 28),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Header(),
              _EmptyDashboard(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmptyDashboard extends StatelessWidget {
  const _EmptyDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 72.0, horizontal: 31),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Image.asset(AppImages.emptyDashboard),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 40.0),
            child: Text(
                "Você ainda não postou nenhum vídeo em seu perfil, que tal começar?"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CustomButton(
                onTap: () {},
                text: "Uploade de vídeo",
                icon: Icons.upload,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _FullDashboard extends StatelessWidget {
  const _FullDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
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
        const Padding(
          padding: EdgeInsets.only(bottom: 40.0),
          child: VideoCard(
              imageURL: "https://i.ytimg.com/vi/WyCn2dS7vnc/maxresdefault.jpg",
              profilePictureURL:
                  "https://i.pinimg.com/564x/73/3f/17/733f170238ce77d34120af0dd0889589.jpg",
              videoTitle:
                  "Qual é o melhor hardware para programação com Hirai Momo"),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 40.0),
          child: VideoCard(
              imageURL: "https://pbs.twimg.com/media/EP8hkd6WkAUOr2s.jpg",
              profilePictureURL:
                  "https://i.pinimg.com/564x/73/3f/17/733f170238ce77d34120af0dd0889589.jpg",
              videoTitle:
                  "Voltando ao mercado após muitos anos de dança: Hirai Momo"),
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 40.0),
          child: VideoCard(
              imageURL:
                  "https://i.pinimg.com/736x/8b/21/29/8b21291f84326d2de9c39b9084113fc3.jpg",
              profilePictureURL:
                  "https://i.pinimg.com/564x/73/3f/17/733f170238ce77d34120af0dd0889589.jpg",
              videoTitle:
                  "Mercado de Trabalho | Desmistificando Hirai Momo..."),
        ),
      ],
    );
  }
}
