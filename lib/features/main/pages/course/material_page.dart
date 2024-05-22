import 'package:flutter/material.dart';
import 'package:mobile/features/main/pages/course/material_model.dart';
import 'package:mobile/features/main/pages/course/topic_model.dart';
import 'package:mobile/shared/themes/color.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MaterialsPage extends StatefulWidget {
  final Materials dataMaterial;
  final int courseId;
  final void Function() updateCallBack;
  const MaterialsPage({
    required this.dataMaterial,
    required this.courseId,
    required this.updateCallBack,
    super.key,
  });

  @override
  State<MaterialsPage> createState() => _MaterialsPageState();
}

class _MaterialsPageState extends State<MaterialsPage> {
  late YoutubePlayerController youtubeController;
  bool showPlayer = true;
  late List<Materials> listMaterial;
  late int currentIndexMaterial;
  late bool prevAvailable;
  late bool nextAvailable;
  bool isCompleteLoading = false;

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

    updateMaterial();
    super.initState();
  }

  @override
  void dispose() {
    youtubeController.dispose();
    super.dispose();
  }

  updateMaterial() async {
    listMaterial = Materials.listMaterial
        .where((data) => data.topicId == widget.dataMaterial.topicId)
        .toList();

    for (var i = 0; i < listMaterial.length; i++) {
      if (listMaterial[i].id == widget.dataMaterial.id) {
        currentIndexMaterial = i;
      }
    }

    prevAvailable = currentIndexMaterial != 0;
    nextAvailable = currentIndexMaterial != listMaterial.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (didPop) {
        if (didPop) {
          setState(() {
            showPlayer = false;
          });
          widget.updateCallBack();
        }
      },
      child: Stack(
        children: [
          Scaffold(
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
                              widget.updateCallBack();
                              Navigator.of(context).pop();
                            },
                            child: const Icon(Icons.arrow_back_ios),
                          ),
                          Text(
                            widget.dataMaterial.title,
                            style: const TextStyle(
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
                      Text(
                        widget.dataMaterial.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.dataMaterial.textDescription,
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              if (prevAvailable) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => MaterialsPage(
                                      dataMaterial: listMaterial[
                                          currentIndexMaterial - 1],
                                      courseId: widget.courseId,
                                      updateCallBack: widget.updateCallBack,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Icon(
                              Icons.arrow_back_ios_sharp,
                              color: prevAvailable ? Colors.black : Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 20),
                          !listMaterial[currentIndexMaterial].completed
                              ? Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        isCompleteLoading = true;
                                      });
                                      Materials.completeMaterial(
                                        widget.dataMaterial.id,
                                      ).then((_) {
                                        Topic.getTopic(widget.courseId)
                                            .then((_) {
                                          final List<String> idTopic = Topic
                                              .listTopic
                                              .map((dataTopic) => dataTopic.id)
                                              .toList();
                                          Materials.getMaterial(idTopic)
                                              .then((_) {
                                            updateMaterial();
                                            setState(() {
                                              isCompleteLoading = false;
                                            });
                                          });
                                        });
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: owlDarkBlue,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: const Text(
                                        "Finish This Course",
                                        style: TextStyle(
                                          color: owlBase,
                                          fontSize: 16,
                                          letterSpacing: 1,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                )
                              : Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: owlDarkBlue,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: const Text(
                                      "Completed",
                                      style: TextStyle(
                                        color: owlBase,
                                        fontSize: 16,
                                        letterSpacing: 1,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                          const SizedBox(width: 20),
                          InkWell(
                            onTap: () {
                              if (nextAvailable) {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => MaterialsPage(
                                      dataMaterial: listMaterial[
                                          currentIndexMaterial + 1],
                                      courseId: widget.courseId,
                                      updateCallBack: widget.updateCallBack,
                                    ),
                                  ),
                                );
                              }
                            },
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: nextAvailable ? Colors.black : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          isCompleteLoading
              ? Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
