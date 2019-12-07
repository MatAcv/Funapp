import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:funapp/src/models/denuncias_model.dart';
import 'package:funapp/src/models/texto_registro.dart';
import 'package:funapp/src/providers/denuncias_provider.dart';
import 'package:funapp/src/widgets/card_swiper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

  TextoRegistro txt = new TextoRegistro();

     List<dynamic> lista = new List();
     final denunciasProvider = new DenunciasProvider();
     final denuncia = new Denuncia();
     List<Denuncia> ls = new List();
  
  @override
  Widget build(BuildContext context) {

    
     final Denuncia denuncia = ModalRoute.of(context).settings.arguments; 
    
    
    
    return Scaffold(
       appBar: AppBar(
        centerTitle: false,
        title : Text('Funas'),
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
                 child: Text("denuncia.titulo"),
                 onPressed: (){
                   
                   login();
                 }, 
               ),
               RaisedButton(
                 child: Text("chao"),
                 onPressed :(){
                   _alertaPrimera();
                   
                   //Navigator.pushNamed(context, 'registroFunas');
                   
                   
                   }
                
               ),
               RaisedButton(
                 child: Text("ver texto"),
                 onPressed :(){
                       Navigator.pushReplacement(
                      context,
                        MaterialPageRoute(builder: (_) => HomePage()));
                   
                   //Navigator.pushNamed(context, 'registroFunas');
                   
                   
                   }
                
               )
           
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
                Navigator.pushNamed(context, 'registroFunas');
              },
            ),
            
          ],
        );
      },
    );
  

  }





}