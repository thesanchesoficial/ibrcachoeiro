import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibrcachoeiro/screens/biblia/widgets/exibir_livros.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

class LivrosBiblia extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: TRANSPARENTE,
      systemNavigationBarColor: COR_PRIMARIA,
      statusBarBrightness: BRILHO,
      systemNavigationBarIconBrightness: BRILHO,
    ));
    return Scaffold(
        backgroundColor: COR_PRIMARIA,
        appBar: AppBar(
          backgroundColor: COR_PRIMARIA,
          title: Text(
            "Bíblia",
            style: TextStyle(
                color: COR_TITULO
            ),
          ),
          brightness: BRILHO,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.sort_by_alpha),
                color: COR_TITULO,
                onPressed: (){}
            ),
          ],
        ),
        body: Leitura()
    );
  }
}