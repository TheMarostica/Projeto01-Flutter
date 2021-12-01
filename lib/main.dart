import 'package:flutter/material.dart';
import 'package:projeto01/agua.dart';
import 'package:projeto01/bpm.dart';
import 'package:projeto01/cadastro.dart';
import 'package:projeto01/dev.dart';
import 'package:projeto01/home.dart';
import 'package:projeto01/imc.dart';
import 'package:projeto01/login.dart';
import 'package:projeto01/metas.dart';
import 'package:projeto01/sobre.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Projeto',

      initialRoute: 'login',

      routes: {
        'login' : (context) => TelaLogin(),
        'cadastro' : (context) => TelaCadastro(),
        'home' : (context) => TelaHome(),
        'imc' : (context) => TelaIMC(),
        'agua' : (context) => TelaAgua(),
        'bpm' : (context) => TelaBPM(),
        'metas' : (context) => TelaMetas(),
        'sobre' : (context) => TelaSobre(),
        'dev' : (context) => TelaDev(),
      },
    ),
  );
}