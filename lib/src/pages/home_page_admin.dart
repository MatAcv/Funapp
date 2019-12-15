import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:funapp/src/models/denuncias_model.dart';
import 'package:funapp/src/models/texto_registro.dart';
import 'package:funapp/src/providers/denuncias_provider_admin.dart';
import 'package:funapp/src/widgets/card_swiper.dart';
import 'package:funapp/src/widgets/card_swiper_admin.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePageAdmin extends StatefulWidget {


  @override
  _HomePageAdminState createState() => _HomePageAdminState();
}



class _HomePageAdminState extends State<HomePageAdmin> {

  String info;

  TextoRegistro txt = new TextoRegistro();

     List<dynamic> lista = new List();
     final denunciasProvider = new DenunciasProviderAdmin();
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
        title : Text('Funas por aprobar',textAlign: TextAlign.center,),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon (Icons.search),
            onPressed: (){
                
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
                 child: Text("Eliminar Funas en produccion"),
                 onPressed :(){
                              
                   Navigator.pushNamed(context, 'homePageProd'); 
                   }               
               ) 
               ,
                  WillPopScope(
                onWillPop: _onBackPressed,
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
      return CardSwiperAdmin(denuncias: snapshot.data);
          
        } else{

          return Container(
            height: 400.0,
            child: Center (
              child : CircularProgressIndicator()));
        }
        
      }
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
          title: new Text("Importante, antes de que envies una funa:"),
          content: new Text("•Asegurate de completar todos los campos con * \n\n•No coloques Rut o domicilios. \n\n•Por el momento no podrás subir fotos, por eso pedimos el link al post original en facebook o instagram. \n\n •Porfavor, asegurate de copiar y pegar la historia en el campo requerido.\n\n •Si vas a copiar y pegar tu historia y esta tiene signos de exclamación(!) reemplazalos y escribelos manualmente en tu teclado"),
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
                Navigator.pushNamed(context, 'registroFunas');
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