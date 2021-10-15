import 'package:flutter/material.dart';
import 'package:projeto01/dados.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({ Key? key }) : super(key: key);

  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {

  var nome = TextEditingController();
  var email = TextEditingController();
  var senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900, // ou Color(0xFF0D47A1),

        title: Text('Cadastro'),
      ),

      body:Container(
        padding: EdgeInsets.all(20), //espaçamento

        child: Center(

          child: Column(
            children: [
              
              Text('Preencha os campos abaixo:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.blue.shade900,
                ),
              ),

              Padding(padding: EdgeInsets.all(10)),

              Column(//caixas para realizar o cadastro
                children: [

                  TextField( //campo do email
                    controller: email,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0), //deslocar o texto de dentro

                      border: OutlineInputBorder( //borda arredondada
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),

                      labelText: 'E-mail',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.blue.shade900,
                      ),
                      
                      hintText: 'Digite seu e-mail',
                      hintStyle: TextStyle(
                        color: Colors.black12,
                      ),
                    ),
                  ),

                  Padding(padding: EdgeInsets.all(3)),

                  TextField( //campo do nome
                    controller: nome,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9)),

                        borderSide: BorderSide(
                          color: Colors.blue.shade900,
                        ),

                      ),

                      labelText: 'Nome',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.blue.shade900,
                      ),

                      hintText: 'Digite seu nome',
                      hintStyle: TextStyle(color: Colors.black12),

                    ),
                  ),

                  Padding(padding: EdgeInsets.all(3)),

                  TextField( //campo da senha
                    controller: senha,

                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),

                      labelText: 'Senha',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.blue.shade900,
                      ),

                      hintText: 'Digite sua senha',
                      hintStyle: TextStyle(color: Colors.black12),
                    ),

                  ),
                ],
              ),

              Padding(padding: EdgeInsets.all(10)),

              ElevatedButton(
                child: Text('Confirmar',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                
                onPressed: (){
                  setState(() {
                    var obj = Dados(
                      nome.text,
                      email.text,
                      senha.text,
                    );

                    Navigator.pushNamed(context, 'login', arguments: obj);
                  });
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue.shade900,
                ),
              ),

            ],

          ),

        ),

      ),
      
    );
  }
}