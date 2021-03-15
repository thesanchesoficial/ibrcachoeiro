import 'package:flutter/material.dart';

bool dark = true;
Color texto = Colors.black;
Color back = Colors.white;
double fonte = 18;
TextAlign alinhamento = TextAlign.left;

void verificar(){
  if(dark){
    texto = Colors.white;
    back = Colors.black;
  }else{
    texto = Colors.black;
    back = Colors.white;
  }
}
