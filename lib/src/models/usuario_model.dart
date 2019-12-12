class Us{
   
static List<Usuario> item = new List();

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

static String parseJsonId(dynamic response) {
    List<Usuario> products = new List<Usuario>();
    List jsonParsed = response.toList();
    for (int i = 0; i < jsonParsed.length; i++) {
      products.add(new Usuario.fromJsonMap(jsonParsed[i]));
    }
    
    print(products[0].idUser);
    return products[0].idUser;
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

static List<Usuario> parseJson4(dynamic response) {
    List<Usuario> products = new List<Usuario>();
    List jsonParsed = response.toList();
    for (int i = 0; i < jsonParsed.length; i++) {
      products.add(new Usuario.fromJsonMap(jsonParsed[i]));
    }

    return products;
}

static String parseJson5(dynamic response) {
    List<Usuario> products = new List<Usuario>();
    List jsonParsed = response.toList();
    for (int i = 0; i < jsonParsed.length; i++) {
      products.add(new Usuario.fromJsonMap(jsonParsed[i]));
    }

    return products[0].nick;
}

static String parseJson6(dynamic response) {
    List<Usuario> products = new List<Usuario>();
    List jsonParsed = response.toList();
    for (int i = 0; i < jsonParsed.length; i++) {
      products.add(new Usuario.fromJsonMap(jsonParsed[i]));
    }
    print(products[0].primVez);
    return products[0].primVez;
}




}

class Usuario{


String id;
String priv;
String nick;
String pass;
String correo;
String test;
String idUser;
String primVez;


Usuario ({

this.id,
this.priv,
this.nick,
this.pass,
this.correo,
this.test,
this.idUser,
this.primVez

});


Usuario.fromJsonMap(Map<String,dynamic> json){


id         = json['id'];
priv       = json['priv'];
nick       = json['username'];
pass       = json['password'];
idUser     = json['idU'];
primVez    = json['primVez'];
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