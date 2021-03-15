import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/settings/colors.dart';
import 'package:share/share.dart';

class BS_OpcoesCelulas extends StatefulWidget {
  Map dados;

  BS_OpcoesCelulas(this.dados);

  @override
  _BS_OpcoesCelulasState createState() => _BS_OpcoesCelulasState(dados);
}

class _BS_OpcoesCelulasState extends State<BS_OpcoesCelulas> {
  Map dados;

  _BS_OpcoesCelulasState(this.dados);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          color: COR_PRIMARIA,
          borderRadius: BorderRadius.only(topLeft:
          Radius.circular(15), topRight: Radius.circular(15)
          ),
        ),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 5.5,
                      width: 40,
                      decoration: BoxDecoration(
                        color: COR_SUBTITULO,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(50.0),
                      )
                    ),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    Text(
                      dados["bairro"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21,
                        fontFamily: "Gibson",
                          color: COR_TITULO
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      dados["lider"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: COR_SUBTITULO,
                          fontSize: 16
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 7)),
                    Text(
                      dados["telefone"] != null ? dados["telefone"]:"Sem telefone",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: COR_SUBTITULO,
                          fontSize: 16
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 10)),

                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                    ),
                    FlatButton(
                        onPressed: (){
                          String bairro = dados["bairro"] != "Itinerante"? "célula no bairro "+ dados["bairro"] : "célula itinerante";
                          String lider = dados["lider"];
                          String telefone = dados["telefone"] != null? "\nTelefone: " + dados["telefone"] : "";;
                          Share.share("Você sabia que temos uma $bairro?\n\nLíder(es): $lider$telefone\n\nAproveite e baixe nosso aplicativo -> www.com.br");
                        },
                        padding: EdgeInsets.all(0),
                        child: Container(
                          width: (MediaQuery.of(context).size.width * 1),
                          height: 50,
                          decoration: BoxDecoration(
                            color: COR_CTA,
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)
                            ),
                          ),
                          child: Text(
                            "Compartilhar",
                            style: TextStyle(
                                color: COR_CTA_TEXTO
                            ),
                          ),
                          alignment: Alignment.center,
                        )
                    ),
                    FlatButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        padding: EdgeInsets.all(0),
                        child: Text(
                        "Reportar erro",
                        style: TextStyle(
                          color: COR_CTA
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

opcoesCelulas(context, dados){
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: TRANSPARENTE,
      builder: (context) {
        return BS_OpcoesCelulas(dados);
      }
  );
}