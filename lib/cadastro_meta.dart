import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({Key? key}) : super(key: key);

  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  var meta = TextEditingController();
  var descricao = TextEditingController();
  var email = TextEditingController();

  //
  //Retorna um único documento a partir do ID
  //
  getDocumentById(id) async{
    await FirebaseFirestore.instance.collection('metas')
      .doc(id).get().then((doc) {
        meta.text = doc.get('meta');
        descricao.text = doc.get('descricao');
      });
  }


  @override
  Widget build(BuildContext context) {
    //
    //Recuperar o ID da meta que foi selecionado pelo usuário
    //
    var id = ModalRoute.of(context)?.settings.arguments;

    if(id != null){
      if(meta.text.isEmpty && descricao.text.isEmpty){
        getDocumentById(id);
      }
    }

    return Scaffold(
      
      appBar: AppBar(
        title: Text('Adicionar Meta'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        automaticallyImplyLeading: false,
      ),

      body: Container(
        padding: EdgeInsets.all(30),
        child: ListView(children: [
          TextField(
            controller: meta,
            style: TextStyle(color: Colors.blue.shade900, fontSize: 36),
            decoration: InputDecoration(
              labelText: 'Meta',
              labelStyle: TextStyle(color: Colors.blue.shade900, fontSize: 22),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: descricao,
            style: TextStyle(color: Colors.blue.shade900, fontSize: 36),
            decoration: InputDecoration(
              labelText: 'Descrição',
              labelStyle: TextStyle(color: Colors.blue.shade900, fontSize: 22),
            ),
          ),
          SizedBox(height: 20),
          TextField(
            controller: email,
            style: TextStyle(color: Colors.blue.shade900, fontSize: 36),
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.blue.shade900, fontSize: 22),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                width: 150,
                child: OutlinedButton(
                  child: Text(
                    'Salvar',
                    style: TextStyle(color: Colors.blue.shade900),
                  ),
                  onPressed: () {

                    if (id == null){
                      //
                      // ADICIONAR um NOVO DOCUMENTO
                      //
                      FirebaseFirestore.instance.collection('metas').add({
                        'meta': meta.text,
                        'descricao': descricao.text,
                        'email': email.text,
                      });
                      
                    }else{
                      //
                      // ATUALIZAR UM DOCUMENTO EXISTENTE
                      //
                      FirebaseFirestore.instance.collection('metas').doc(id.toString()).set({
                        'meta': meta.text,
                        'descricao': descricao.text,
                        'email': email.text,
                      });
                    }

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Operação realizada com sucesso!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    Navigator.pop(context);
                    
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.all(5),
                width: 150,
                child: OutlinedButton(
                  child: Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.blue.shade900),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
