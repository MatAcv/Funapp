import 'dart:async';
import 'dart:convert';
import 'package:funapp/src/models/denuncias_model.dart';
import 'package:http/http.dart' as http;

class DenunciasProvider{


List<Denuncia> _populares = new List();

final _popularesStreamController = StreamController<List<Denuncia>>.broadcast();


Function(List<Denuncia>) get popularesSkink=> _popularesStreamController.sink.add;

Stream<List<Denuncia>> get popularesStream=> _popularesStreamController.stream;

void disposeStream(){


  _popularesStreamController?.close();
}

Future<List<Denuncia>> getTitulo() async{

  final resp = await http.get ('http://192.168.0.10:8080/test/getdata.php');
  final decodedData = json.decode(resp.body);

 final denuncia = Den.parseJson(decodedData);
 //final denuncia = new Den.fromJsonList(decodedData);

 // print (denuncia.item[0].titulo);
  return denuncia;
  //return denuncia.item;


}










}