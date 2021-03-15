import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibrcachoeiro/main.dart';
import 'package:ibrcachoeiro/repositories/database.dart';
import 'package:ibrcachoeiro/screens/inicio/inicio.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

class Abertura extends StatefulWidget {
  @override
  _AberturaState createState() => _AberturaState();
}

_executar(dados) async{
  var db = await INICIAR_DATABASE();
  await INSERT_DATABASE(db, dados);
  await FECHAR_DATABASE(db);
}

bool modo = true;

class _AberturaState extends State<Abertura> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: TRANSPARENTE,
      systemNavigationBarColor: COR_PRIMARIA,
      statusBarBrightness: BRILHO,
      systemNavigationBarIconBrightness: BRILHO2,
    ));
    return Scaffold(
      backgroundColor: COR_PRIMARIA,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: <Widget>[
         Container(
           child: Column(
             children: <Widget>[
               SizedBox(
                 height: MediaQuery.of(context).padding.top,
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: <Widget>[
                   Image.asset(
                     "assets/images/icon.png",
                     width: 35,
                   ),
                   Padding(padding: EdgeInsets.only(left: 10),),
                   Text(
                     "Batista Renovada",
                     style: TextStyle(
                         color: COR_TITULO,
                         fontSize: 19
                     ),
                   ),
                 ],
               ),
             ],
           )
         ),
         Center(
           child: SingleChildScrollView(
             child: Column(
               children: <Widget>[
                 Text(
                   "Olá, obrigado por instalar nosso aplicativo! Estamos felizes em te ver por aqui :D",
                   style: TextStyle(
                       fontSize: 25,
                       color: COR_TITULO,
                       fontFamily: "Gibson"
                   ),
                   textAlign: TextAlign.center,
                 ),
                 SizedBox(
                   height: 40,
                 ),
                 Text(
                   "Vamos escolher um tema para o aplicativo",
                   style: TextStyle(
                       fontFamily: "Aktiv",
                       fontSize: 15,
                       color: COR_TITULO
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: <Widget>[
                     GestureDetector(
                       onTap: (){
                         modo = false;
                         setState(() {
                           NOTURNO = true;
                           COR_PRIMARIA = Color(0xff000000);
                           COR_SECUNDARIA = Colors.grey[900];
                           COR_TITULO = Colors.white;
                           BRILHO = Brightness.dark;
                           BRILHO2 = Brightness.light;
                           COR_CTA = Color(0xfff9554c);
                         });
                       },
                       child: Container(
                         width: (MediaQuery.of(context).size.width * 0.4),
                         height: (MediaQuery.of(context).size.width * 0.4),
                         decoration: BoxDecoration(
                           color: Colors.grey[900],
                           borderRadius: BorderRadius.all(Radius.circular(15)),
                         ),
                         child: Center(
                           child: Text(
                             "Escuro",
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 20
                             ),
                           ),
                         ),
                       ),
                     ),
                     GestureDetector(
                       onTap: (){
                         modo = true;
                         setState(() {
                           NOTURNO = false;
                           COR_PRIMARIA = Color(0xffebecee);
                           COR_SECUNDARIA = Color(0xffdedede);
                           COR_TITULO = Colors.black;
                           BRILHO = Brightness.light;
                           BRILHO2 = Brightness.dark;
                           COR_CTA = Color(0xff3e7dee);
                         });
                       },
                       child: Container(
                         width: (MediaQuery.of(context).size.width * 0.4),
                         height: (MediaQuery.of(context).size.width * 0.4),
                         decoration: BoxDecoration(
                           color: Colors.white,
                           borderRadius: BorderRadius.all(Radius.circular(15)),
                         ),
                         child: Center(
                           child: Text(
                             "Claro",
                             style: TextStyle(
                                 color: Colors.black,
                                 fontSize: 20
                             ),
                           ),
                         ),
                       ),
                     )
                   ],
                 ),
               ],
             ),
           ),
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: <Widget>[
             FlatButton(
               padding: EdgeInsets.symmetric(horizontal: 20),
               onPressed: () async {
                 if(modo){
                   await _executar(0);
                 } else {
                   await _executar(1);
                 }
                 Navigator.pushAndRemoveUntil(
                   context,
                   MaterialPageRoute(builder: (context) => App()),
                       (Route<dynamic> route) => false,
                 );
               },
               child: Text(
                 "Começar",
                 style: TextStyle(
                   color: AZUL_ESCURO,
                   fontSize: 20
                 ),
               ),
             ),
           ],
         )
       ],
      )
    );
  }
}
