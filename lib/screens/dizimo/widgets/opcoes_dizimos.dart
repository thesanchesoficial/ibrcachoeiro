import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/models/open_link.dart';
import 'package:ibrcachoeiro/screens/dizimo/widgets/bs_delivery.dart';
import 'package:ibrcachoeiro/screens/dizimo/widgets/bs_picpay.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

class OpcoesDizimos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Text('''Orientamos que para devolver o seu dízimo e entregar a sua oferta de maneira rápida e segura, você poderá trazer diretamente à secretaria da Igreja ou realizar o pagamento online, depósitos ou transferências bancárias.

Precisamos do comprometimento de todos para honrar nossos compromissos financeiros como Igreja. Contamos com sua fidelidade e generosidade.

Você pode efetuar o pagamento pelo PicPay ou através do depósito direto na conta bancária da igreja.''', style: TextStyle(
              fontFamily: "Aktiv",
              fontSize: 16,
            color: COR_TITULO
          ),),
          SizedBox(height: 40,),
          FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: (){EXIBIR_PICPAY(context);},
              textColor: COR_TITULO,
              child: Container(
                width: (MediaQuery.of(context).size.width * 1),
                height: 50,
                decoration: BoxDecoration(
                  color: COR_CTA,
                  borderRadius: BorderRadius.all(
                      Radius.circular(50.0)
                  ),
                ),
                child: Text(
                  "Pagar com PicPay",
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
              onPressed: (){EXIBIR_DELIVERY(context);},
              textColor: COR_TITULO,
              child: Container(
                width: (MediaQuery.of(context).size.width * 1),
                height: 50,
                decoration: BoxDecoration(
                  color: COR_CTA,
                  borderRadius: BorderRadius.all(
                      Radius.circular(50.0)
                  ),
                ),
                child: Text(
                  "Solicitar delivery",
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
              onPressed: (){OpenLink("https://www.ibrcachoeiro.com.br/dizimos");},
              textColor: COR_TITULO,
              child: Container(
                width: (MediaQuery.of(context).size.width * 1),
                height: 50,
                decoration: BoxDecoration(
                  color: COR_CTA,
                  borderRadius: BorderRadius.all(
                      Radius.circular(50.0)
                  ),
                ),
                child: Text(
                  "Depósito bancário",
                  style: TextStyle(
                      color: COR_CTA_TEXTO
                  ),
                ),
                alignment: Alignment.center,
              )
          ),
          SizedBox(height: 40,),
        ],
      ),
    );
  }
}
