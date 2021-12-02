import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto01/agua.dart';
import 'package:projeto01/bpm.dart';
import 'package:projeto01/cadastro.dart';
import 'package:projeto01/cadastro_meta.dart';
import 'package:projeto01/dev.dart';
import 'package:projeto01/home.dart';
import 'package:projeto01/imc.dart';
import 'package:projeto01/login.dart';
import 'package:projeto01/metas.dart';
import 'package:projeto01/sobre.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Projeto',

      initialRoute: 'login',

      routes: {
        'login' : (context) => TelaLogin(),
        'cadastro' : (context) => TelaCadastro(),
        'cadastroMeta' : (context) => CadastroPage(),
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