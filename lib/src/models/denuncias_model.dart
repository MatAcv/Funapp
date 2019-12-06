import  'package:flutter/material.dart';
 import 'dart:math';
class Den{
   
List<Denuncia> item = new List();

Den.fromJsonList( List<dynamic> jsonList){


  if(jsonList == null)
return;

jsonList.forEach((item){
final actor = Denuncia.fromJsonMap(item);
item.add(actor);
});

}


static List<Denuncia> parseJson(dynamic response) {
    List<Denuncia> products = new List<Denuncia>();
    List jsonParsed = response.toList();
    for (int i = 0; i < jsonParsed.length; i++) {
      products.add(new Denuncia.fromJsonMap(jsonParsed[i]));
    }
    print(products[0].titulo);
    return products;
}





}

class Denuncia{

 Random asset = Random();

String id;
String titulo;
String descripcion;
String poster;
String views;


Denuncia({

this.id,
this.titulo,
this.descripcion,
this.poster,
this.views

});


Denuncia.fromJsonMap(Map<String,dynamic> json){


descripcion        = json['descripcion'];
id                 = json['id'];
titulo             = json['titulo'];
poster             = json['poster'];
views             = json['views'];

}


getTitulo(){


  return titulo;
}


getPoster(){

      return 'lib/src/assets/bg${poster}.jpeg';

}

getViews(){
  return views;
}

}