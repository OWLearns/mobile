import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile/features/main/pages/course/course_model.dart';
import 'package:mobile/shared/themes/color.dart';
import 'package:mobile/shared/utils/user.dart';
import 'package:mobile/shared/widgets/card.dart';
import 'package:mobile/shared/widgets/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();
  late CourseCard? course1;
  late CourseCard? course2;

  @override
  void initState() {
    setState(() {});
    super.initState();

    Course.listCourse.isEmpty
        ? Course.getCourse().then((_) {
            if (mounted) {
              setState(() {
                randomizeCourse();
              });
            }
          })
        : randomizeCourse();
  }

  void randomizeCourse() {
    Random random = Random();
    int index1 = random.nextInt(Course.listCourse.length);
    int index2;

    do {
      index2 = random.nextInt(Course.listCourse.length);
    } while (index2 == index1);

    course1 = CourseCard(
      manyTopics: Course.listCourse[index1].topic.toString(),
      image: Course.listCourse[index1].image,
      label: Course.listCourse[index1].name,
      id: Course.listCourse[index1].id,
      desc: Course.listCourse[index1].desc,
    );

    course2 = CourseCard(
      manyTopics: Course.listCourse[index2].topic.toString(),
      image: Course.listCourse[index2].image,
      label: Course.listCourse[index2].name,
      id: Course.listCourse[index2].id,
      desc: Course.listCourse[index2].desc,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: owlBase,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Selamat Pagi,",
                        style: TextStyle(
                          color: Color(0xff387ADF),
                        ),
                      ),
                      Text(
                        UserAccess.username,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Image.asset("assets/home/bell.png")
                ],
              ),
              const SizedBox(height: 20),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Color(0xff606DD9), Color(0xff387ADF)]),
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          40,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 25),
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.6 - 45,
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Apa yang ingin anda pelajari?",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Kuasai skill IT, bangun portofolio dan siap untuk membangun karir",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: MediaQuery.of(context).size.width * 0.425,
                    top: MediaQuery.of(context).size.width * -0.02,
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width * 0.4 - 45,
                      child: Image.asset(
                        "assets/home/logoTeacher.png",
                        width: 200,
                        // height: 1000,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              SearchWidget(searchController: searchController),
              const SizedBox(height: 20),
              const Text(
                "Terakhir dipelajari",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          15,
                        ),
                      ),
                      border: Border.all(
                        color: const Color(0xffC2C2C2),
                        width: 0.7,
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Image.asset("assets/home/topicLogo.png"),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Topik: Front End - HTML"),
                            Row(
                              children: [
                                Image.asset("assets/home/penLogo.png"),
                                const Text(
                                  " 49 Materi",
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )),
              const SizedBox(height: 20),
              const Text(
                'Rekomendasi Kursus Untukmu',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    course1 ?? const SizedBox(),
                    const SizedBox(width: 10),
                    course2 ?? const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
