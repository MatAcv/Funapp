
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:funapp/src/providers/colors.dart';
import 'package:device_info/device_info.dart';
import 'package:funapp/src/providers/get_device.dart';
import 'package:http/http.dart' as http;


class RegistroUsuario extends StatefulWidget {
  RegistroUsuario({Key key}) : super(key: key);

  @override
  _RegistroUsuarioState createState() => _RegistroUsuarioState();
}

class _RegistroUsuarioState extends State<RegistroUsuario> {



final TextEditingController nombreUser = TextEditingController();
final TextEditingController pass = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController nick = TextEditingController();

Color color1 = HexColor("#CA8AB0");
String info;
bool bol = false;
bool registrado = false;

 
  @override
  Widget build(BuildContext context) {



    
 
   getDevice();
 

    final _screenSize = MediaQuery.of(context).size;
   
    return Scaffold(
      appBar: AppBar(
       
        title: Text('Registrate'),
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pop();
            Navigator.pushNamed(context, '/');

          }
        ),
      ),

      body: SingleChildScrollView(
   child: Stack(
          children: <Widget>[
            
            Padding(
              padding:EdgeInsets.symmetric(vertical: 350.0),
                child: Center(
                child: new Image.asset("lib/src/assets/image_02.png"),
              ),            
            ),
            Column(
              children: <Widget>[
                 Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(                              
                controller: nombreUser,
                decoration: InputDecoration(
                    labelText: "Nombre de usuario",          
                      hintText: 'Escribe tu nombre de usuario'
                ),
              ),
                        
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(   
                obscureText: true,                           
                controller: pass,
                decoration: InputDecoration(
                    labelText: "Contraseña",          
                      hintText: 'Escribe tu contraseña'
                ),
              ),
                        
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(                         
                controller: email,
                decoration: InputDecoration(
                    labelText: "Correo",          
                      hintText: 'Escribe tu correo'
                ),
              ),
                        
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(                         
                controller: nick,
                decoration: InputDecoration(
                    labelText: "Nick",          
                      hintText: 'Escoge tu nick'
                ),
              ),
                        
            ),

              Padding(
                padding: EdgeInsets.all(50),
                child: Text('Solo puedes registrarte una vez por IP'),
              ),
            


              ],
            ),
            

          ],
   
        ),
      ),
      

          floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {

          
         validaCampos();


            getDevice();

            if(bol == true){

             if(registrado == true)
              {
                 _registrado();
              }else{

              enviarUser(nombreUser.text,pass.text,info,email.text,'1',nick.text);             
              print('Valido');
               Navigator.of(context).pop();
            Navigator.pushNamed(context, '/');
            _alertaPrimera();
              }
    
            }
            else{
              print('Incorrecto');

            }
           
            print(info);
        
          
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
          content: new Text("Te has registrado, ya puedes ingresar" ),
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



getDevice() async{


  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

var brand = androidInfo.id;
setState(() {
  info = brand;
});

 final response = await http.post("http://yenya.000webhostapp.com/existeuser.php"
   ,body:{
     "username" : info,

   });


    var datauser =json.decode(response.body);

    if(datauser.length == 0){
      print('Usuario no registrado');
      registrado = false;


    }else{
       print('Usuario Existe');
       registrado = true;
    }




}




 enviarUser(String username,String password, String id_user, String mail, String priv, String nick) async{

    await http.post("http://yenya.000webhostapp.com/test.php",body:{
     "username" : username,
     "password" : password,
     "id_user" : id_user,
     "mail" : mail,
     "priv" : priv,
     "nick" : nick


   });

 }

bool isEmail(String em) {



  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(em);
}



_error(){
    
      return 
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text("Coloca un correo válido" ),
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


_campos(){
    
      return 
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text("Rellena todos los campos" ),
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


 validaCampos(){

  if (nombreUser.text.trim() == '' || pass.text.trim() =='' || email.text.trim()=='')
  {
     _campos();
  }else{

      if(isEmail(email.text)){

        print('correcto');
        bol = true;

      }else{

        _error();

      }

  }

}






getUser(String id) async{

   final response = await http.post("http://192.168.0.10:8080/test/existeuser.php"
   ,body:{
     "username" : id,

   });


    var datauser =json.decode(response.body);

    if(datauser.length == 0){
      print('Usuario no registrado');
      registrado = false;


    }else{
       print('Usuario Existe');
       registrado = true;
    }
 }




_registrado(){
    
      return 
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Error"),
          content: new Text("No puedes volver a registrarte, intentalo mas tarde"),
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
}