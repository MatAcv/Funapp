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

  final resp = await http.get ('http://192.168.0.10:8080/test/getdatauser.php');
  final decodedData = json.decode(resp.body);

 final denuncia = Us.parseJson2(decodedData);
 //final denuncia = new Den.fromJsonList(decodedData);

 // print (denuncia.item[0].titulo);
  return denuncia;
  //return denuncia.item;


}










}