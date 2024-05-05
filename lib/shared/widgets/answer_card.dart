import 'package:flutter/material.dart';

class AnswerCard extends StatefulWidget {
  final String text;
  final bool isSelected;
  final Function(bool) onPressed;

  const AnswerCard({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onPressed,
  });

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
              color:
                  widget.isSelected ? const Color(0xff387ADF) : Colors.black),
        ),
      ),
    );
  }
}
