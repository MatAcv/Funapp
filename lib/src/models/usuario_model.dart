class Us{
   
List<Usuario> item = new List();

Us.fromJsonList( List<dynamic> jsonList){


  if(jsonList == null)
return;

jsonList.forEach((item){
final actor = Usuario.fromJsonMap(item);
item.add(actor);
});

}


static String parseJson(dynamic response) {
    List<Usuario> products = new List<Usuario>();
    List jsonParsed = response.toList();
    for (int i = 0; i < jsonParsed.length; i++) {
      products.add(new Usuario.fromJsonMap(jsonParsed[i]));
    }
    print(products[0].nick);
    return products[0].nick;
}


static List<Usuario> parseJson2(dynamic response) {
    List<Usuario> products = new List<Usuario>();
    List jsonParsed = response.toList();
    for (int i = 0; i < jsonParsed.length; i++) {
      products.add(new Usuario.fromJsonMap(jsonParsed[i]));
    }
    print(products[0].nick);
    return products;
}

static String parseJson3(dynamic response) {
    List<Usuario> products = new List<Usuario>();
    List jsonParsed = response.toList();
    for (int i = 0; i < jsonParsed.length; i++) {
      products.add(new Usuario.fromJsonMap(jsonParsed[i]));
    }

    return products[0].pass;
}




}

class Usuario{


String id;
String priv;
String nick;
String pass;
String correo;


Usuario ({

this.id,
this.priv,
this.nick,
this.pass,
this.correo

});


Usuario.fromJsonMap(Map<String,dynamic> json){


id         = json['id'];
priv       = json['priv'];
nick       = json['nick'];
pass       = json['password'];
}


getNikck(){


  return nick;
}

getPass(){


  return pass;
}


 String parseJson(dynamic response) {
    List<Usuario> products = new List<Usuario>();
    List jsonParsed = response.toList();
    for (int i = 0; i < jsonParsed.length; i++) {
      products.add(new Usuario.fromJsonMap(jsonParsed[i]));
    }
    print(products[0].priv);
    return products[0].priv;
}

setCorreo(String mail){

this.correo = mail;

}

getCorreo(){

  return correo;
}

}