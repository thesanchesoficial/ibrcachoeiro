import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/screens/biblia/widgets/exibir_livros.dart';
import 'package:ibrcachoeiro/screens/dizimo/widgets/opcoes_dizimos.dart';
import 'package:ibrcachoeiro/screens/live/widgets/info.dart';
import 'package:ibrcachoeiro/settings/colors.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class Live extends StatefulWidget {
  @override
  _LiveState createState() => _LiveState();
}



const kHtml = """
<iframe src="https://www.youtube.com/embed/live_stream?channel=UCt5yWB6kzElbw3ZlMnQOKGg" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
""";
Widget selecionado = InfoLive();

class _LiveState extends State<Live> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COR_PRIMARIA,
      appBar: AppBar(
        backgroundColor: COR_SECUNDARIA,
        title: Text("Culto ao Vivo", style: TextStyle(color: COR_TITULO),),
        centerTitle: true,
        brightness: BRILHO,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: COR_TITULO), onPressed: (){Navigator.pop(context);}),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share, color: COR_TITULO), onPressed: (){}),
        ],
      ),
      body: Column(
          children: <Widget>[
            HtmlWidget(
              kHtml,
              webView: true,
              bodyPadding: EdgeInsets.all(0),
            ),
            Expanded(
              child: Column(
                  children: <Widget>[
                    Container(
                      color: COR_SECUNDARIA,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: FlatButton(
                              color: COR_SECUNDARIA,
                              padding: EdgeInsets.all(0),
                              onPressed: (){
                                setState(() {
                                  selecionado = InfoLive();
                                });
                              },
                              child: Text("Info", style: TextStyle(color: COR_TITULO),),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: FlatButton(
                              color: COR_SECUNDARIA,
                              padding: EdgeInsets.all(0),
                              onPressed: (){
                                setState(() {
                                  selecionado = Leitura();
                                });
                              },
                              child: Text("Bíblia", style: TextStyle(color: COR_TITULO),),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: FlatButton(
                              color: COR_SECUNDARIA,
                              padding: EdgeInsets.all(0),
                              onPressed: (){
                                setState(() {
                                  selecionado = OpcoesDizimos();
                                });
                              },
                              child: Text("Oferta", style: TextStyle(color: COR_TITULO),),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.grey[400],
                    ),
                    Expanded(
                      child: Container(
                        child: selecionado,
                      ),
                    )
                  ],
                ),
              )
          ],
      ),
    );
  }
}