import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

class BS_Picpay extends StatefulWidget {
  @override
  _BS_PicpayState createState() => _BS_PicpayState();
}

class _BS_PicpayState extends State<BS_Picpay> {
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
                  color: COR_CINZA,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(50.0),
                )
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Pagar com PicPay",
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
              "preencha abaixo com seus dados",
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
                  labelText: "Nome",
                  labelStyle: TextStyle(
                    color: COR_TITULO,
                  ),
                  fillColor: COR_TITULO
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
                  labelText: "Celular",
                  labelStyle: TextStyle(
                    color: COR_TITULO,
                  ),
                  fillColor: COR_TITULO
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
                  labelText: "CPF",
                  labelStyle: TextStyle(
                    color: COR_TITULO,
                  ),
                  fillColor: COR_TITULO
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
                  labelText: "Email",
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
                onPressed: () async {

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

EXIBIR_PICPAY(context){
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: TRANSPARENTE,
      builder: (context) {
        return BS_Picpay();
      }
  );
}