import 'package:flutter/material.dart';

class TelaMetas extends StatefulWidget {
  const TelaMetas({ Key? key }) : super(key: key);

  @override
  _TelaMetasState createState() => _TelaMetasState();
}

class _TelaMetasState extends State<TelaMetas> {

  var lista = []; //lista dinâmica
  var metas = TextEditingController(); //retorna a tarefa que o usuário adicionar

  var subLista = []; //subtitulo
  var subtitle = TextEditingController();

  @override
  void initState(){ //inicializar a lista
    lista.add('Adicione suas metas...');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suas Metas'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
      ),
      
      body: Container(
        padding: EdgeInsets.all(30),

        child: ListView.builder(
          itemCount: lista.length, //retorna os elementos

          itemBuilder: (context, index){
            return Card(
              color: Colors.grey.shade100,
              shadowColor: Colors.blue,
              elevation: 20, //movendo a sombra
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: ListTile(
                leading: Icon(Icons.arrow_right),

                title: Text(
                  lista[index],
                  style: TextStyle(fontSize: 20),
                ),

                trailing: IconButton(
                  icon: Icon(Icons.delete_outline_sharp),

                  onPressed: (){
                    setState(() { //para conseguir mudar o estado da tela
                      lista.removeAt(index);
                      ScaffoldMessenger.of(context).showSnackBar( //aparece uma barrinha embaixo
                        SnackBar( content: Text('Tarefa removida com sucesso'), duration: Duration(seconds: 2)),
                      );
                    });
                  },
                ),
              ),
            );
          }
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade900,
        child: Icon(Icons.add),

        onPressed: ()async{ //a aplicação vai ficar esperando que o usuário digite algo
          await showDialog(
            context: context, 
            builder: (context){
              return AlertDialog(
                title: Text(
                  'Adionar Tarefa',
                  style: TextStyle(fontSize: 16),
                ),

                content: TextField(
                  controller: metas,
                  style: TextStyle(fontSize: 22),
                  decoration: InputDecoration(),
                ),

                actions: [
                  TextButton(
                    child: Text('ok'),
                    onPressed: (){
                      setState(() {
                        var msg = '';

                        if(metas.text.isNotEmpty){
                          lista.add(metas.text);
                          metas.clear();
                          msg = 'Tarefa adicionada com sucesso';
                        }
                        else{
                          msg = 'Erro: A descrição da tarefa não foi informada';
                        }

                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(msg), duration: Duration(seconds: 2),),
                        );

                        Navigator.pop(context);

                      });
                    },
                  ),
                  TextButton(
                    child: Text('cancelar'),
                    onPressed: (){
                      Navigator.pop(context);
                    }, 
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}