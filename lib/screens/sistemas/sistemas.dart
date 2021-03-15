//import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibrcachoeiro/settings/colors.dart';
import 'package:ibrcachoeiro/screens/dizimo/dizimo.dart';
import 'package:ibrcachoeiro/screens/igreja/contato.dart';
import 'package:ibrcachoeiro/screens/igreja/cremos.dart';
import 'package:ibrcachoeiro/screens/igreja/historia.dart';
import 'package:ibrcachoeiro/screens/notificacoes/notificacoes.dart';
import 'package:ibrcachoeiro/settings/temas.dart';
import 'package:share/share.dart';

class telasSistemas extends StatefulWidget {
  @override
  _telasSistemasState createState() => _telasSistemasState();
}

class _telasSistemasState extends State<telasSistemas> {
  String barcode = "";
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
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top + 30,
            ),
            /*Stack(
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
                        "Membro Online",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Gibson",
                          color: COR_TITULO
                        ),
                      ),
                      SizedBox(
                        height: 22,
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> Perfil()));},
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
                            "Acessar portal",
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
            ),*/
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    "Recursos",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 30, fontFamily: "Gibson", color: COR_TITULO),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Dizimo()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Dízimos e ofertas",
                            style: TextStyle(
                                fontFamily: "Aktiv",
                                fontSize: 16,
                                color: COR_TITULO),
                          ),
                          Icon(Icons.payment, color: COR_TITULO)
                        ],
                      )),
                  FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Leitor de QR Code",
                            style: TextStyle(
                                fontFamily: "Aktiv",
                                fontSize: 16,
                                color: COR_TITULO),
                          ),
                          Icon(Icons.camera, color: COR_TITULO)
                        ],
                      )),
                  FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Temas()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Tema",
                            style: TextStyle(
                                fontFamily: "Aktiv",
                                fontSize: 16,
                                color: COR_TITULO),
                          ),
                          Icon(Icons.brightness_4, color: COR_TITULO)
                        ],
                      )
                  ),
                  FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Contato()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Contato",
                            style: TextStyle(
                                fontFamily: "Aktiv",
                                fontSize: 16,
                                color: COR_TITULO),
                          ),
                          Icon(Icons.phone, color: COR_TITULO)
                        ],
                      )),
                  FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Notificacoes()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Notificações",
                            style: TextStyle(
                                fontFamily: "Aktiv",
                                fontSize: 16,
                                color: COR_TITULO),
                          ),
                          Icon(Icons.notifications_none, color: COR_TITULO)
                        ],
                      )),
                  FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Historia()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Nossa história",
                            style: TextStyle(
                                fontFamily: "Aktiv",
                                fontSize: 16,
                                color: COR_TITULO),
                          ),
                          Icon(Icons.history, color: COR_TITULO)
                        ],
                      )),
                  FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Cremos()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "O que cremos",
                            style: TextStyle(
                                fontFamily: "Aktiv",
                                fontSize: 16,
                                color: COR_TITULO),
                          ),
                          Icon(Icons.language, color: COR_TITULO)
                        ],
                      )),
                  FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        Share.share("App ibrcachoeiro");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Compartilhar app",
                            style: TextStyle(
                                fontFamily: "Aktiv",
                                fontSize: 16,
                                color: COR_TITULO),
                          ),
                          Icon(Icons.share, color: COR_TITULO)
                        ],
                      )
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  /*Future scan() async {
    try {
      String barcode = await BarcodeScanner.scan();
      setState(() => this.barcode = barcode);
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          this.barcode = 'Você não permitiu o acesso a câmera!';
        });
      } else {
        setState(() => this.barcode = 'Erro desconhecido: $e');
      }
    } on FormatException{
      setState(() => this.barcode = 'Nulo, você apertou o botão de voltar');
    } catch (e) {
      setState(() => this.barcode = 'Erro desconhecido: $e');
    }
  }*/

}
