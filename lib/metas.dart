import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TelaMetas extends StatefulWidget {
  const TelaMetas({ Key? key }) : super(key: key);

  @override
  _TelaMetasState createState() => _TelaMetasState();
}

class _TelaMetasState extends State<TelaMetas> {
  var meta = TextEditingController();
  var descricao = TextEditingController();
  String obj = "";

  var metas;

  exibirItemColecao(item){
    metas = FirebaseFirestore.instance.collection('metas').where('email', isEqualTo: obj);

    String meta = item.data()['meta'];
    String descricao = item.data()['descricao'];

    return ListTile(
      title: Text(meta, style: const TextStyle(fontSize: 30)),
      subtitle: Text(descricao, style: const TextStyle(fontSize: 15),),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: (){
          //
          //apagar o documento
          //
          metas.doc(item.id).delete();

        },
      ),

      //se ele clica em cima da meta, ele vai pra tela de cadastro para editar a meta
      onTap: (){
        Navigator.pushNamed(
          context, 'cadastro_meta',
          arguments: item.id, //estamos passando o ID do documento
        );
      },

    );
  }

  @override
  Widget build(BuildContext context) {
    obj = ModalRoute.of(context)!.settings.arguments as String;

    metas = FirebaseFirestore.instance.collection('metas').where('email', isEqualTo: obj);

    return Scaffold(
      appBar: AppBar(
        title: Text('Suas Metas'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),
      //backgroundColor: Colors.brown.shade100,

      //
      //LISTAR os documentos da COLEÇÃO
      //
      body: StreamBuilder<QuerySnapshot>( //vai permitir a atualização em tempo real de tudo que está acontecendo

        //fonte de dados (coleção)
        stream: metas.snapshots(),

        //exibir os dados retornados
        builder: (context, snapshot){

          //Verificar o estado da conexão
          switch(snapshot.connectionState){
            case ConnectionState.none:
              return const Center(child: Text('Não foi possível conectar ao Firestore'),);
            
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator(),);

            default:
              final dados = snapshot.requireData; //os dados estão como se fossem uma lista

              return ListView.builder(

                itemCount: dados.size,
                itemBuilder: (context, index){

                  return exibirItemColecao(dados.docs[index]);

                }
              );
          }
        }

      ),

      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade900,
        child: Icon(Icons.add),

        onPressed: (){
          Navigator.pushNamed(context, 'cadastro_meta');
        },
      ),
    
    );
  }

}