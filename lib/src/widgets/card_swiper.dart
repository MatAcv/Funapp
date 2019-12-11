import 'dart:convert';

import 'package:funapp/src/models/denuncias_model.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class CardSwiper extends StatelessWidget {
  

       List<dynamic> denunciass = new List();
       final List<Denuncia> denuncias;
       final String pp ='';
       String poster = '';
       
  CardSwiper({this.denuncias});
 
  @override
  Widget build(BuildContext context) {  
   // getData();

    Denuncia d = new Denuncia();
   poster= d.getPoster();
 
     final _screenSize = MediaQuery.of(context).size;
  
    return Container(
      padding: EdgeInsets.only(top: 10.0),     
      child: Swiper(
          itemBuilder: (BuildContext context,int index){    
      return   GestureDetector(
         onTap: ()=>Navigator.pushNamed(context, 'denunciaDetalleDos', arguments : denuncias[index]),
              child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child:  Stack(
                              fit : StackFit.expand,
                             children:<Widget>[ 
                             FadeInImage(
                            image : AssetImage(denuncias[index].getPoster()),
                            placeholder: NetworkImage('https://sciences.ucf.edu/psychology/wp-content/uploads/sites/63/2019/09/No-Image-Available.png'),
                            fit : BoxFit.cover,
                          ),     
                          Container( 
  
                            padding: EdgeInsets.only(left: _screenSize.height *0.25, top: _screenSize.width * 0.015),
                            child : Column(
                              children: <Widget>[
                                  Icon(Icons.visibility),
                                  Container(
                                    child: Text("${denuncias[index].views}",overflow: TextOverflow.ellipsis,),
                                  ),  
                              ],
                            )                          
                            ),

                          Container( 
                            padding: EdgeInsets.only(left: 20.0,top: 40.0),   
                            margin: EdgeInsets.all(10.0),                    
                            child: Text("${denuncias[index].titulo}",style: TextStyle(fontSize: 25 ),),),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.only(left: 20.0,top: 200.0),    
                              child: Text("${denuncias[index].descripcion}",overflow: TextOverflow.visible,),
                            ),
                            
                            

                            
                          ],
                      ),
                      ),
      );
             
          },
          itemCount: denuncias.length,
          layout: SwiperLayout.STACK,
          itemWidth: _screenSize.width *0.7,
          itemHeight: _screenSize.height * 0.5,      
       // control: new SwiperControl(),
        ),
    );
  }





}