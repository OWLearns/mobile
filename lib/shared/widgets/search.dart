import 'package:flutter/material.dart';

class SearchWidget extends StatefulWidget {
  final TextEditingController searchController;

  const SearchWidget({required this.searchController, super.key});

  @override
  State<SearchWidget> createState() => SearchWidgetState();
}

class SearchWidgetState extends State<SearchWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.searchController,
      decoration: const InputDecoration(
        isDense: true,
        contentPadding: EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 0.3,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              26,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 0.3,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(
              26,
            ),
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 15),
          child: Icon(
            Icons.search,
            size: 24,
          ),
        ),
        hintText: 'Cari Materi, Topik, dan Lainnya',
        hintStyle: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
