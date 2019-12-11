
 import 'dart:math';
class Den{
   
List<Denuncia> item = new List();

Den();

Den.fromJsonList( List<dynamic> jsonList){


  if(jsonList == null)
return;

jsonList.forEach((item){
final actor = Denuncia.fromJsonMap(item);
item.add(actor);
});

}

 Den.fromJsonList2(List <dynamic> jsonList){

      if (jsonList == null) return;

      for (var item in jsonList)
      {
        final denuncia = new Denuncia.fromJsonMap(item);
        item.add(denuncia);
      }

  }





static List<Denuncia> parseJson(dynamic response) {
    List<Denuncia> products = new List<Denuncia>();
    List jsonParsed = response.toList();
    for (int i = 0; i < jsonParsed.length; i++) {
      products.add(new Denuncia.fromJsonMap(jsonParsed[i]));
    }
  
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
String link_post;
String id_funado;
String id_user;
String view_user;
String nick;

Denuncia({

this.id,
this.titulo,
this.descripcion,
this.poster,
this.views,
this.link_post,
this.id_funado,
this.id_user,
this.view_user,
this.nick


});


Denuncia.fromJsonMap(Map<String,dynamic> json){


descripcion        = json['descripcion'];
id                 = json['id'];
titulo             = json['titulo'];
poster             = json['poster'];
views              = json['views'];
link_post          = json['link_post'];
id_funado          = json['id_funado'];
id_user            = json['id_user'];
view_user          = json['view_user'];
nick               = json['nick'];

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

getDescripcion(){


  return descripcion;
}

getId(){


  return id;
}

getLink(){

  return link_post;
}


getIdUser(){
  return id_user;
}

getNick(){

  return nick;
}


getFunado(){

  return id_funado;
}
}