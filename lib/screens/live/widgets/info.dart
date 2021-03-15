import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/models/open_link.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

class InfoLive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          SizedBox(height: 30,),
          Text(
            "Caso haja algum erro, você pode assistir pelas nossas redes sociais.",
            style: TextStyle(
                fontFamily: "Aktiv",
                fontSize: 16,
                color: COR_TITULO
            ),
          ),
          SizedBox(height: 30,),
          FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: (){OpenLink("https://youtube.com/ibrcachoeirobrasil/live");},
              textColor: COR_TITULO,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: COR_CTA,
                  borderRadius: BorderRadius.all(
                      Radius.circular(8.0)
                  ),
                ),
                child: Text(
                  "YouTube",
                  style: TextStyle(
                      color: COR_CTA_TEXTO
                  ),
                ),
                alignment: Alignment.center,
              )
          ),
          SizedBox(height: 10,),
          FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: (){OpenLink("https://facebook.com/ibrcachoeiro/live");},
              textColor: COR_TITULO,
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: COR_CTA,
                  borderRadius: BorderRadius.all(
                      Radius.circular(8.0)
                  ),
                ),
                child: Text(
                  "FaceBook",
                  style: TextStyle(
                      color: COR_CTA_TEXTO
                  ),
                ),
                alignment: Alignment.center,
              )
          ),
          SizedBox(height: 10,),
        ],
      ),
    );
  }
}
