import 'package:flutter/material.dart';

class TelaAgua extends StatefulWidget {
  const TelaAgua({ Key? key }) : super(key: key);

  @override
  _TelaAguaState createState() => _TelaAguaState();
}

class _TelaAguaState extends State<TelaAgua> {
  var txtPeso = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcular Quantidade de Água'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: (){
 
              setState(() {
                formKey.currentState!.reset();
                txtPeso.text = "";
                FocusScope.of(context).unfocus();
              });
 
            },
          ),
        ],
      ),

      body: Container(
        padding: EdgeInsets.all(30),

        child: Form(
          key: formKey,
          child: Column(
            children: [
              Icon(
                Icons.opacity, 
                size: 120, 
                color: Colors.blue.shade900,
              ),
              campoTexto('Peso', txtPeso),
              botao('calcular'),
            ],
          ),
        ),
      ),

    );
  }
  Widget campoTexto(rotulo, variavel){ //rotulo = Peso | variavel = txtPeso
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8), //para deixar tudo simétrico
 
      child: TextFormField(
        //style: Theme.of(context).textTheme.headline1,
        controller: variavel,

        decoration: InputDecoration(
          labelText: rotulo,

          labelStyle: TextStyle( //vai mudar o "Peso"
            fontSize: 20,
            color: Colors.blue.shade900,
          ),

          hintText: 'Entre com o valor', //palavras quando você clica para digitar
          hintStyle: TextStyle( 
            fontSize: 20,
            color: Colors.black26,
          ),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),

        validator: (value){
          value = value!.replaceFirst(',', '.');
          if (double.tryParse(value) == null){
            return 'Entre com um valor numérico';
          }else{
            return null;
          }
        },
      ),
    );
  }

  Widget botao(rotulo){ //botão para calcular
    return Container(
      width: 200,
      height: 70,
      padding: EdgeInsets.symmetric(vertical: 12),

      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          primary: Colors.blue.shade900
        ),

        child: Text(rotulo),
        onPressed: (){
          
          if (formKey.currentState!.validate()){  
            setState(() {
              double peso = double.parse(txtPeso.text.replaceFirst(',', '.')); //para não se importar se a pessoa está usando "," ou "."
              
              double quantAgua = peso * 0.035;
 
              //exibir o resultado
              caixaDialogo('Quantidade de água ideal por dia: ${quantAgua.toStringAsFixed(2)} litros');
            });
 
          }
        
        },
        
      ),
 
    );
  }

  caixaDialogo(msg){
    return showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text('Resultado'),
          content: Text(msg),
          actions: [
            TextButton(
              child: Text('fechar'),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }
}