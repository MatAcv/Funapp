import 'dart:io';
import 'package:funapp/src/models/usuario_model.dart';
import 'package:funapp/src/pages/registro_denuncias.dart';
import 'package:wifi/wifi.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:funapp/src/models/denuncias_model.dart';
import 'package:funapp/src/models/texto_registro.dart';
import 'package:funapp/src/providers/denuncias_provider.dart';
import 'package:funapp/src/search/search_delegate.dart';
import 'package:funapp/src/widgets/card_swiper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get_ip/get_ip.dart';


class HomePage extends StatefulWidget {


String value;
HomePage({Key key, @required this.value}) : super (key : key);
  
  @override
  _HomePageState createState() => _HomePageState();

}



class _HomePageState extends State<HomePage> {


  String info;
  String ip;

  TextoRegistro txt = new TextoRegistro();

 
  
  Usuario usuario = Usuario();
 

  


     List<dynamic> lista = new List();
     final denunciasProvider = new DenunciasProvider();
     final denuncia = new Denuncia();
     List<Denuncia> ls = new List();

  @override
  Widget build(BuildContext context) {

  
     final Denuncia denuncia = ModalRoute.of(context).settings.arguments; 
    
    return Scaffold(
       appBar: AppBar(
         leading: new IconButton(
               icon: new Icon(Icons.power_settings_new, color: Colors.black),
               onPressed: () {

                 cerrarSesion();
               },
              ), 
        centerTitle: true,
        title : Text('Funapp',textAlign: TextAlign.center,),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon (Icons.search),
            onPressed: (){
                  showSearch(context: context, delegate: DataSearch());
            },
          )
        ],
      ),
       body: SingleChildScrollView(
         child: Container(
           child: Column(

             children: <Widget>[
               _swiperTarjetas(),
   
               RaisedButton(
                 child: Text("Enviar funa"),
                 onPressed :(){
                   _alertaPrimera();                  
                   //Navigator.pushNamed(context, 'registroFunas'); 
                   }               
               ) ,
                
                 WillPopScope(
                onWillPop: () async => false,
                    child: Container(),
              ),
             ],
           ),
         ),
       ),
     
       


    );
  }

  Widget _swiperTarjetas(){
     // return CardSwiper();

     return FutureBuilder(
      future: denunciasProvider.getTitulo(),
      builder: (BuildContext context, AsyncSnapshot <List>snapshot) {

        if (snapshot.hasData)
        {
      return CardSwiper(denuncias: snapshot.data);
          
        } else{

          return Container(
            height: 400.0,
            child: Center (
              child : CircularProgressIndicator()));
        }
        
      }
    );
     
 
  }


 Future <List> login() async{

   final response = await http.post("http://192.168.0.10:8080/test/login.php",body:{
     "username" : "Juan",
     "password" : "12345"

   });

    var datauser =json.decode(response.body);

    if(datauser.length == 0){
      print('incorrecto');
    }else{
      print('correcto');
    }
 }

 


   _alertaPrimera(){
    
      return 
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Importante, antes de que envies una funa:"),
          content: new Text("•Asegurate de completar todos los campos con * \n\n•No coloques Rut o domicilios. \n\n•Por el momento no podrás subir fotos, por eso pedimos el link al post original en facebook o instagram. \n\n •Porfavor, asegurate de copiar y pegar la historia en el campo requerido" ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Ir al registro"),
              onPressed: () {
                
               Navigator.of(context).pop();

              usuario.setCorreo(widget.value);
                    print(usuario.getCorreo());
                   var route = new MaterialPageRoute(
                   builder:  (BuildContext context){
                     return new RegistroFunas(value:widget.value);
                      }
                      );
                         Navigator.of(context).push(route);
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

}



  cerrarSesion(){
    
      return 
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Cerrar sesion"),
          content: new Text("Quieres cerrar la sesión?" ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Cerrar Sesión"),
              onPressed: () {
               Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/');
              },
            ),
            
          ],
        );
      },
    );
  

  }


Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You are going to exit the application!!'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: () {
                  Navigator.of(context).pop();  
                  Navigator.of(context).pop(); 
                  Navigator.pushNamed(context, '/');
                },
              ),
            ],
          );
        });
  }




  
}