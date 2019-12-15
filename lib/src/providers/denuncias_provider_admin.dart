import 'dart:async';
import 'dart:convert';
import 'package:funapp/src/models/denuncias_model.dart';
import 'package:http/http.dart' as http;

class DenunciasProviderAdmin{


final _popularesStreamController = StreamController<List<Denuncia>>.broadcast();


Function(List<Denuncia>) get popularesSkink=> _popularesStreamController.sink.add;

Stream<List<Denuncia>> get popularesStream=> _popularesStreamController.stream;

void disposeStream(){


  _popularesStreamController?.close();
}

Future<List<Denuncia>>  getTitulo() async{

  final resp = await http.get ('https://funapp.cl/2y12R9v6Gka0XnCPCEzfv.6OY7Kc8gLY1Uokq62bXhbhaVbJoyxhyH6/getdataPaso.php');
  final decodedData = json.decode(resp.body);

 final denuncia = Den.parseJson(decodedData);
 //final denuncia = new Den.fromJsonList(decodedData);

 // print (denuncia.item[0].titulo);
  return denuncia;
  //return denuncia.item;


}


Future<List<Denuncia>> getProd() async{

  final resp = await http.get ('https://funapp.cl/2y12R9v6Gka0XnCPCEzfv.6OY7Kc8gLY1Uokq62bXhbhaVbJoyxhyH6/getdataProd.php');
  final decodedData = json.decode(resp.body);

 final denuncia = Den.parseJson(decodedData);
 //final denuncia = new Den.fromJsonList(decodedData);

 // print (denuncia.item[0].titulo);
  return denuncia;
  //return denuncia.item;


}










}