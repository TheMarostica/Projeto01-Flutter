import 'dart:math';
import 'package:flutter/material.dart';

class TelaIMC extends StatefulWidget {
  const TelaIMC({ Key? key }) : super(key: key);

  @override
  _TelaIMCState createState() => _TelaIMCState();
}

class _TelaIMCState extends State<TelaIMC> {
  var txtPeso = TextEditingController();
  var txtAltura = TextEditingController();
 
  var formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora IMC'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: (){
 
              setState(() {
                formKey.currentState!.reset();
                txtPeso.text = "";
                txtAltura.text = "";
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
                Icons.table_view,
                size: 120, 
                color: Colors.blue.shade900,
              ),
              campoTexto('Peso', txtPeso),
              campoTexto('Altura', txtAltura),
              botao('calcular'),
            ],
          ),
        ),
      ),
    );
  }
 
  //
  // CAMPO DE TEXTO para entrada de dados
  //
  Widget campoTexto(rotulo, variavel){
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8), //para deixar tudo simétrico
 
      child: TextFormField(
        //style: Theme.of(context).textTheme.headline1,
        controller: variavel,
        decoration: InputDecoration(
          labelText: rotulo,
          labelStyle: TextStyle( //vai mudar o "Peso" e a "Altura"
            fontSize: 20,
            color: Colors.blue.shade900,
          ),
          hintText: 'Entre com o valor',
          hintStyle: TextStyle( //vai mudar as palavras quando você clicar para digitar
            fontSize: 20,
            color: Colors.black26,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
 
        //
        // VALIDADOR
        //
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
              double altura = double.parse(txtAltura.text.replaceFirst(',', '.'));
              double imc = peso / pow(altura,2);
 
              String classificacao;

              if(imc<18.5){
                classificacao = "Abaixo do Peso";
              }else{
                if(imc>=18.5 && imc<25){
                  classificacao = "Peso Normal";
                }else{
                  if(imc>=25 && imc<30){
                    classificacao = "Sobrepeso";
                  }else{
                    if(imc>=30 && imc<35){
                      classificacao = "Obesidade Grau I";
                    }else{
                      if(imc>=35 && imc<40){
                        classificacao = "Obessidade Grau II";
                      }else{
                        classificacao = "Obesidade Grau III";
                      }
                    }
                  }
                }
              }

              //exibir o resultado
              caixaDialogo('IMC..................: ${imc.toStringAsFixed(2)}\nClassificação..: ' + classificacao);
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