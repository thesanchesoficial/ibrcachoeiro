import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

class BS_Senha extends StatefulWidget {
  @override
  _BS_SenhaState createState() => _BS_SenhaState();
}

class _BS_SenhaState extends State<BS_Senha> {
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
              "Digite seu CPF",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21,
                fontFamily: "Gibson",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
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
            FlatButton(
                onPressed: (){},
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
                    "ENTRAR",
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

EXIBIR_SENHA(context){
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: TRANSPARENTE,
      builder: (context) {
        return BS_Senha();
      }
  );
}