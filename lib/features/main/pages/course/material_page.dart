import 'package:flutter/material.dart';
import 'package:mobile/shared/themes/color.dart';

class MaterialPage extends StatefulWidget {
  const MaterialPage({super.key});

  @override
  State<MaterialPage> createState() => _MaterialPageState();
}

class _MaterialPageState extends State<MaterialPage> {
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
                      'Topic',
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
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12),
                    ),
                  ),
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
                const Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Vivamus at augue eget arcu dictum varius duis at consectetur.",
                  style: TextStyle(
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
