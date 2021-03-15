import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/screens/inicio/widgets/estamosAoVivo.dart';
import 'package:ibrcachoeiro/screens/programacao/programacao.dart';
import 'package:ibrcachoeiro/settings/colors.dart';
import 'package:ibrcachoeiro/screens/inicio/inicioNoticias.dart';
import 'package:ibrcachoeiro/screens/inicio/inicioProgramacao.dart';
import 'package:ibrcachoeiro/settings/strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Inicio extends StatefulWidget {
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  Future programacao;
  Future eventos;
  Future noticias;

  @override
  void initState() {
    super.initState();
    noticias = GET_DADOS(URL_API_NOTICIAS);
    programacao = GET_DADOS(URL_API_PROGRAMACAO);
    eventos = GET_DADOS(URL_API_EVENTOS);
  }

  Future<Map> GET_DADOS(url) async {
    http.Response response;
    response = await http.get(URL_PATH_API + url);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
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
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: programacao,
                builder: (contex, snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.waiting:
                    case ConnectionState.none: return animado();
                    default:
                      if(snapshot.hasError) return SizedBox();
                      else return MOSTRAR_PROGRAMACAO(context, snapshot);
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: noticias,
                builder: (contex, snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.waiting:
                    case ConnectionState.none: return SizedBox();
                    default:
                      if(snapshot.hasError) return SizedBox();
                      else return MOSTRAR_NOTICIAS(context, snapshot);
                  }
                },
              ),
              EstamosAoVivo(),
              SizedBox(
                height: 10,
              ),
              FutureBuilder(
                future: eventos,
                builder: (contex, snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.waiting:
                    case ConnectionState.none: return SizedBox();
                    default:
                      if(snapshot.hasError) return SizedBox();
                      else return MOSTRAR_EVENTOS(context, snapshot);
                  }
                },
              ),
              SizedBox(height: 10,),
            ],
          ),
        )
    );
  }
}