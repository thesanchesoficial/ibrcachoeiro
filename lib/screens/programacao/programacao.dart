import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibrcachoeiro/screens/programacao/detalhes_programacao.dart';
import 'package:ibrcachoeiro/settings/colors.dart';
import 'package:ibrcachoeiro/settings/strings.dart';
import 'package:http/http.dart' as http;

class Programacao extends StatefulWidget {
  @override
  _ProgramacaoState createState() => _ProgramacaoState();
}

class _ProgramacaoState extends State<Programacao> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: TRANSPARENTE,
      systemNavigationBarColor: Color(0xffebecee),
      statusBarBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Color(0xffebecee),
      appBar: AppBar(
        backgroundColor: Color(0xffebecee),
        title: Text("Programação", style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,), onPressed: (){Navigator.pop(context);},),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: <Widget>[
            FutureBuilder(
              future: GET_DADOS(URL_API_PROGRAMACAO),
              builder: (contex, snapshot){
                switch(snapshot.connectionState){
                  case ConnectionState.waiting:
                  case ConnectionState.none: return SizedBox();
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
        ),
      ),
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

Widget MOSTRAR_PROGRAMACAO(BuildContext context, AsyncSnapshot snapshot){
  int quant = GET_COUNT(snapshot.data["items"]);
  if(quant == 0){
    return SizedBox();
  } else {
    return Container(
        height: 130.0,
        child: ListView.builder(
            padding: EdgeInsets.only(right: 20, left: 10),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: quant,
            itemBuilder: (context, index){
              return Container(
                  height: 130,
                  child: GestureDetector(
                      onTap: () {},
                      child: Stack(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            width: 230,
                            decoration: BoxDecoration(
                              color: COR_CTA,
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0) //                 <--- border radius here
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Text(
                                  snapshot.data["items"][index]["data"],
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  snapshot.data["items"][index]["title"],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  snapshot.data["items"][index]["desc"],
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                  )
              );
            }
        ),
    );
  }
}

class HexColor extends Color {
  HexColor(int value) : super(value);

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  static Color fromHex2(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('99');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
  static Color fromHex3(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('33');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

Widget MOSTRAR_EVENTOS(BuildContext context, AsyncSnapshot snapshot){
  int quant = GET_COUNT(snapshot.data["items"]);
  if(quant == 0){
    return SizedBox();
  } else {
    return Container(
      height: 340.0 * quant,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: quant,
          itemBuilder: (context, index){
            Color color = HexColor.fromHex(snapshot.data["items"][index]["cor"]);
            Color color2 = HexColor.fromHex2(snapshot.data["items"][index]["cor"]);
            Color color3 = HexColor.fromHex3(snapshot.data["items"][index]["cor"]);
            String imagem = snapshot.data["items"][index]["imagem"];
            List url = imagem.split("/");
            String img = "https://static.wixstatic.com/media/"+url[3];
            return Stack(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(bottom: 20),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Hero(
                        tag: snapshot.data["items"][index]["titulo"],
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
                GestureDetector(
                  onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> DetalhesProgramacao(snapshot.data["items"][index])));},
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [color, color2, color3],
                        tileMode: TileMode.clamp,
                      ),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 320,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 15),
                              height: 30,
                              decoration: BoxDecoration(
                                color: Color(0x77e5e5e5),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(50.0)
                                ),
                              ),
                              child: Text(
                                snapshot.data["items"][index]["tipo"],
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              ),
                              alignment: Alignment.center,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data["items"][index]["titulo"],
                          style: TextStyle(
                              fontFamily: "Gibson",
                              fontSize: 30,
                              color: Colors.white
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          snapshot.data["items"][index]["data"],
                          style: TextStyle(
                              color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          }
      ),
    );
  }
}