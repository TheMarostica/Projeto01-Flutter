import 'package:flutter/material.dart';

class TelaDev extends StatefulWidget {
  const TelaDev({ Key? key }) : super(key: key);

  @override
  _TelaDevState createState() => _TelaDevState();
}

class _TelaDevState extends State<TelaDev> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desenvolvedor'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),

      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 1,
              ),
            ),
            child: Image.asset('lib/imagens/foto.jpg'),
          ),
          Container(
            child: Text(
              'Guilherme Marostica Rodrigues Oliveira',
            ),
          ),
        ],
      ),
    );
  }
}