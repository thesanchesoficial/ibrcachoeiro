import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

class Historia extends StatefulWidget {
  @override
  _HistoriaState createState() => _HistoriaState();
}

class _HistoriaState extends State<Historia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COR_PRIMARIA,
      appBar: AppBar(
        brightness: BRILHO,
        backgroundColor: COR_PRIMARIA,
        title: Text("Nossa história", style: TextStyle(color: COR_TITULO)),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: COR_TITULO,), onPressed: (){Navigator.pop(context);}),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Text(
              '''A Igreja Batista Renovada de Cachoeiro de Itapemirim, foi fundada em abril de 1994, sob a presidência do Pr. Marcos Antônio Mansur atendendo ao chamado de Deus para uma “Grande Obra” na cidade de Cachoeiro de Itapemirim-ES.

Nesta ocasião Pr. Marcos Mansur pastoreava a Igreja Batista Renovada em Jerônimo Monteiro e após estruturar naquela cidade um abençoado trabalho, juntamente com sua mui digna esposa, Pra. Eliude Mansur e seus filhos Marcos Jr. e Laiz, aceitou o desafio de começar tudo de novo em Cachoeiro, visto que existia um clamor de um povo por aqui.

Os primeiros momentos da igreja se deram na garagem da casa da irmã Penha, na Ilha da Luz, logo se deslocou para uma garagem na Rua Samuel Levy. Em pouco tempo o local já foi ficando pequeno porque a cada dia Deus acrescentava mais pessoas, isso provocou a necessidade de um espaço maior e foi alugado um salão na Rua Bernardo Horta o que também não foi o suficiente em um período muito pequeno, obrigando assim uma transferência para outro salão maior. Com o trabalho se desenvolvendo e crescendo, Deus foi abençoando e enviando recursos e pessoas para ajudar nessa jornada.

O Ministério da Batista Renovada começou a tomar forma e frutificar, ministérios foram nascendo, pessoas se levantando a “obra” crescendo e o Senhor dando e ampliando a visão da liderança. E foi numa investida arrojada e ousada que a igreja agora se deslocava para o centro da cidade, no coração de Cachoeiro, em lugar estratégico e fundamental para tornar a Batista Renovada em uma igreja conhecida como a mais nova referência da Benção nesta cidade.

Os oito (8) anos ali renderam grandes e bons frutos para a igreja, agora a visão apontava para projetos ainda mais arrojados, tanto no âmbito espiritual como é o seu lema: “EDIFICAR O CORPO DE CRISTO COM QUALIDADE”, como no quantitativo, bem como no material, pois era um sonho de todos, a aquisição de uma área para a construção do templo próprio da igreja. Uma comissão representativa da Renovada foi instaurada para trabalhar especificamente em torno deste assunto. E conseguiu!

E foi assim, das contribuições de seus membros que abraçaram a essa idéia, participando, contribuindo, orando e ajudando, que a igreja adquiriu o seu local onde agora realiza os seus cultos. Hoje possui um belo ginásio poliesportivo construído no local, onde funciona provisoriamente como templo da igreja.

A Batista Renovada já é uma referência nesta cidade, Pr. Marcos Mansur juntamente com seu corpo de obreiros e uma boa estrutura montada, oferece à população e aos seus membros 5 (cinco) cultos regulares e ainda conta com cultos nos bairros através de células. A igreja também rompeu fronteiras internacionais e mantém um casal de missionários na África-Senegal onde a igreja tem uma frente de trabalho em Salemata. Também já se faz conhecida nos Estados Unidos onde os pastores Marcos e Elíude Mansur estiveram ministrando na igreja em Boston-Massachussets.

Hoje a Batista Renovada realiza um trabalho sócio-evangelístico na localidade do Bairro Valão onde será construído o seu templo sede e continuar crescendo a cada dia em prol do Reino de Deus. “IGREJA BATISTA RENOVADA DE CACHOEIRO, LUGAR DE EDIFICAÇÃO”''', 
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