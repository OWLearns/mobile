import 'package:flutter/material.dart';
import 'package:mobile/features/main/pages/course/course_model.dart';
import 'package:mobile/features/main/pages/course/topic_page.dart';
import 'package:mobile/shared/themes/color.dart';
import 'package:mobile/shared/utils/user.dart';
import 'package:mobile/shared/widgets/card.dart';
import 'package:mobile/shared/widgets/search.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Course.getCourse().then((_) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: owlBase,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              const Text(
                'Course',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              SearchWidget(searchController: searchController),
              const SizedBox(height: 20),
              const Text(
                'Sedang Dipelajari',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 15),
              UserAccess.ongoingCourse.isEmpty
                  ? const Text("No Course Yet")
                  : Column(
                      children: UserAccess.ongoingCourse
                          .where((dataCourse) =>
                              dataCourse["total_materials"] != 0)
                          .map((dataCourse) => cardOngoing(dataCourse))
                          .toList(),
                    ),
              const SizedBox(height: 15),
              const Text(
                'Kursus',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: Course.listCourse
                      .map((data) => CourseCard(
                            manyTopics: (data.topic).toString(),
                            image: data.image,
                            label: data.name,
                            desc: data.desc,
                            id: data.id,
                          ))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardOngoing(dataCourse) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TopicPage(
              id: dataCourse["id"],
              nameCourse: dataCourse["name"],
              descCourse: dataCourse["description"],
            ),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(
              10,
            ),
          ),
        ),
        child: Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(10),
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.1,
              padding: const EdgeInsets.all(10),
              child: Image.network(
                dataCourse["image"],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.horizontal(
                    right: Radius.circular(10),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          dataCourse["name"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            Image.asset(
                              'assets/card/bookLogo.png',
                            ),
                            const SizedBox(width: 5),
                            Text(
                              dataCourse["total_topics"].toString(),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      dataCourse["description"],
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 4,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(24),
                            ),
                            color: Colors.grey,
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.bottomLeft,
                            widthFactor: (dataCourse["completed_materials"] /
                                dataCourse["total_materials"]),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'a',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.transparent,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        FittedBox(
                          child: Text(
                            "${(dataCourse["completed_materials"] / dataCourse["total_materials"] * 100).floor()}%",
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
