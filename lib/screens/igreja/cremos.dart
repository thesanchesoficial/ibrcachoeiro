import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

class Cremos extends StatefulWidget {
  @override
  _CremosState createState() => _CremosState();
}

class _CremosState extends State<Cremos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COR_PRIMARIA,
      appBar: AppBar(
        title: Text("O que cremos", style: TextStyle(color: COR_TITULO)),
        centerTitle: true,
        backgroundColor: COR_PRIMARIA,
        brightness: BRILHO,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: COR_TITULO,), onPressed: (){Navigator.pop(context);}),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Text(
              '''Declaração de Doutrina e Conduta

1) A existência de um só e eterno Deus: Pai, Filho e Espírito Santo, um em essência e trino em pessoas;

1.1.) Deus Pai, eterno, criador e sustentador de todo o universo, onipotente, onisciente e onipresente, santo, soberano sobre tudo e todos, antes e agora, e para todo o sempre.

1.2.) Deus Filho, eterno, unigênito de Deus Pai, encarnado, imaculado, Cordeiro de Deus, morto e ressurreto, único Mediador entre Deus e os homens;

1.3.) Deus Espírito Santo, eterno, Deus que habita em cada um e todos os que crêem, a Igreja, Consolador, intercessor, que atua para convencer o homem de seu pecado, da justiça em Cristo, e do juízo de Deus, e unge e capacita a Igreja para a continuidade da missão de Jesus Cristo no mundo.

2) A inspiração divina, veracidade e integridade da Bíblia, tal como foi revelada originalmente, e sua suprema autoridade em assuntos de fé e conduta;

3) A criação do universo em perfeita harmonia, e do ser humano à imagem e semelhança de Deus;

4) A pecaminosidade universal e a culpabilidade de todos os homens, desde a queda de Adão, e a conseqüente sujeição de todos os homens à ira da condenação de Deus, e a corrupção e degeneração de todo o universo criado;

5) A redenção da culpabilidade, pena, domínio e corrupção do pecado, somente por meio da morte expiatória do Senhor Jesus Cristo, o Cordeiro de Deus, nosso representante substituto, que através do seu sangue satisfez a justiça de Deus e triunfou sobre a morte, o Diabo e seus anjos maus, por toda a eternidade;

6) A ressurreição corporal do Senhor Jesus Cristo e sua ascensão à direita de Deus Pai;

7) A justificação do pecado somente pela graça de Deus, por meio da fé em Jesus Cristo , mediante ação do Espírito Santo;
 
8) A vida cristã como resultado da obra redentora de Deus, como formação da imagem (caráter) de Cristo nos que crêem, que se expressa em seu interior como fruto do Espírito Santo, e visivelmente na sociedade através da conduta ética à luz dos preceitos do Novo Testamento;

9) A única igreja santa e universal, que é o corpo de Cristo, sendo Ele mesmo seu edificador e Cabeça, à qual pertencem todos os que crêem, e que, na terra, se manifesta através de comunidades cristãs locais;

10) O reino de Deus como domínio de Deus, de fato e de direito, sobre tudo e todos, inaugurado e manifesto na história através de Jesus e sua Igreja, e que se consumará na eternidade quando todos os inimigos de Deus forem definitivamente vencidos e postos sob os pés de Jesus Cristo, para a glória de Deus Pai;

11) A missão da Igreja como extensão da missão de Jesus Cristo, a saber, "levar o evangelho todo para o homem todo", convocando todos os homens à participação no reino de Deus;

12) A segurança da segunda vinda de Jesus Cristo em corpo glorificado; a ressurreição dos mortos, a vida eterna dos salvos e a condenação de todos os que não crêem; e a consumação do eterno reino de Deus.''', 
              style: TextStyle(
                fontFamily: "Aktiv",
                fontSize: 16,
                color: COR_TITULO
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}