
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/models/transicoes.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

import '../capitulos.dart';

class Leitura extends StatelessWidget {
  int _getCount(List data){
    if(data != null){
      return data.length;
    }else {
      return 0;
    }
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle
            .of(context)
            .loadString('lib/repositories/nvi.json'),
        builder: (context, snapshot){
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
              if(snapshot.hasError) return Container();
              else {
                dynamic biblia = json.decode(snapshot.data.toString());
                return ListView.builder(
                    padding: EdgeInsets.all(10),
                    itemCount: _getCount(biblia["livros"]),
                    itemBuilder: (context, index){
                      return GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  margin: EdgeInsets.only(bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(8.0) //                 <--- border radius here
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(15),
                                    child: Container(
                                      child:
                                      Text(
                                        biblia["livros"][index]["name"],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          color: COR_TITULO
                                        ),
                                      ),
                                    ),
                                  )
                              ),
                            )
                          ],
                        ),
                        onTap: (){Navigator.push(context, DireitaEsquerda(page: capitulosBiblia(biblia["livros"][index])));},
                      );
                    }
                );
              }

          }
        }
    );
  }
}
