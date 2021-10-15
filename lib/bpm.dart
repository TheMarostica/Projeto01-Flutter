import 'package:flutter/material.dart';

class TelaBPM extends StatefulWidget {
  const TelaBPM({ Key? key }) : super(key: key);

  @override
  _TelaBPMState createState() => _TelaBPMState();
}

class _TelaBPMState extends State<TelaBPM> {
  var txtIdade = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcular o Batimento Cardíaco Máximo'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: (){
 
              setState(() {
                formKey.currentState!.reset();
                txtIdade.text = "";
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
                Icons.favorite,
                size: 120, 
                color: Colors.blue.shade900,
              ),
              campoTexto('Idade', txtIdade),
              botao('calcular'),
            ],
          ),
        ),
      ),

    );
  }
  Widget campoTexto(rotulo, variavel){ //rotulo = Idade | variavel = txtIdade
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8), //para deixar tudo simétrico
 
      child: TextFormField(
        //style: Theme.of(context).textTheme.headline1,
        controller: variavel,

        decoration: InputDecoration(
          labelText: rotulo,

          labelStyle: TextStyle(
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
              double idade = double.parse(txtIdade.text); //para não se importar se a pessoa está usando "," ou "."
              
              //220 = frequencia cardíaca máxima
              double quantBPM = 220 - idade;

              double quant60 = quantBPM * 0.60;
              double quant70 = quantBPM * 0.70;
 
              //exibir o resultado
              caixaDialogo('Quantidade cardíaca máxima: ${quantBPM}BPM\n\nO cardio deve ser feito entre 60% e 70% do seu batimento cardíaco máximo.\n\n60% = ${quant60.toStringAsFixed(2)}BPM\n70% = ${quant70.toStringAsFixed(2)}BPM');
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