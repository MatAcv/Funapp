import 'dart:async';
import 'dart:convert';

import 'package:funapp/src/models/usuario_model.dart';
import 'package:http/http.dart' as http;

class UsuariosProvider{


final _popularesStreamController = StreamController<List<Usuario>>.broadcast();


Function(List<Usuario>) get popularesSkink=> _popularesStreamController.sink.add;

Stream<List<Usuario>> get popularesStream=> _popularesStreamController.stream;

void disposeStream(){


  _popularesStreamController?.close();
}

Future<List<Usuario>> getTitulo() async{

  final resp = await http.get ('https://funapp.cl/2y12R9v6Gka0XnCPCEzfv.6OY7Kc8gLY1Uokq62bXhbhaVbJoyxhyH6/getdata.php');
  final decodedData = json.decode(resp.body);

 final denuncia = Us.parseJson2(decodedData);
 //final denuncia = new Den.fromJsonList(decodedData);

 // print (denuncia.item[0].titulo);
  return denuncia;
  //return denuncia.item;


}










}