import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({ Key? key }) : super(key: key);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  var txtNome = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.fromLTRB(30, 70, 30, 30), //para colocar um espaçamento
        //height: 300, //tamanho total que a tela pode ir

        child: Center(
          child: Column(
            children: [
              Icon(
                Icons.lock,
                color: Colors.blue.shade900,
                size: 100,
              ),
              
              Text(
                'Login',
                style: TextStyle( //estilo do testo
                  color: Colors.blue.shade900,
                  fontSize: 12,
                ),
              ),

              Column(
                children: [

                  Padding( //espaçamento entre o 'login' e as caixas de texto
                    padding: EdgeInsets.all(7),
                  ),

                  TextField(
                    controller: txtNome,
                    decoration: InputDecoration(

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

                  Padding( //espaçamento entre as caixas de texto
                    padding: EdgeInsets.all(5)
                  ),

                  TextField(
                    decoration: InputDecoration(

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

                child: Text(
                  'Entrar',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                
                style: ElevatedButton.styleFrom( //para definir a cor do botão
                  primary: Colors.blue.shade900,
                ),

                onPressed: (){
                  Navigator.pushNamed(context, 'home', arguments: txtNome.text);
                },

              ),

              TextButton(
                child: Text(
                  'Cadastre-se',

                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black38,
                  ),
                ),

                onPressed: (){
                  Navigator.pushNamed(context, 'cadastro');
                },
              ),

            ],
          ),
        ),
      ),
    );
  }
}