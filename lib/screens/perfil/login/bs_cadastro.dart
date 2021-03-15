import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/settings/colors.dart';
import 'package:ibrcachoeiro/settings/strings.dart';

class BS_Cadastro extends StatefulWidget {
  @override
  _BS_CadastroState createState() => _BS_CadastroState();
}

class _BS_CadastroState extends State<BS_Cadastro> {
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
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
        decoration: BoxDecoration(
          color: COR_PRIMARIA,
          borderRadius: BorderRadius.only(topLeft:
          Radius.circular(15), topRight: Radius.circular(15)
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                height: 5.5,
                width: 40,
                decoration: BoxDecoration(
                  color: AZUL_ESCURO,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50.0),
                )
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Criar conta",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                fontFamily: "Gibson",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "para entrar no app",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: AZUL_ESCURO,
                  fontSize: 16
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: control,
              style: TextStyle(
                  color: Colors.black
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  fillColor: Colors.black
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: control,
              style: TextStyle(
                  color: Colors.black
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  labelText: "Celular",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  fillColor: Colors.black
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: control,
              style: TextStyle(
                  color: Colors.black
              ),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.done,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  labelText: "CPF",
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  fillColor: Colors.black
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Compartilhar anonimamente"),
                Switch(value: true, onChanged: (valor){

                })
              ],
            ),
            SizedBox(
              height: 30,
            ),
            FlatButton(
                onPressed: () async {

                },
                padding: EdgeInsets.all(0),
                child: Container(
                  width: (MediaQuery.of(context).size.width * 1),
                  height: 50,
                  decoration: BoxDecoration(
                    color: AZUL_ESCURO,
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)
                    ),
                  ),
                  child: Text(
                    "CONTINUAR",
                    style: TextStyle(
                        color: COR_CTA_TEXTO
                    ),
                  ),
                  alignment: Alignment.center,
                )
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
                padding: EdgeInsets.only(top: 10, bottom: MediaQuery.of(context).viewInsets.bottom)
            ),
          ],
        ),
      ),
    );
  }
}

EXIBIR_CADASTRO(context){
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: TRANSPARENTE,
      builder: (context) {
        return BS_Cadastro();
      }
  );
}

Future<Map<String, dynamic>> POST_CADASTRO(email) async {
  var response = await http.post(
    URL_PATH_API + "login",
    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    body: "{\"email\": \"$email\"}",
  );

  var json = response.body;
  Map<String, dynamic> map = jsonDecode(json);

  return map;
}