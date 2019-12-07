import 'dart:math';

import 'package:flutter/material.dart';
import 'package:funapp/src/models/texto_registro.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class RegistroFunas extends StatefulWidget {


  @override
  _RegistroFunasState createState() => _RegistroFunasState();
}

class _RegistroFunasState extends State<RegistroFunas> {


  final TextEditingController tituloFuna = TextEditingController();
  final TextEditingController nomFunado = TextEditingController();
  final TextEditingController hist = TextEditingController();
  final TextEditingController link = TextEditingController();



  Random rnd = new Random();
  int r ;
  String p;

  String tituloS;
  String funadoS;
  String histS;
  String linkS;



  TextoRegistro txt = new TextoRegistro();

  
   @override
  Widget build(BuildContext context) {

    


    nomFunado.text = txt.getNombre();
    return Scaffold(
      appBar: AppBar(
        title: Text('Envía tu funa'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                
                
                controller: tituloFuna,
                decoration: InputDecoration(
                    labelText: "Titulo *",          
                      hintText: 'Titulo de la funa'
                ),
              ),
             
              
            ),
             Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                
                
                controller: nomFunado,
                decoration: InputDecoration(
                    labelText: "Nombre del Funado *",          
                      hintText: 'Escribe el nombre completo del funado',


                ),
                onChanged: (valor){
                  txt.setNombre(valor);   
                  print(txt.getNombre());

                },
              ),
              
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: new TextField( 
              decoration: const InputDecoration(
              hintText: 'Copia y pega aqui toda la historia *',
              labelText: 'Funa',
                ),
            autofocus: false,
            maxLines: null,
            controller: hist,
            keyboardType: TextInputType.text,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(              
                controller: link,
                decoration: InputDecoration(
                    labelText: "Link post red social",          
                      hintText: 'Pega el link acá del post en Instagram o Facebook',
                ),
              ),
              
            ),
          ],
          


        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                title: new Text("Atención"),
                content: Text('Enviar funa?'),
                actions: <Widget>[
                    new FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Enviar"),
              onPressed: () {

                setPoster();
                enviarRegistro(tituloFuna.text, hist.text, p ,link.text, nomFunado.text, '1');
               Navigator.of(context).pop();
               
                Navigator.pushNamed(context, '/');

                _alertaPrimera();
              },
            ),
            
                ],
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.send),
      ),
    );
  }




    
   _alertaPrimera(){
    
      return 
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Mensaje"),
          content: new Text("Tu funa fue recibida, pronto estará publicada" ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            
          ],
        );
      },
    );
  

  }




 Future <List> enviarRegistro(String titulo, String descripcion, String poster, String link, String id_f, String id_u ) async{



    await http.post("http://192.168.0.10:8080/test/adddata.php",body:{
     "titulo" : titulo,
     "descripcion" : descripcion,
     "poster" : poster,
     "link_post" : link,
     "id_funado" : id_f,
     "id_user" : id_u

   });

 }



setPoster(){


int min = 0;
int max = 11;
 r = min + rnd.nextInt(max - min);

p =r.toString();




}




}