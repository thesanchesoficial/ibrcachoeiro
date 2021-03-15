import 'package:flutter/material.dart';
import 'dart:async';
import 'package:ibrcachoeiro/settings/colors.dart';
import 'package:ibrcachoeiro/screens/inicio/inicioNoticias.dart';

class Buscar extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(icon: Icon(Icons.clear), onPressed: (){query = "";}),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black), onPressed: (){close(context, "");});
  }

  @override
  Widget buildResults(BuildContext context) {
    Future.delayed(Duration.zero).then((_)=>close(context, query));
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return Container(color: COR_PRIMARIA,);
    } else {
      return FutureBuilder(
        future: GET_DADOS("bairros/"+query),
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
                  if(snapshot.hasError){
                  return Center(child: Text("Nenhum dado a ser exibido!"));
                    }else {
                      int quant = GET_COUNT(snapshot.data["items"]);
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: quant,
                          itemBuilder: (context, index){
                            return ListTile(
                              title: Text(snapshot.data["items"][index]["bairro"]),
                              leading: Icon(Icons.search),
                              onTap: (){
                                String teste = snapshot.data["items"][index]["bairro"];
                                List ab = teste.split(" ");
                                close(context, ab[0].toString());
                              },
                            );
                          }
                      );
                    }
          }
        },
      );
    }
  }
}