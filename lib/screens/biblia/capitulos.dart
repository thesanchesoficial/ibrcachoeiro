import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/models/transicoes.dart';
import 'package:ibrcachoeiro/screens/biblia/leitura.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

class capitulosBiblia extends StatefulWidget {

  Map livroTexto;

  capitulosBiblia( this.livroTexto );
 
  @override
  _capitulosBibliaState createState() => _capitulosBibliaState(livroTexto);
}

class _capitulosBibliaState extends State<capitulosBiblia> {

  Map livroTexto;

  _capitulosBibliaState( this.livroTexto );


  @override
  Widget build(BuildContext context) {
    return 
      Scaffold(
      backgroundColor: COR_PRIMARIA,
      appBar: AppBar(
        title: Text(
          livroTexto["name"],
          style: TextStyle(
            color: COR_TITULO
          ),
        ),
        brightness: BRILHO,
        backgroundColor: COR_PRIMARIA,
        centerTitle: true,
        elevation: 1.0,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pop(context);}),
        iconTheme: IconThemeData(
          color: COR_TITULO
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                padding: EdgeInsets.all(10),
                itemCount: _getCount(livroTexto["chapters"]),
                itemBuilder: (context, index){
                  return GestureDetector(
                    child: Container(
                      margin: EdgeInsets.all( 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(8.0) //                 <--- border radius here
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            (index + 1).toString(),
                            style: TextStyle(
                                fontSize: 18,
                              color: COR_TITULO
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: (){Navigator.push(context, DireitaEsquerda(page: leituraBiblia(index, livroTexto)));},
                  );
                }
            )
          ),
        ],
      ),
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