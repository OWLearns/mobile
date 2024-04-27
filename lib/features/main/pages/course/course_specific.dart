import 'package:flutter/material.dart';
import '../../../../shared/themes/color.dart';

class CourseSpecificPage extends StatefulWidget {
  const CourseSpecificPage({super.key});

  @override
  State<CourseSpecificPage> createState() => _CourseSpecificPageState();
}

class _CourseSpecificPageState extends State<CourseSpecificPage> {
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
                  child: const Text(
                    'UI/UX Design',
                    style: TextStyle(
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
                    child: const Text(
                      'Asah keahlian desain antarmuka untuk menciptakan pengalaman pengguna yang menarik',
                      style: TextStyle(
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
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'User Experience Research',
                    textAlign: TextAlign.start,
                    style: TextStyle(
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
                    children: [
                      cardTopic(),
                      const SizedBox(width: 10),
                      cardTopic(),
                      const SizedBox(width: 10),
                      cardTopic(),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Text(
                    'User Experience Design',
                    textAlign: TextAlign.start,
                    style: TextStyle(
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
                    children: [
                      cardTopic(),
                      const SizedBox(width: 10),
                      cardTopic(),
                      const SizedBox(width: 10),
                      cardTopic(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardTopic() {
    return Container(
      width: 130,
      height: 160,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          15,
        ),
      ),
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
            "Introduction To UX Research",
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
