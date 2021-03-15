import 'package:flutter/material.dart';

class telasMidia extends StatefulWidget {
  @override
  _telasMidiaState createState() => _telasMidiaState();
}

class _telasMidiaState extends State<telasMidia> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          "Mídia",
          style: TextStyle(
              fontSize: 25
          ),
        ),
      ),
    );
  }
}