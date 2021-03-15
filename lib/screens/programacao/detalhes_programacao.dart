import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

class DetalhesProgramacao extends StatefulWidget {
  Map dados;
  DetalhesProgramacao(this.dados);

  @override
  _DetalhesProgramacaoState createState() => _DetalhesProgramacaoState(dados);
}

class _DetalhesProgramacaoState extends State<DetalhesProgramacao> {
  Map dados;
  _DetalhesProgramacaoState(this.dados);

  @override
  Widget build(BuildContext context) {
    String mensagem;
    if(dados["descricao"] != null){
      mensagem = dados["descricao"];
    }else{
      mensagem = "";
    }
    String imagem = dados["imagem"];
    List url = imagem.split("/");
    String img = "https://static.wixstatic.com/media/"+url[3];
    return Scaffold(
      backgroundColor: COR_PRIMARIA,
      appBar: AppBar(
        backgroundColor: COR_PRIMARIA,
        title: Text(dados["titulo"], style: TextStyle(color: COR_TITULO),),
        centerTitle: true,
        brightness: BRILHO,
        leading: IconButton(
          icon: Icon(Icons.close, color: COR_TITULO),
          onPressed: (){Navigator.pop(context);},
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
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
                      Icon(Icons.alarm, color: COR_TITULO),
                      SizedBox(width: 20,),
                      Text(dados["data"], style: TextStyle(color: COR_TITULO),),
                    ],
                  )
              ),
              SizedBox(height: 20,),
              Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: Hero(
                      tag: dados["titulo"],
                      child: ClipRRect(
                        borderRadius: new BorderRadius.circular(10.0),
                        child: Image.network(
                          img,
                          height: 320,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      )
                  )
              ),
              SizedBox(height: 20,),
              Text(mensagem, style: TextStyle(fontSize: 16, color: COR_TITULO, fontFamily: "Aktiv",),),
              SizedBox(height: 20,),
            ],
          )
      ),
    );
  }
}