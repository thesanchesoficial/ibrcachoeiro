import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/screens/perfil/login/bs_cadastro.dart';
import 'package:ibrcachoeiro/screens/perfil/login/bs_senha.dart';
import 'package:ibrcachoeiro/settings/colors.dart';
import 'package:ibrcachoeiro/settings/strings.dart';

class BS_Email extends StatefulWidget {

  @override
  _BS_EmailState createState() => _BS_EmailState();
}

class _BS_EmailState extends State<BS_Email> {
  var control = new TextEditingController();
  bool _isButtonDisabled = true;
  Color DisabledColor = Colors.grey;

  Widget _valor = Text(
    "CONTINUAR",
    style: TextStyle(
      color: COR_CTA_TEXTO
    ),
  );

  void dispose(){
    control.dispose();
    super.dispose();
  }

  void initState(){
    super.initState();
    control.addListener(_printLatestValue);
  }

  _printLatestValue(){
    print(control.text);
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(control.text);
    if(emailValid) {
      setState(() {
        _isButtonDisabled = false; DisabledColor = COR_CTA;
      });
    }
    else {
      setState(() {
        _isButtonDisabled = true; DisabledColor = Colors.grey;
      });
    }
    print(emailValid);
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
                    color: COR_SUBTITULO,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(50.0),
                  )
              ),
              SizedBox(
                height: 15,
              ),
              Text(
               "Digite seu e-mail",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                  fontFamily: "Gibson",
                  color: COR_TITULO
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "para entrar no app",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: COR_SUBTITULO,
                    fontSize: 16
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: control,
                style: TextStyle(
                    color: COR_TITULO
                ),
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
                cursorColor: COR_TITULO,
                decoration: InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(
                      color: COR_TITULO,
                    ),
                    fillColor: COR_TITULO
                ),
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                  onPressed: _isButtonDisabled ? null : () async {
                    setState(() {
                      _valor = SizedBox(
                        child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(COR_CTA_TEXTO),),
                        height: 30.0,
                        width: 30.0,
                      );
                    });
                    var dados = await POST_LOGIN(control.text);
                    if(dados["status"] == 200){
                      EXIBIR_SENHA(context);
                      setState(() {
                        _valor = Text(
                          "CONTINUAR",
                          style: TextStyle(
                              color: COR_CTA_TEXTO
                          ),
                        );
                      });
                    }
                    else{
                      EXIBIR_CADASTRO(context);
                      setState(() {
                        _valor = Text(
                          "CONTINUAR",
                          style: TextStyle(
                              color: COR_CTA_TEXTO
                          ),
                        );
                      });
                    }
                  },
                  padding: EdgeInsets.all(0),
                  child: Container(
                    width: (MediaQuery.of(context).size.width * 1),
                    height: 50,
                    decoration: BoxDecoration(
                      color: DisabledColor,
                      borderRadius: BorderRadius.all(
                          Radius.circular(10.0)
                      ),
                    ),
                    child: _valor,
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

EXIBIR_LOGIN(context){
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: TRANSPARENTE,
      builder: (context) {
        return BS_Email();
      }
  );
}

Future<Map<String, dynamic>> POST_LOGIN(email) async {
  var response = await http.post(
    URL_PATH_API + "login",
    headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    body: "{\"email\": \"$email\"}",
  );

  var json = response.body;
  Map<String, dynamic> map = jsonDecode(json);

  return map;
}