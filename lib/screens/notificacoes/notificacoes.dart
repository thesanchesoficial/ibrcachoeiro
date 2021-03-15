import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

class Notificacoes extends StatefulWidget {
  @override
  _NotificacoesState createState() => _NotificacoesState();
}

class _NotificacoesState extends State<Notificacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COR_PRIMARIA,
      appBar: AppBar(
        title: Text("Notificações", style: TextStyle(color: COR_TITULO)),
        centerTitle: true,
        brightness: BRILHO,
        backgroundColor: COR_PRIMARIA,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: COR_TITULO,), onPressed: (){Navigator.pop(context);}),
      ),
      body: Center(
        child: Text("Sem notificações", style: TextStyle(color: COR_TITULO),),
      ),
    );
  }
}