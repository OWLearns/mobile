import 'package:flutter/material.dart';
import 'package:mobile/features/main/pages/course/material_model.dart';
import 'package:mobile/features/main/pages/course/material_page.dart';
import 'package:mobile/features/main/pages/course/topic_model.dart';
import 'package:mobile/features/main/pages/quiz/quiz_pre_page.dart';
import '../../../../shared/themes/color.dart';

class TopicPage extends StatefulWidget {
  final int id;
  final String nameCourse;
  final String descCourse;
  const TopicPage({
    super.key,
    required this.id,
    required this.nameCourse,
    required this.descCourse,
  });

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  @override
  void initState() {
    super.initState();
    Topic.getTopic(widget.id).then((_) {
      final List<String> idTopic =
          Topic.listTopic.map((dataTopic) => dataTopic.id).toList();
      Materials.getMaterial(idTopic).then((_) {
        if (mounted) {
          setState(() {});
        }
      });
    });
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
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                    const Text(
                      'Course',
                      style: TextStyle(
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Icon(
                      Icons.arrow_back_ios,
                      color: owlBase,
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Center(child: Image.asset('assets/card/uiLogo.png')),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    widget.nameCourse,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      widget.descCourse,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'Learning Path',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 15),
                Column(
                  children: Topic.listTopic
                      .map((data) => topicRow(data.name, data.id))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget topicRow(String title, String id) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              letterSpacing: 0,
            ),
          ),
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...Materials.listMaterial
                  .where((data) => data.topicId == id)
                  .map((data) => cardTopic(data))
                  .toList(),
              quizCard(id, title),
            ],
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget cardTopic(data) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        width: 130,
        height: 160,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MaterialsPage(
                  dataMaterial: data,
                ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/card/pmLogo.png',
                width: 120,
                height: 70,
              ),
              const SizedBox(height: 10),
              Text(
                data.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget quizCard(String topicId, String topicName) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Container(
        width: 130,
        height: 160,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            15,
          ),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => QuizPrePage(
                  topicId: topicId,
                  topicName: topicName,
                ),
              ),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/card/pmLogo.png',
                width: 120,
                height: 70,
              ),
              const SizedBox(height: 10),
              const Text(
                "Quiz",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
