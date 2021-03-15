import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ibrcachoeiro/settings/colors.dart';
import 'package:ibrcachoeiro/settings/theme.dart';
import 'package:ibrcachoeiro/screens/biblia/livros.dart';
import 'package:ibrcachoeiro/screens/celulas/celulas.dart';
import 'package:ibrcachoeiro/screens/oracao/oracao.dart';
import 'package:ibrcachoeiro/screens/sistemas/sistemas.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ibrcachoeiro/view/celulas/celulas.dart';
import 'package:ibrcachoeiro/view/inicio/inicio.dart';

// passar para arquitetura limpa

void main() =>
  runApp(MaterialApp(
    color: COR_PRIMARIA,
    theme: TEMA_CLARO(),
    /*
    * ThemeData(
        backgroundColor: Color(0xffffffff),
        bottomAppBarColor: Color(0xffffffff),
        splashColor: Color(0xffffffff),
        scaffoldBackgroundColor: Color(0xffffffff),
        primaryColor: Color(0xfffdfdfd),
        brightness: Brightness.light,
        buttonColor: Color(0xfff2f2f2),
        secondaryHeaderColor: Colors.grey[200],
        cardColor: Colors.grey[300],
        accentColor: Color(0xff384AD3),
        primaryColorBrightness: Brightness.light,
        appBarTheme: AppBarTheme(
          brightness: Brightness.light,
          color: Color(0xffffffff),
          elevation: 0.0,
          actionsIconTheme: IconThemeData(
            color: Color(0xff384AD3),
          ),
        ),
      ),
      darkTheme: ThemeData(
        backgroundColor: Color(0xff1b1b1b),
        bottomAppBarColor: Color(0xff1b1b1b),
        scaffoldBackgroundColor: Color(0xff1b1b1b),
        primaryColor: Color(0xff1b1b1b),
        splashColor: Color(0xff222222),
        brightness: Brightness.dark,
        accentColor: Color(0xff007aff),
        buttonColor: Color(0xff1b1b1b),
        secondaryHeaderColor: Colors.grey[900],
        cardColor: Color(0xff202020),
        primaryColorBrightness: Brightness.dark,
        primaryTextTheme: TextTheme(
          bodyText1: TextStyle(color: Color(0xffd1d1d1)),
          headline6: TextStyle(color: Color(0xffd1d1d1)),
        ),
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            caption: TextStyle(color: Color(0xff007aff)),
            headline1: TextStyle(color: Color(0xff007aff)),
            headline2: TextStyle(color: Color(0xff007aff)),
          ),
          brightness: Brightness.dark,
          color: Color(0xff1b1b1b),
          elevation: 0.0,
          actionsIconTheme: IconThemeData(
            color: Color(0xff007aff),
          ),
        ),
      ),*/
    home: App(),
    debugShowCheckedModeBanner: false,
  )
);

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: TRANSPARENTE,
      systemNavigationBarColor: COR_PRIMARIA,
      statusBarBrightness: BRILHO,
      systemNavigationBarIconBrightness: BRILHO2,
    ));
    return Scaffold(
      backgroundColor: COR_PRIMARIA,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        selectedItemColor: COR_CTA,
        backgroundColor: COR_PRIMARIA,
        unselectedItemColor: COR_TITULO,
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              height: 20,
              color: (_indiceAtual == 0)? COR_CTA : COR_TITULO,
            ),
            title: Text("Inicio")),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/livro.svg',
              height: 25,
              color: (_indiceAtual == 1)? COR_CTA : COR_TITULO,
            ),
            title: Text("Bíblia")),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/grupo.svg',
              height: 27,
              color: (_indiceAtual == 2)? COR_CTA : COR_TITULO,
            ),
            title: Text("Células")),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/orar.svg',
              height: 23,
              color: (_indiceAtual == 3)? COR_CTA : COR_TITULO,
            ),
            title: Text("Oração")),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              height: 20,
              color: (_indiceAtual == 4)? COR_CTA : COR_TITULO,
            ),
            title: Text("Mais")),
        ],
      ),
      body: IndexedStack(
        children: <Widget>[
          Inicio(),
          LivrosBiblia(),
          Celulas(),
          Oracao(),
          telasSistemas()
        ],
        index: _indiceAtual,
      ),
    );
  }
}

int _indiceAtual = 0;

List<Widget> telas = [
  Inicio(),
  LivrosBiblia(),
  TelasCelulas(),
  Oracao(),
  telasSistemas()
];
