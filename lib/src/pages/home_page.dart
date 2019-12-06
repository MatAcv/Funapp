import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:funapp/src/widgets/card_swiper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {

     List<dynamic> lista = new List();
  
  @override
  Widget build(BuildContext context) {

    


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
               child: Text("hola"),
               onPressed: (){
                 login();
               },
             ),
             RaisedButton(
               child: Text("chao"),
               onPressed: (){
                
               },
             )
         
           ],
         ),
       ),
     
       


    );
  }

  Widget _swiperTarjetas(){

      return CardSwiper();
 
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
      print(datauser);
    }
 }

 




}