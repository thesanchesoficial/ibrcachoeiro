import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top + 30,
            ),
            Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(20,50,20,20),
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
                      SizedBox(
                        height: 35,
                      ),
                      Text(
                        "Olá, Matheus!", 
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Gibson",
                          color: Colors.black
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        "email@dominio.com.br",
                        style: TextStyle(
                          fontFamily: "Aktiv",
                          fontSize: 16
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 9,
                      ),
                      Text(
                        "28 99999-9999",
                        style: TextStyle(
                          fontFamily: "Aktiv",
                          fontSize: 16
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: new BorderRadius.circular(50.0),
                        child: Image.asset(
                        "assets/images/louvor.jpg",
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: <Widget>[
                  FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Dados cadastrais",
                          style: TextStyle(
                            fontFamily: "Aktiv",
                            fontSize: 16
                          ),
                        ),
                        Icon(Icons.person_outline)
                      ],
                    )
                  ),
                  FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: (){
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>IndexPage()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Vídeo chamada",
                            style: TextStyle(
                                fontFamily: "Aktiv",
                                fontSize: 16
                            ),
                          ),
                          Icon(Icons.person_outline)
                        ],
                      )
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Minhas orações",
                          style: TextStyle(
                            fontFamily: "Aktiv",
                            fontSize: 16
                          ),
                        ),
                        Icon(Icons.phone)
                      ],
                    )
                  ),
                  FlatButton(
                    padding: EdgeInsets.all(0),
                    onPressed: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Minhas ofertas",
                          style: TextStyle(
                            fontFamily: "Aktiv",
                            fontSize: 16
                          ),
                        ),
                        Icon(Icons.payment)
                      ],
                    )
                  ),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}