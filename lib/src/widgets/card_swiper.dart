import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:funapp/src/pages/home_page.dart';

class CardSwiper extends StatelessWidget {

       List<dynamic> lista = new List();
       

 
  @override
  Widget build(BuildContext context) {  
    getData();

    const List<String> titles = [
  "Hellboy",
  "SpiderMan",
  "Juan"
];
     final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),     
      child: Swiper(
          itemBuilder: (BuildContext context,int index){     
            return  Container(  
              child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child:  Stack(
                            fit : StackFit.expand,
                           children:<Widget>[ 
                            FadeInImage(
                          image : AssetImage('lib/src/assets/bg0.jpeg'),
                          placeholder: AssetImage('lib/src/assets/bg0.jpeg'),
                          fit : BoxFit.cover,
                        ),
                        Container( 
                          padding: EdgeInsets.only(left: 20.0,top: 40.0),                       
                          child: Text('${titles[index]}',style: TextStyle(fontSize: 30 ),),),
                          Container(
                            padding: EdgeInsets.only(left: 20.0,top: 200.0),    
                            child: Text("$lista "),
                          )
                        ],
                    ),
                    ),
            );  
          },
          itemCount: 3,
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width *0.7,
          itemHeight: _screenSize.height * 0.5,      
       // control: new SwiperControl(),
        ),
    );
  }


Future <List> getData() async{

   final response = await http.get("http://192.168.0.10:8080/test/getdata.php");

    var datauser =json.decode(response.body);

    if(datauser.length == 0){
      print('incorrecto');
    }else{
        lista.add(datauser);
      print(lista);
    }
 }




}