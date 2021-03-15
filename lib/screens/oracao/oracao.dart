import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/settings/colors.dart';
import 'package:ibrcachoeiro/screens/oracao/meu_pais/meu_pais.dart';
import 'package:ibrcachoeiro/screens/oracao/meus_grupos/meus_grupos.dart';
import 'package:ibrcachoeiro/screens/oracao/minha_igreja/minha_igreja.dart';
import 'package:ibrcachoeiro/screens/oracao/pedir_oracao/pedir_oracao.dart';

class Oracao extends StatefulWidget {
  @override
  _OracaoState createState() => _OracaoState();
}

class _OracaoState extends State<Oracao> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COR_PRIMARIA,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top + 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(30),
              width: (MediaQuery.of(context).size.width),
              decoration: BoxDecoration(
                color: COR_SECUNDARIA,
                borderRadius: BorderRadius.all(
                    Radius.circular(20.0) //                 <--- border radius here
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Peça oração", 
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: "Gibson",
                      color: COR_TITULO
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Compartilhe um pedido de oração anonimamente ou em público com sua família da IbrCachoeiro.",
                    style: TextStyle(
                      fontFamily: "Aktiv",
                      fontSize: 16,
                        color: COR_TITULO
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> PedirOracao()));},
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
                        "Add pedido de oração",
                        style: TextStyle(
                          color: COR_CTA_TEXTO
                        ),
                      ),
                      alignment: Alignment.center,
                    )
                  ),
                ],
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Ore pelos outros", 
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: "Gibson",
                  color: COR_TITULO
                ),
              ),
            ),
            SizedBox(height: 20,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  SizedBox(width: 20,),
                  item("Minha Igreja", context, MinhaIgreja(), "assets/images/louvor.jpg"),
                  SizedBox(width: 10,),
                  item("Meus Grupos", context, MeusGrupos(), "assets/images/celulas.jpg"),
                  SizedBox(width: 10,),
                  item("Meu País", context, MeuPais(), "assets/images/pais.jpg"),
                  SizedBox(width: 20,),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

item(nome, context, page, img){
  return GestureDetector(
    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>page));},
    child: Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: new BorderRadius.circular(20.0),
          child: Image.asset(
            img,
            height: 180,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          padding: EdgeInsets.all(30),
          height: 180,
          width: 150,
          decoration: BoxDecoration(
            color: Color(0x793167eb),
            borderRadius: BorderRadius.all(
                Radius.circular(20.0) //                 <--- border radius here
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(nome, style: TextStyle(color: COR_CTA_TEXTO, fontFamily: "Gibson", fontSize: 20, fontWeight: FontWeight.w100), textAlign: TextAlign.left,),
            ],
          )
        ),
      ],
    )
  );
}