import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibrcachoeiro/models/transicoes.dart';
import 'package:ibrcachoeiro/settings/colors.dart';
import 'package:share/share.dart';

class leituraBiblia extends StatefulWidget {

  int capitulo;
  Map livroTexto;

  leituraBiblia( this.capitulo, this.livroTexto );

  @override
  _leituraBibliaState createState() => _leituraBibliaState(capitulo, livroTexto);
}

class _leituraBibliaState extends State<leituraBiblia> {

  int capitulo = 0;
  Map livroTexto;
  Color texto = Colors.black;
  Color back = Colors.white;
  double fonte = 18;
  TextAlign alinhamento = TextAlign.left;

  _leituraBibliaState( this.capitulo, this.livroTexto);

  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
      backgroundColor: COR_PRIMARIA,
      appBar: AppBar(
        title: Text(
          livroTexto["name"] + " " + (capitulo + 1).toString(),
          style: TextStyle(
            color: COR_TITULO
          ),
        ),
        brightness: BRILHO,
        backgroundColor: COR_PRIMARIA,
        centerTitle: true,
        elevation: 1.0,
        iconTheme: IconThemeData(
          color: COR_TITULO
        ),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pop(context);}),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.text_fields),
            color: COR_TITULO,
            onPressed: (){
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // retorna um objeto do tipo Dialog
                  return AlertDialog(
                    content: Container(
                      height: 140,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                child: Text(
                                  "A +",
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: texto,
                                  ),
                                ),
                                onPressed: (){
                                  setState(() {
                                    fonte++;
                                  });
                                },
                              ),
                              RaisedButton(
                                child: Text(
                                  "A -",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: texto,
                                  ),
                                ),
                                onPressed: (){
                                  setState(() {
                                    fonte--;
                                  });
                                },
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                width: 50,
                                child: RaisedButton(
                                  child: Icon(
                                    Icons.format_align_left,
                                    size: 20,
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      alinhamento = TextAlign.left;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: 50,
                                child: RaisedButton(
                                  child: Icon(
                                    Icons.format_align_center,
                                    size: 20,
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      alinhamento = TextAlign.center;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: 50,
                                child: RaisedButton(
                                  child: Icon(
                                    Icons.format_align_right,
                                    size: 20,
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      alinhamento = TextAlign.right;
                                    });
                                  },
                                ),
                              ),
                              Container(
                                width: 50,
                                child: RaisedButton(
                                  child: Icon(
                                    Icons.format_align_justify,
                                    size: 20,
                                  ),
                                  onPressed: (){
                                    setState(() {
                                      alinhamento = TextAlign.justify;
                                    });
                                  },
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),

                  );
                },
              );
            }
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                    padding: EdgeInsets.only(left: 10, right: 15, bottom: 50, top: 15),
                    itemCount: _getCount(livroTexto["chapters"][capitulo]) ,
                    itemBuilder: (context, index){
                      return GestureDetector(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Container(
                                      child:
                                      Text(
                                        (index+1).toString() + " - " + livroTexto["chapters"][capitulo][index],
                                        style: TextStyle(
                                          fontSize: fonte,
                                          color: COR_TITULO,
                                        ),
                                        textAlign: alinhamento,
                                      ),
                                    ),
                                  )
                              ),
                            )
                          ],
                        ),
                        onTap: (){

                        },
                        onLongPress: (){
                          Share.share(livroTexto["chapters"][capitulo][index] + "\n\n" + livroTexto["name"] + " " + (capitulo + 1).toString() + ":"+ (index+1).toString());
                        },
                      );
                    }
                )
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 15, bottom: 15),
                    padding: EdgeInsets.all(0),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: COR_SECUNDARIA,
                      borderRadius: BorderRadius.all(
                          Radius.circular(50.0)
                      ),
                    ),
                    child: FlatButton(
                      onPressed: (){
                        if(capitulo - 1 < 0){}
                        else {Navigator.pop(context); Navigator.push(context, EsquerdaDireita(page: leituraBiblia((capitulo - 1), livroTexto)));}
                      },
                      padding: EdgeInsets.all(0),
                      child: Icon(Icons.keyboard_arrow_left, color: COR_TITULO,),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15, bottom: 15),
                    padding: EdgeInsets.all(0),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: COR_SECUNDARIA,
                      borderRadius: BorderRadius.all(
                          Radius.circular(50.0)
                      ),
                    ),
                    child: FlatButton(
                      onPressed: () async{
                        int quant = await _getCount(livroTexto["chapters"]);
                        if(capitulo + 1 >= quant){}
                        else {Navigator.pop(context); Navigator.push(context, DireitaEsquerda(page: leituraBiblia((capitulo + 1), livroTexto)));}
                      },
                      padding: EdgeInsets.all(0),
                      child: Icon(Icons.keyboard_arrow_right, color: COR_TITULO),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      )
    );
  }

  int _getCount(List data){
    if(data != null){
        return data.length;
    }else {
      return 0;
    }
  }
}