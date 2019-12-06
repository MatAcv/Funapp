import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:funapp/src/models/denuncias_model.dart';
import 'package:funapp/src/providers/denuncias_provider.dart';
import 'package:funapp/src/widgets/card_swiper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

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
       body: Container(
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
              
             )
         
           ],
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

 




}