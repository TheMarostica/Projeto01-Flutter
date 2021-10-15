import 'package:flutter/material.dart';

class TelaSobre extends StatefulWidget {
  const TelaSobre({ Key? key }) : super(key: key);

  @override
  _TelaSobreState createState() => _TelaSobreState();
}

class _TelaSobreState extends State<TelaSobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),

      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,

            children: [

              Text(
                'Tema',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold, //deixar as letras em negrito
                  color: Colors.blue.shade900,
                ),
              ),
              Text(
                'O tema escolhido para esse projeto é a área da saúde com o foco na qualidade de vida.',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),

              Text(
                'Objetivo',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold, //deixar as letras em negrito
                  color: Colors.blue.shade900,
                ),
              ),

              Text(
                'O aplicativo tem o objetivo de ajudar o usuário com menos recursos a ter informações sobre o seu corpo. Sem que precise ir ao médico, é possível ter informações que o ajudarão, de forma direta, a manter uma saúde mais estável.',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),

              TextButton(
                child: Text(
                  'Sobre o Desenvolvedor',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black38,
                    fontSize: 10,
                  ),
                ),
                onPressed: (){
                  Navigator.pushNamed(context, 'dev');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}