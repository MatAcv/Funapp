import 'package:flutter/material.dart';
import 'package:funapp/src/pages/denuncia_detalle.dart';
import 'package:funapp/src/pages/home_page.dart';
import 'package:funapp/src/pages/registro_denuncias.dart';




 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute : '/',
      routes: {
        '/' : (BuildContext context) => HomePage(),
        'detalleDenuncia' : (BuildContext context) =>DetalleDenuncia(),
        'registroFunas': (BuildContext context) =>RegistroFunas(),
 
      },
    );
  }
}