import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Text("Search"),
      ),
    );
  }
}
