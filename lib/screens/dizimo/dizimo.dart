import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/screens/dizimo/widgets/opcoes_dizimos.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

class Dizimo extends StatefulWidget {
  @override
  _DizimoState createState() => _DizimoState();
}

class _DizimoState extends State<Dizimo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COR_PRIMARIA,
      appBar: AppBar(
        title: Text(
          "Dízimos e ofertas",
          style: TextStyle(
            color: COR_TITULO,
          ),
        ),
        brightness: BRILHO,
        backgroundColor: COR_PRIMARIA,
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: COR_TITULO,), onPressed: (){Navigator.pop(context);}),
      ),
      body: OpcoesDizimos()
    );
  }
}