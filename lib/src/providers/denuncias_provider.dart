import 'dart:async';
import 'dart:convert';
import 'package:funapp/src/models/denuncias_model.dart';
import 'package:http/http.dart' as http;

class DenunciasProvider{


final _popularesStreamController = StreamController<List<Denuncia>>.broadcast();


Function(List<Denuncia>) get popularesSkink=> _popularesStreamController.sink.add;

Stream<List<Denuncia>> get popularesStream=> _popularesStreamController.stream;

void disposeStream(){


  _popularesStreamController?.close();
}

Future<List<Denuncia>> getTitulo() async{

  final resp = await http.get ( 'http://yenya.000webhostapp.com/getdata.php'  /* 'http://192.168.0.10:8080/test/getdata.php' */);
  final decodedData = json.decode(resp.body);

 final denuncia = Den.parseJson(decodedData);
 //final denuncia = new Den.fromJsonList(decodedData);

 // print (denuncia.item[0].titulo);
  return denuncia;
  //return denuncia.item;


}


Future <List<Denuncia>> buscarDenuncia (String query) async{

  
    final resp = await http.post( 'http://yenya.000webhostapp.com/getFunado.php'  /* 'http://192.168.0.10:8080/test/getFunado.php' */, body: {
       "id_funado" : query,

  });
  final decodedData = json.decode(resp.body);
  // final f =  Den.parseJson(decodedData);

   final denuncias = Den.parseJson(decodedData);

      print(denuncias);


return denuncias;

}



Future <List<Denuncia>> buscarPoster (String query) async{

  
    final resp = await http.post( 'http://yenya.000webhostapp.com/getPoster.php'  /* 'http://192.168.0.10:8080/test/getFunado.php' */, body: {
       "id" : query,

  });
  final decodedData = json.decode(resp.body);
  // final f =  Den.parseJson(decodedData);

   final denuncias = Den.parseJson(decodedData);

      print(denuncias);


return denuncias;

}








}