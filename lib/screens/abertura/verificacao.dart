import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ibrcachoeiro/repositories/database.dart';
import 'package:ibrcachoeiro/screens/abertura/abertura.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

import '../../main.dart';

class Verificacao extends StatefulWidget {
  @override
  _VerificacaoState createState() => _VerificacaoState();
}

class _VerificacaoState extends State<Verificacao> {

  _executar2(context) async{
    var db = await INICIAR_DATABASE();
    List lista = await READ_DATABASE(db);
    await FECHAR_DATABASE(db);
    if(lista.isNotEmpty){
      if(lista[0]["tema"] == 1){
        setState(() {
          NOTURNO = true;
          COR_PRIMARIA = Color(0xff000000);
          COR_SECUNDARIA = Colors.grey[900];
          COR_TITULO = Colors.white;
          BRILHO = Brightness.dark;
          BRILHO2 = Brightness.light;
          COR_CTA = Color(0xfff9554c);
        });
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => App()),
              (Route<dynamic> route) => false,
        );
      }else{
        setState(() {
          NOTURNO = false;
          COR_PRIMARIA = Color(0xffebecee);
          COR_SECUNDARIA = Color(0xffdedede);
          COR_TITULO = Colors.black;
          BRILHO = Brightness.light;
          BRILHO2 = Brightness.dark;
          COR_CTA = Color(0xff3e7dee);
        });
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => App()),
              (Route<dynamic> route) => false,
        );
      }
    }else{
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => Abertura()),
            (Route<dynamic> route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    _executar2(context);
    return Container(
      color: Colors.white,
      child: Text("hjfg"),
    );
  }
}
