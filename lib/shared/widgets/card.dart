import 'package:flutter/material.dart';
import 'package:mobile/features/main/pages/course/topic_page.dart';

class CourseCard extends StatelessWidget {
  final int id;
  final String manyTopics;
  final String image;
  final String label;
  const CourseCard({
    super.key,
    required this.manyTopics,
    required this.image,
    required this.label,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 6),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TopicPage(
                id: id,
                nameCourse: label,
              ),
            ),
          );
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
                colors: [Color(0xff606DD9), Color(0xff387ADF)]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 8),
                        child: Row(
                          children: [
                            Image.asset('assets/card/bookLogo.png'),
                            const SizedBox(width: 5),
                            Text("$manyTopics topics"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/card/$image.png',
                      height: 130,
                      width: 130,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        label,
                        style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AnswerCard extends StatefulWidget {
  final String text;
  final bool isSelected;
  final Function(bool) onPressed;

  const AnswerCard(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onPressed});

  @override
  State<AnswerCard> createState() => AnswerCardState();
}

class AnswerCardState extends State<AnswerCard> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 4,
        backgroundColor: const Color(0xffffffff),
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: const Color(0xffA5C7D3).withOpacity(1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        side: BorderSide(
            width: 1.5,
            color: widget.isSelected
                ? const Color(0xff387ADF)
                : Colors.transparent),
      ),
      onPressed: () {
        widget.onPressed(!widget.isSelected);
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          widget.text,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w400,
              color: widget.isSelected ? const Color(0xff387ADF) : Colors.black),
        ),
      ),
    );
  }
}
