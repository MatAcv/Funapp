import 'dart:convert';
import 'dart:math';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:funapp/src/models/texto_registro.dart';
import 'package:funapp/src/models/usuario_model.dart';

import 'package:http/http.dart' as http;


class RegistroFunas extends StatefulWidget {

String value;
RegistroFunas({Key key, @required this.value}) : super (key : key);

  @override
  _RegistroFunasState createState() => _RegistroFunasState();
}

class _RegistroFunasState extends State<RegistroFunas> {

  String info;

  final TextEditingController tituloFuna = TextEditingController();
  final TextEditingController nomFunado = TextEditingController();
  final TextEditingController hist = TextEditingController();
  final TextEditingController link = TextEditingController();

   final usuario = new Usuario();

  Random rnd = new Random();
  int r ;
  String p;
  bool existeEnv;
  String tituloS;
  String funadoS;
  String histS;
  String linkS;
  String correo ;
  String nick;
  String idUser;



  TextoRegistro txt = new TextoRegistro();

  
   @override
  Widget build(BuildContext context) {

    getDevice();


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[200],
        title: Text('Envía tu funa',style: TextStyle(fontFamily: "WorkSansBold"),),
      ),
      body: Container(
         decoration: new BoxDecoration(
                 image: DecorationImage(
            image: AssetImage('lib/src/assets/image_05.png'),
            fit: BoxFit.cover,
          ),
                ),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(               
                    maxLength: 50,
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
                  
                  maxLength: 50,
                  controller: nomFunado,
                  decoration: InputDecoration(
                      labelText: "Nombre del Funado *",          
                        hintText: 'Escribe el nombre completo del funado',
                      

                  ),
                  onChanged: (valor){

                  },
                ),
                
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: new TextField( 
                  maxLength: 6000,
                decoration: const InputDecoration(
                hintText: 'Copia y pega aqui toda la historia',
                labelText: 'Funa **',
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
                   maxLength: 100,       
                  controller: link,
                  decoration: InputDecoration(
                      labelText: "Link post red social",          
                        hintText: 'Pega el link acá del post en Instagram o Facebook',
                        counterText: 'Copia y pega el link con formato https://www.instagram.com/p/xxxx'
                        
                  ),
                ),
                
              ),
               Container(
                    height: 500.0,
                  ),
            ],        
          ),
        ),
      ),
      
      
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
            
           getId(widget.value);
           getUsername(widget.value);

          existeDen(info);

          if(tituloFuna.text.trim() =='' || nomFunado.text.trim() =='' || hist.text.trim() =='')
          {
          completeCampos();
          }else{
              enviarFuna();
          }
          



          
          
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



 enviarRegistro(String titulo, String descripcion, String poster, String link, String id_f,String idUser, String nick ) async{


   final resp= await http.post("http://yenya.000webhostapp.com/adddata_paso.php",body:{
     "titulo" : titulo,
     "descripcion" : descripcion,
     "poster" : poster,
     "link_post" : link,
     "id_funado" : id_f,
     "id_user" : idUser,
     "nick" : nick,

   });

   return resp;

 }



setPoster(){


int min = 0;
int max = 22;
 r = min + rnd.nextInt(max - min);

p =r.toString();




}

 Future<String> getDevice() async{


  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

var brand = androidInfo.androidId;

setState(() {
  info = brand;
});

return info;

}



enviarFuna(){

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

                  if(existeEnv==false){

                  
               insertFecDen(info);
                setPoster();
                enviarRegistro(tituloFuna.text, hist.text, p ,link.text, nomFunado.text,idUser, nick);               
               Navigator.of(context).pop();
              Navigator.of(context).pop();
                _alertaPrimera();

                  }else{
                    yaEnviaste();

                  }
              },
            ),
            
                ],
              );
            },
          );

}

    
   completeCampos(){
    
      return 
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Mensaje"),
          content: new Text("Completa todos los campos con *" ),
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


 getUsername(String mail) async{

   final response = await http.post("http://yenya.000webhostapp.com/getUsername.php"
   ,body:{
     "mail" : mail,
   });

    var datauser =json.decode(response.body);

   String denuncia = Us.parseJson(datauser);

      nick = denuncia;
    
 }
 getId(String mail) async{

   final response = await http.post("http://yenya.000webhostapp.com/getId.php"
   ,body:{
     "mail" : mail,
   });

    var datauser =json.decode(response.body);

   String denuncia = Us.parseJsonId(datauser);

      idUser = denuncia;
    
 }



 insertFecDen(String idUser) async{

final response = await http.post("http://yenya.000webhostapp.com/insertFecFuna.php"
   ,body:{
     "idUser" : idUser,
   });

 }


   existeDen(String idUser) async{

   final response = await http.post("http://yenya.000webhostapp.com/existeFuna.php",body:{
     "idUser" : idUser,
   });

    var datauser =json.decode(response.body);

    if(datauser.length == 0){
      print('no enviaste nada');
      existeEnv = false;
    }else{
      print('ya enviaste');
      existeEnv = true;
    }
 }

  yaEnviaste(){
    
      return 
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text("No puedes volver a enviar otra funa, intentalo mas tarde" ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
                 Navigator.of(context).pop();
              },
            ),
            
          ],
        );
      },
    );
  

  }

}