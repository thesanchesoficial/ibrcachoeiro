import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/settings/colors.dart';
import 'package:share/share.dart';

class DetalhesNoticias extends StatefulWidget {
  Map dados;
  DetalhesNoticias(this.dados);
  @override
  _DetalhesNoticiasState createState() => _DetalhesNoticiasState(dados);
}

class _DetalhesNoticiasState extends State<DetalhesNoticias> {
  Map dados;
  _DetalhesNoticiasState(this.dados);
  @override
  Widget build(BuildContext context) {
    String mensagem;
    if(dados["mensagem"] != null){
      mensagem = dados["mensagem"];
    }else{
      mensagem = "";
    }
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(dados["title"], style: TextStyle(color: COR_TITULO),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: (){Navigator.pop(context);},
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15,0,15,15),
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: COR_SECUNDARIA,
                borderRadius: BorderRadius.all(
                    Radius.circular(8.0) //                 <--- border radius here
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.alarm),
                  SizedBox(width: 20,),
                  Text(dados["data"]),
                ],
              )
            ),
            SizedBox(height: 20,),
            Text(mensagem, style: TextStyle(fontSize: 16),)
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          String tema = dados["title"];
          String dia = dados["data"];
          Share.share("$tema\n\n$mensagem\n\nPublicado dia $dia");},
        child: Icon(Icons.share),
      ),
    );
  }
}