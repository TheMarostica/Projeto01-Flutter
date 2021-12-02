import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TelaCadastro extends StatefulWidget {
  const TelaCadastro({ Key? key }) : super(key: key);

  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  var cpf = TextEditingController();
  var nome = TextEditingController();
  var email = TextEditingController();
  var senha = TextEditingController();
  var telefone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)?.settings.arguments;

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

                  TextField( //campo do cpf
                    controller: cpf,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9)),

                        borderSide: BorderSide(
                          color: Colors.blue.shade900,
                        ),

                      ),

                      labelText: 'CPF',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.blue.shade900,
                      ),

                      hintText: 'Digite seu CPF',
                      hintStyle: TextStyle(color: Colors.black12),

                    ),
                  ),

                  Padding(padding: EdgeInsets.all(3)),

                  TextField( //campo do telefone
                    controller: telefone,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(9)),

                        borderSide: BorderSide(
                          color: Colors.blue.shade900,
                        ),

                      ),

                      labelText: 'Telefone',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.blue.shade900,
                      ),

                      hintText: 'Digite seu Telefone',
                      hintStyle: TextStyle(color: Colors.black12),

                    ),
                  ),

                  Padding(padding: EdgeInsets.all(3)),

                  TextField( //campo da senha
                    controller: senha,
                    obscureText: true,
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

              Padding(padding: EdgeInsets.all(3)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    child: OutlinedButton(
                      child: Text(
                        'Confirmar',
                        style: TextStyle(
                          color: Colors.blue.shade900,
                        ),
                      ),

                      //criando o usuário
                      onPressed: () {
                        if (id == null){
                          //
                          // ADICIONAR um NOVO DOCUMENTO
                          //
                          FirebaseFirestore.instance.collection('usuario').add({
                            'email': email.text,
                            'nome': nome.text,
                            'cpf': cpf.text,
                            'telefone': telefone.text,
                          });
                          
                        }else{
                          //
                          // ATUALIZAR UM DOCUMENTO EXISTENTE
                          //
                          FirebaseFirestore.instance.collection('usuario').doc(id.toString()).set({
                            'email': email.text,
                            'nome': nome.text,
                            'cpf': cpf.text,
                            'telefone': telefone.text,
                          });
                        }
                        criarConta(
                          email.text,
                          senha.text,
                        );
                      },

                    ),
                  ),
                  Container(
                    width: 150,
                    child: OutlinedButton(
                      child: Text(
                        'Cancelar',
                        style: TextStyle(
                          color: Colors.blue.shade900,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  void criarConta(email, senha) {

    FirebaseAuth.instance.
        createUserWithEmailAndPassword(email: email, password: senha)
        .then((value) {
          //se ele chegar aqui dentor, significa que deu certo

          exibirMensagem('Usuário cadastrado com sucesso!');
          Navigator.pop(context); //vai voltar para o login

        }).catchError((erro){ //caso haja algum erro
          if(erro.code == 'email-already-in-use'){
            exibirMensagem('ERRO: O email informado está em uso.');
          }else if(erro.code == 'invalid-email'){
            exibirMensagem('ERRO: email inválido');
          }else{
            exibirMensagem('ERRO: ${erro.message}');
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