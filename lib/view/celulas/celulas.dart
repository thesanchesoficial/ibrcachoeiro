import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ibrcachoeiro/screens/celulas/widgets/bs_opcoes.dart';
import 'package:ibrcachoeiro/settings/colors.dart';
import 'package:ibrcachoeiro/screens/celulas/buscar/buscar.dart';
import 'package:ibrcachoeiro/screens/inicio/inicioNoticias.dart';

class Celulas extends StatefulWidget {
  @override
  _CelulasState createState() => _CelulasState();
}

class _CelulasState extends State<Celulas> {
  String _search = "";
  String _filtro = "";

  Future<Map> GET_DADOS() async {
    http.Response response;

    if(_search == "" && _filtro == "")
      response = await http.get("https://www.ibrcachoeiro.com.br/_functions/celulas/");
    else if(_search == "" && _filtro != "")
      response = await http.get("https://www.ibrcachoeiro.com.br/_functions/celulas//$_filtro");
    else if (_search != "" && _filtro != "")
      response = await http.get("https://www.ibrcachoeiro.com.br/_functions/celulas/$_search/$_filtro");
    else if (_search != "" && _filtro == "")
      response = await http.get("https://www.ibrcachoeiro.com.br/_functions/celulas/$_search");

    return json.decode(response.body);
  }

  Future celulas;

  @override
  void initState() {
    super.initState();
    celulas = GET_DADOS();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: COR_PRIMARIA,
        appBar: AppBar(
          backgroundColor: COR_PRIMARIA,
          title: Text(
            "Células",
            style: TextStyle(
              color: COR_TITULO,
            ),
          ),
          brightness: BRILHO,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search, color: COR_TITULO),
                onPressed: () async {
                  String resultado = await showSearch(context: context, delegate: Buscar());
                  print(resultado);
                  setState(() {
                    _search = resultado;
                    GET_DADOS();
                  });
                }
            ),
            IconButton(icon: Icon(Icons.filter_list, color: COR_TITULO), onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Tipo da célula"),
                    content: Container(
                      height: 280,
                      child: Column(
                        children: <Widget>[
                          RadioListTile(
                            title: const Text('Adolescentes'),
                            value: "Adolescentes",
                            groupValue: "Opcoes",
                            onChanged: (String valor) {
                              setState(() {
                                _filtro = valor;
                                _search = _search;
                                Navigator.of(context).pop();
                              });
                            },
                          ),
                          RadioListTile(
                            title: const Text('Casais(MIC)'),
                            value: "Casais(MIC)",
                            groupValue: "Opcoes",
                            onChanged: (String valor) {
                              setState(() {
                                _filtro = valor;
                                _search = _search;
                                Navigator.of(context).pop();
                              });
                            },
                          ),
                          RadioListTile(
                            title:  Text('Jovens'),
                            value: "Jovens",
                            groupValue: "Opcoes",
                            onChanged: (String valor) {
                              setState(() {
                                _filtro = "jovens";
                                _search = _search;
                              });
                              Navigator.of(context).pop();
                            },
                          ),
                          RadioListTile(
                            title: const Text('Mista'),
                            value: "Mista",
                            groupValue: "Opcoes",
                            onChanged: (String valor) {
                              setState(() {
                                _filtro = "Mista";
                                _search = _search;
                                Navigator.of(context).pop();
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text('Todos'),
                            value: "Todos",
                            groupValue: "Opcoes",
                            onChanged: (String valor) {
                              setState(() {
                                _filtro = "";
                                _search = _search;
                                Navigator.of(context).pop();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            })
          ],
        ),
        body: Center(
          child: FutureBuilder(
            future: celulas,
            builder: (contex, snapshot){
              switch(snapshot.connectionState){
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return Center(
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(COR_TITULO),
                        strokeWidth: 5.0,
                      ),
                    ),
                  );
                default:
                  if(snapshot.hasError) return Center(child: Text("Nenhum dado a ser exibido!"));
                  else {
                    int quant = GET_COUNT(snapshot.data["items"]);
                    return  ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        itemCount: quant,
                        itemBuilder: (context, index){
                          String telefone;
                          if(snapshot.data["items"][index]["telefone"] != null){
                            telefone = snapshot.data["items"][index]["telefone"];
                          }else{
                            telefone = "";
                          }
                          return GestureDetector(
                            onTap: (){ opcoesCelulas(context, snapshot.data["items"][index]);},
                            child: Container(
                                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                                margin: EdgeInsets.fromLTRB(15,0,15,15),
                                decoration: BoxDecoration(
                                  color: COR_SECUNDARIA,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(15.0) //                 <--- border radius here
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      snapshot.data["items"][index]["bairro"],
                                      style: TextStyle(
                                          fontSize: 21,
                                          fontFamily: "Gibson",
                                          color: COR_TITULO
                                      ),
                                    ),
                                    SizedBox(height: 8,),
                                    Text(snapshot.data["items"][index]["lider"], style: TextStyle(fontFamily: "Aktiv", color: COR_TITULO, fontSize: 16),),
                                    SizedBox(height: 8,),
                                    Text(telefone, style: TextStyle(fontFamily: "Aktiv", color: COR_TITULO, fontSize: 15),),
                                    SizedBox(height: 10,),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        Container(
                                          padding: EdgeInsets.symmetric(horizontal: 15),
                                          height: 30,
                                          decoration: BoxDecoration(
                                            color: COR_CTA,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(50.0)
                                            ),
                                          ),
                                          child: Text(
                                            snapshot.data["items"][index]["tipo"],
                                            style: TextStyle(
                                                color: COR_CTA_TEXTO
                                            ),
                                          ),
                                          alignment: Alignment.center,
                                        ),
                                      ],
                                    )
                                  ],
                                )
                            ),
                          );
                        }
                    );
                  }
              }
            },
          ),
        )
    );
  }
}