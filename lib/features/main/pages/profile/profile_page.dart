import 'package:flutter/material.dart';
import 'package:mobile/features/main/pages/profile/editprofile_page.dart';
import 'package:mobile/shared/themes/color.dart';
import 'package:mobile/shared/utils/token_handler.dart';
import 'package:mobile/shared/utils/user.dart';
import 'package:mobile/shared/widgets/card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    getUserInformation();
  }

  void getUserInformation() async {
    final tokenJWT = await Token.getToken();
    UserAccess.getUser(tokenJWT!).then((_) {
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
        child: ListView(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                Positioned(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xff333A73), Color(0xff606DD9)])),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.05,
                  top: MediaQuery.of(context).size.height * 0.25 -
                      MediaQuery.of(context).size.height * 0.25 / 2,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9999),
                    ),
                    child: Image.asset(
                      'assets/sophia.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.26,
                  right: MediaQuery.of(context).size.width * 0.05,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const EditProfilePage(),
                          ));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                                width: 1, color: const Color(0xff387ADF)),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: const Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Color(0xff387ADF),
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      InkWell(
                        onTap: () {
                          UserAccess.userLogOut().then((_) {
                            Navigator.of(context)
                                .pushReplacementNamed('/login');
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              width: 1,
                              color: Colors.red,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: const Text(
                            'Log Out',
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        UserAccess.username,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/level.png',
                            width: 30,
                            height: 30,
                          ),
                          Positioned(
                            top: 5,
                            child: Text(
                              UserAccess.level,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    "Hi, i’m a product designer specialized  in user interface with 10 years of exprience.",
                  ),
                  Row(
                    children: [
                      Image.asset(
                        "assets/location.png",
                        width: 20,
                        height: 20,
                      ),
                      const Text(" Jakarta, Indonesia"),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Row(
                    children: [
                      Text(
                        "57 ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Followers"),
                      SizedBox(width: 10),
                      Text(
                        "26 ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("Following"),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Achievements',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: const Text(
                            "Future Developer",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: const Text(
                            "Future Developer",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: const Text(
                            "Future Developer",
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Statistics',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Course Completed"),
                          Text("Material Completed"),
                          Text("Quiz Completed"),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Column(
                        children: [
                          Text(
                            UserAccess.courseComplete,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            UserAccess.materialComplete,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            UserAccess.quizComplete,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 40),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Topic Completed"),
                          Text("Quiz Points"),
                          Text("Mission Completed"),
                        ],
                      ),
                      const SizedBox(width: 15),
                      Column(
                        children: [
                          Text(
                            UserAccess.topicComplete,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            UserAccess.quizPoint,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "8",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    'Pelajari Kursus Lainnya',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
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
          ],
        ),
      ),
    );
  }
}
