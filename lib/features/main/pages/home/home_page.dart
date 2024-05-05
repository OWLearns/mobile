import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/color.dart';
import 'package:mobile/shared/widgets/card.dart';
import 'package:mobile/shared/widgets/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController searchController = TextEditingController();

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
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Selamat Pagi,",
                        style: TextStyle(
                          color: Color(0xff387ADF),
                        ),
                      ),
                      Text(
                        "Cillian Murphy!",
                        style: TextStyle(
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
                'Kursus',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 10),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CourseCard(
                      manyTopics: '6',
                      image: 'pmLogo',
                      label: 'Project Manager',
                      id: 1,
                      desc: 'test123',
                    ),
                    SizedBox(width: 10),
                    CourseCard(
                      manyTopics: '7',
                      image: 'uiLogo',
                      label: 'UI/UX Design',
                      id: 1,
                      desc: 'test123',
                    ),
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
