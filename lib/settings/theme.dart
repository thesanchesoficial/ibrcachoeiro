import 'package:flutter/material.dart';
import 'package:ibrcachoeiro/settings/colors.dart';

TEMA_CLARO(){
  return ThemeData(
  backgroundColor: COR_PRIMARIA,
  accentColor: AZUL_ESCURO,
  brightness: Brightness.light,
  bottomAppBarColor: COR_PRIMARIA,
  bottomAppBarTheme: BottomAppBarTheme(
    color: COR_PRIMARIA,
    elevation: 0,
  ),
  appBarTheme: AppBarTheme(
    brightness: BRILHO,
    actionsIconTheme: IconThemeData(
      color:  COR_TITULO,
    ),
    elevation: 0,
    color: COR_PRIMARIA,
    iconTheme: IconThemeData(
      color:  COR_TITULO
    ),
  )
);
}