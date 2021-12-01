import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({ Key? key }) : super(key: key);

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {

  var email = TextEditingController();
  var senha = TextEditingController();
  bool isLoading = false;
  
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
                Icons.person,
                color: Colors.blue.shade900,
                size: 100,
              ),
              
              Text(
                'Login',
                style: TextStyle( //estilo do testo
                  color: Colors.black87,
                  fontSize: 12,
                ),
              ),

              Column(
                children: [

                  Padding( //espaçamento entre o 'login' e as caixas de texto
                    padding: EdgeInsets.all(7),
                  ),

                  TextField(
                    controller: email,
                    decoration: InputDecoration(

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9)),

                        borderSide: BorderSide(
                          color: Colors.blue.shade900,
                        ),
                      ),

                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.blue.shade900,
                      ),

                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
                      ),

                      hintText: 'Digite seu Email',
                      hintStyle: TextStyle(color: Colors.black12),

                    ),
                  ),

                  Padding( //espaçamento entre as caixas de texto
                    padding: EdgeInsets.all(5)
                  ),

                  TextField(
                    obscureText: true,
                    controller: senha,
                    decoration: InputDecoration(

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),

                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.blue.shade900,
                      ),

                      labelText: 'Senha',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.black54,
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

                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  login(email.text, senha.text);
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

  void login(email, senha){
    FirebaseAuth.instance.signInWithEmailAndPassword
        (email: email, password: senha).then((value) { //varifica se está tudo certo ou se deu um erro
          Navigator.pushNamed(context, 'home', arguments: email);
        }).catchError((erro){ //para mudar as mensagens de erro
          if(erro.code == 'user-not-found'){
            exibirMensagem('ERRO: Usuário não encontrado.');
          }else if(erro.code == 'wrong-password'){
            exibirMensagem('ERRO: Senha incorreta.');
          }else if(erro.code == 'invalid-email'){
            exibirMensagem('ERRO: Email inválido');
          }else{
            exibirMensagem('ERRO: ${erro.message}.');
          }
        });
  }

  void exibirMensagem(msg){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 2),
      )
    );
  }
  
}