import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

class Contato extends StatefulWidget {
  @override
  _ContatoState createState() => _ContatoState();
}

class _ContatoState extends State<Contato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COR_PRIMARIA,
      appBar: AppBar(
        backgroundColor: COR_PRIMARIA,
        title: Text("Contato", style: TextStyle(color: COR_TITULO)),
        centerTitle: true,
        brightness: BRILHO,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: COR_TITULO,), onPressed: (){Navigator.pop(context);}),
      ),
      body: Center(
        child: Text("Contato", style: TextStyle(color: COR_TITULO),),
      ),
    );
  }
}