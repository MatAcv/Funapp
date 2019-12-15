import 'package:flutter/material.dart';
import 'package:funapp/src/pages/denuncia_detalle.dart';
import 'package:funapp/src/pages/denuncia_detalle_2.dart';
import 'package:funapp/src/pages/denuncia_detalle_admin.dart';
import 'package:funapp/src/pages/denuncia_detalle_prod.dart';
import 'package:funapp/src/pages/home_page.dart';
import 'package:funapp/src/pages/home_page_admin.dart';
import 'package:funapp/src/pages/home_page_prod.dart';
import 'package:funapp/src/pages/login.dart';
import 'package:funapp/src/pages/recuperar_pass.dart';
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
        'homePage' : (BuildContext context) => HomePage(),
        'detalleDenuncia' : (BuildContext context) =>DetalleDenuncia(),
        'registroFunas': (BuildContext context) =>RegistroFunas(),
        '/' : (BuildContext context) => LoginPage(),
         'denunciaDetalleDos' : (BuildContext context) => DenunciaDetalleDos(),
         'homePageAdmin' : (BuildContext context) => HomePageAdmin(),
         'denunciaDetalleAdmin' : (BuildContext context) => DenunciaDetalleAdmin(),
         'homePageProd' : (BuildContext context) => HomePageProd(),
         'denunciaDetalleProd' : (BuildContext context) => DenunciaDetalleProd(),
         'recuperarPass' : (BuildContext context) => RecuperarPass(),
 
      },
    );
  }
}