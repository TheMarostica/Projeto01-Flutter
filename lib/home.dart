import 'package:flutter/material.dart';

class TelaHome extends StatefulWidget {
  const TelaHome({ Key? key }) : super(key: key);

  @override
  _TelaHomeState createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
  @override
  Widget build(BuildContext context) {

    final String obj = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Menu'),
            SizedBox(width: 240,),
            Icon(Icons.perm_identity),
            Text(obj),
          ],
        ),
        backgroundColor: Colors.blue.shade900,
      ),

      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            //BOTÃO PARA CALCULAR IMC
            Icon(
              Icons.table_view,
              color: Colors.blue.shade900,
              size: 50,
            ),

            ElevatedButton(
              //texto e estilo do texto
              child: Text(
                'Calcular IMC',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue.shade900,
                ),
              ),
                
              //estilo do botão 
              style: ElevatedButton.styleFrom( //para definir a cor do botão
                primary: Colors.white,
              ),

              onPressed: (){
                setState(() {
                  Navigator.pushNamed(context, 'imc');
                });
              },

            ),

            //BOTÃO PARA CALCULAR QUANTIDADE DE ÁGUA
            Icon(
              Icons.opacity,
              color: Colors.blue.shade900,
              size: 50,
            ),

            ElevatedButton(
              //texto e estilo do texto
              child: Text(
                'Quantidade Ideal de Água',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue.shade900,
                ),
              ),
                
              //estilo do botão 
              style: ElevatedButton.styleFrom( //para definir a cor do botão
                primary: Colors.white,
              ),

              onPressed: (){
                Navigator.pushNamed(context, 'agua');
              },

            ),

            //BOTÃO PARA CALCULAR BATIMENTOS CARDIACOS TOTAIS
            Icon(
              Icons.favorite,
              color: Colors.blue.shade900,
              size: 50,
            ),

            ElevatedButton(
              //texto e estilo do texto
              child: Text(
                'Calcular BPM',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue.shade900,
                ),
              ),
                
              //estilo do botão 
              style: ElevatedButton.styleFrom( //para definir a cor do botão
                primary: Colors.white,
              ),

              onPressed: (){
                Navigator.pushNamed(context, 'bpm');
              },

            ),

            //BOTÃO PARA O USUÁRIO DIGITAR SUAS METAS
            Icon(
              Icons.list,
              color: Colors.blue.shade900,
              size: 50,
            ),

            ElevatedButton(
              //texto e estilo do texto
              child: Text(
                'Metas',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue.shade900,
                ),
              ),
                
              //estilo do botão 
              style: ElevatedButton.styleFrom( //para definir a cor do botão
                primary: Colors.white,
              ),

              onPressed: (){
                Navigator.pushNamed(context, 'metas', arguments: obj);
              },

            ),

            TextButton(
              child: Text(
                'Sobre o aplicativo',
                style: TextStyle(
                  color: Colors.blue.shade900,
                ),
              ),
              onPressed: (){
                Navigator.pushNamed(context, 'sobre');
              },
            ),
          ],
        ),
      ),
    );
  }
}