import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../main.dart';
import 'colors.dart';

class Temas extends StatefulWidget {
  @override
  _TemasState createState() => _TemasState();
}

class _TemasState extends State<Temas> {
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
      body: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
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
                          setState(() {
                            NOTURNO = true;
                            COR_PRIMARIA = Color(0xff000000);
                            COR_SECUNDARIA = Colors.grey[900];
                            COR_TITULO = Colors.white;
                            BRILHO = Brightness.dark;
                            BRILHO2 = Brightness.light;
                            COR_CTA = Color(0xfff9554c);
                          });
                          Navigator.pop(context);
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
                          setState(() {
                            NOTURNO = false;
                            COR_PRIMARIA = Color(0xffebecee);
                            COR_SECUNDARIA = Color(0xffdedede);
                            COR_TITULO = Colors.black;
                            BRILHO = Brightness.light;
                            BRILHO2 = Brightness.dark;
                            COR_CTA = Color(0xff3e7dee);
                          });
                          Navigator.pop(context);
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
    );
  }
}
