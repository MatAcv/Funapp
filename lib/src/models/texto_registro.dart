

class TextoRegistro{



String titulo;
String nombreF;
String funa;
String link;


TextoRegistro({
  this.titulo,
  this.nombreF,
  this.funa,
  this.link,
  });






 setNombre(String s){

   this.nombreF = s;

 }

  getTitulo(){
    return titulo;
  }

  getNombre(){

    final f = nombreF;

    return f;
  }

  getFuna(){
    return funa;
  }

  getLink(){

    return link;
  }

}