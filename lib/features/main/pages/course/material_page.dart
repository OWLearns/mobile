import 'package:flutter/material.dart';
import 'package:mobile/features/main/pages/course/material_model.dart';
import 'package:mobile/shared/themes/color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MaterialsPage extends StatefulWidget {
  final Materials dataMaterial;
  const MaterialsPage({required this.dataMaterial, super.key});

  @override
  State<MaterialsPage> createState() => _MaterialsPageState();
}

class _MaterialsPageState extends State<MaterialsPage> {
  late YoutubePlayerController youtubeController;
  bool showPlayer = true;

  @override
  void initState() {
    youtubeController = YoutubePlayerController(
      initialVideoId:
          YoutubePlayer.convertUrlToId(widget.dataMaterial.videoLink)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        useHybridComposition: false,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    youtubeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: owlBase,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          showPlayer = false;
                        });
                        Navigator.of(context).pop();
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    const Text(
                      'Title Material',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Icon(
                      Icons.arrow_back_ios,
                      color: owlBase,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 250,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
                  child: showPlayer
                      ? YoutubePlayer(
                          controller: youtubeController,
                          aspectRatio: 16 / 9,
                          bottomActions: [
                            CurrentPosition(),
                            ProgressBar(
                              isExpanded: true,
                            ),
                            RemainingDuration(),
                            const PlaybackSpeedButton(),
                          ],
                        )
                      : const SizedBox(),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Introduction to HTML",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Carstenz Meru - Frontend Engineer at OWL",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  widget.dataMaterial.textDescription,
                  style: const TextStyle(
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
