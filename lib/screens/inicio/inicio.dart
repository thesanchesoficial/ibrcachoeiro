import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibrcachoeiro/repositories/database.dart';
import 'package:ibrcachoeiro/settings/colors.dart';
import 'package:ibrcachoeiro/settings/strings.dart';
import 'package:ibrcachoeiro/screens/inicio/inicioNoticias.dart';
import 'package:ibrcachoeiro/screens/inicio/inicioProgramacao.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class telasInicio extends StatefulWidget {
  @override
  _telasInicioState createState() => _telasInicioState();
}
Future<Map> GET_DADOS(url) async {
  http.Response response;
  response = await http.get(URL_PATH_API + url);
  return json.decode(response.body);
}
class _telasInicioState extends State<telasInicio> {


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
      appBar: AppBar(
        brightness: BRILHO,
        title: Container(
          child: Row(
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
        ),
        backgroundColor: COR_PRIMARIA,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //EstamosAoVivo(),
            NoticiasBloco(),
            ProgramacaoBloco(),
            SizedBox(height: 10,),
          ],
        ),
      )
    );
  }
}