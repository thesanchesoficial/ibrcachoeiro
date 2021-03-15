import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/flutter_placeholder_textlines.dart';
import 'package:http/http.dart' as http;
import 'package:ibrcachoeiro/screens/programacao/programacao.dart';
import 'package:ibrcachoeiro/settings/colors.dart';
import 'dart:convert';
import 'package:ibrcachoeiro/settings/strings.dart';

class ProgramacaoBloco extends StatefulWidget {
  @override
  _ProgramacaoBlocoState createState() => _ProgramacaoBlocoState();
}

class _ProgramacaoBlocoState extends State<ProgramacaoBloco> {
  @override
  Widget build(BuildContext context) {
    return 
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 10,
        ),
        FutureBuilder(
          future: GET_DADOS(URL_API_PROGRAMACAO),
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
          height: 20,
        ),
        FutureBuilder(
          future: GET_DADOS(URL_API_EVENTOS),
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
      ],
    );
  }
}

int GET_COUNT(List data){
  if(data != null){
    return data.length;
  }else {
    return 0;
  }
}

Future<Map> GET_DADOS(url) async {
  http.Response response;
  response = await http.get(URL_PATH_API + url);
  return json.decode(response.body);
}


animado(){
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: Row(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(left: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            width: 230,
            decoration: BoxDecoration(
              color: COR_SECUNDARIA,
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0) //                 <--- border radius here
              ),
            ),
            height: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PlaceholderLines(
                  count: 3,
                  animate: true,
                  color: Colors.grey,
                  maxOpacity: 0.4,
                  minOpacity: 0.4,
                  maxWidth: 1,
                ),
              ],
            )
        ),
        Container(
            margin: EdgeInsets.only(left: 20),
            padding: EdgeInsets.symmetric(horizontal: 15),
            width: 230,
            decoration: BoxDecoration(
              color: COR_SECUNDARIA,
              borderRadius: BorderRadius.all(
                  Radius.circular(10.0) //                 <--- border radius here
              ),
            ),
            height: 130,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                PlaceholderLines(
                  count: 3,
                  animate: true,
                  color: Colors.grey,
                  maxOpacity: 0.4,
                  minOpacity: 0.4,
                  maxWidth: 1,
                ),
              ],
            )
        ),
      ],
    ),
  );
}