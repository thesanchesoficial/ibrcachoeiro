import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/screens/perfil/login/bs_email.dart';
import 'package:ibrcachoeiro/settings/colors.dart';
import 'package:ibrcachoeiro/settings/strings.dart';

class PedirOracao extends StatefulWidget {
  @override
  _PedirOracaoState createState() => _PedirOracaoState();
}

class _PedirOracaoState extends State<PedirOracao> {
  bool anonimo = true;
  var control = new TextEditingController();

  void dispose(){
    control.dispose();
    super.dispose();
  }

  void initState(){
    super.initState();
    control.addListener(_printLatestValue);
  }

  _printLatestValue(){
      print(control.text.split("\n"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COR_PRIMARIA,
      appBar: AppBar(
        backgroundColor: COR_PRIMARIA,
        brightness: BRILHO,
        leading: IconButton(icon: Icon(Icons.close, color: COR_TITULO,), onPressed: (){Navigator.pop(context);}),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Junte-se a mim em oração por ...",
              style: TextStyle(
                fontFamily: "Gibson",
                fontSize: 24,
                color: COR_TITULO
              ),
            ),
            SizedBox(height: 15,),
            TextField(
              controller: control,
              minLines: 12,
              maxLines: 15,
              cursorColor: COR_TITULO,
              style: TextStyle(color: COR_TITULO),
              decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: COR_TITULO),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: COR_TITULO),
                ),
                fillColor: COR_TITULO,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: COR_TITULO),
                )
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Compartilhar anonimamente", style: TextStyle(color: COR_TITULO),),
                Switch(value: anonimo, activeColor: COR_CTA, onChanged: (valor){
                  if(!valor){
                    EXIBIR_LOGIN(context);
                  }else{
                    setState(() {
                      anonimo = valor;
                      print(anonimo);
                    });
                  }
                })
              ],
            ),
            SizedBox(height: 10,),
            FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () async {
                if(anonimo){
                  var dados = await POST_ORACAO(control.text.replaceAll("\n", "\\n").toString(), "Anônimo", "Anônimo", "Anônimo");
                  print(dados);
                } else {
                  var dados = await POST_ORACAO(control.text.replaceAll("\n", "\\n").toString(), "Matheus", "28 99961-6520", "sanches@gmail.com");
                  print(dados);
                }
              },
              textColor: COR_TITULO,
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
                  "Enviar oração",
                  style: TextStyle(
                    color: COR_CTA_TEXTO
                  ),
                ),
                alignment: Alignment.center,
              )
            ),
          ],
        ),
      ),
    );
  }
}

Future<Map<String, dynamic>> POST_ORACAO(mensagem, nome, telefone, email) async {
  var response = await http.post(
    URL_PATH_API + "oracao",
    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    body: "{\"mensagem\": \"$mensagem\", \"nome\": \"$nome\", \"telefone\": \"$telefone\", \"email\": \"$email\"}",
  );

  var json = response.body;
  Map<String, dynamic> map = jsonDecode(json);

  return map;
}