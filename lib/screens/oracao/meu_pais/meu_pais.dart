import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/settings/colors.dart';
import 'package:share/share.dart';

class MeuPais extends StatefulWidget {
  @override
  _MeuPaisState createState() => _MeuPaisState();
}

class _MeuPaisState extends State<MeuPais> {
  String mensagem = '''A Igreja Batista Renovada quer fazer tudo o que estiver ao nosso alcance para garantir que nossa comunidade esteja tomando as precauções necessárias para retardar a disseminação do COVID-19. Ao mesmo tempo, queremos tornar possível a todos experimentar a irmandade e o ensino bíblico que mantém nossa fé forte, o que é mais importante agora do que nunca.

Com isso em mente, estamos tomando algumas medidas, tais como: Transmissões ao vivo de todos os cultos, manutenção dos cultos com um maior espaço entre as cadeiras e suspensão da EBD.

Esperamos que você se junte a nós presencialmente ou online!''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COR_PRIMARIA,
      appBar: AppBar(
        centerTitle: true,
        brightness: BRILHO,
        backgroundColor: COR_PRIMARIA,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: COR_TITULO,), onPressed: (){Navigator.pop(context);}),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Orando por", style: TextStyle(color: COR_TITULO, fontSize: 15, fontFamily: "Aktiv"),),
            Text("Meu País", style: TextStyle(color: COR_CTA, fontSize: 17, fontFamily: "Gibson"),),
          ],
        ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: (){
            Share.share("Vamos orar pelo nosso país?\n\n$mensagem");
          })
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 30,),
                  Text("Ore pela solicitação", style: TextStyle(color: COR_TITULO, fontSize: 22, fontFamily: "Gibson"), textAlign: TextAlign.left,),
                  SizedBox(height: 5,),
                  Text("IbrCachoeiro", style: TextStyle(color: COR_SUBTITULO, fontSize: 15, fontFamily: "Aktiv", fontWeight: FontWeight.bold,)),
                  SizedBox(height: 25,),
                  Text(mensagem, style: TextStyle(color: COR_TITULO, fontSize: 16, fontFamily: "Aktiv"),),
                  SizedBox(height: 30,),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(20,20,20,10),
            child: FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: (){},
                textColor: COR_TITULO,
                child: Container(
                  width: (MediaQuery.of(context).size.width * 1),
                  height: 50,
                  decoration: BoxDecoration(
                    color: COR_CTA,
                    borderRadius: BorderRadius.all(
                        Radius.circular(50.0)
                    ),
                  ),
                  child: Text(
                    "Eu orei",
                    style: TextStyle(
                        color: COR_CTA_TEXTO
                    ),
                  ),
                  alignment: Alignment.center,
                )
            ),
          )
        ],
      ),
    );
  }
}