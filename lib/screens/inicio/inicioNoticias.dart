import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/settings/strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ibrcachoeiro/screens/noticias/detalhes_noticias.dart';

class NoticiasBloco extends StatefulWidget {
  @override
  _NoticiasBlocoState createState() => _NoticiasBlocoState();
}

class _NoticiasBlocoState extends State<NoticiasBloco> {
  @override
  Widget build(BuildContext context) {
    return 
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        FutureBuilder(
          future: GET_DADOS(URL_API_NOTICIAS),
          builder: (contex, snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.waiting:
              case ConnectionState.none: return SizedBox();
                /*return Container(
                  width: 200.0,
                  height: 150.0,
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[400]),
                    strokeWidth: 5.0,
                  ),
                );*/
              default:
                if(snapshot.hasError) return SizedBox();
                else return MOSTRAR_NOTICIAS(context, snapshot);
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

Widget MOSTRAR_NOTICIAS(BuildContext context, AsyncSnapshot snapshot){
    int quant = GET_COUNT(snapshot.data["items"]); 
    if(quant == 0){
      return SizedBox();
    } else {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
          height: 20,
        ),
        Row(
          children: <Widget>[
            SizedBox(width: 15,),
            Icon(Icons.chrome_reader_mode),
            SizedBox(width: 15,),
            Text("Notícias", style: TextStyle(fontSize: 20, fontFamily: "Gibson"),),
          ],
        ),
        SizedBox(
          height: 20,
        ),
            Container(
              height: 80.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: quant,
                itemBuilder: (context, index){
                  return Container(
                    height: 80,
                    child: GestureDetector(
                      onTap: () {},
                      child: GestureDetector(
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> DetalhesNoticias(snapshot.data["items"][index])));},
                        child:
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: Color(0xffeff4fe),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.0) //                 <--- border radius here
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                  snapshot.data["items"][index]["title"],
                                  style: TextStyle(
                                    color: Color(0xff102a43),
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                )
                              ],
                            ),
                        )
                      )
                    )
                  );
                }
              ),
            ),
          ],
        )
      );
    }
  }