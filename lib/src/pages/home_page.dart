
import 'package:flutter/material.dart' as prefix0;
import 'package:funapp/src/appbar/navigation_bloc.dart';
import 'package:funapp/src/models/usuario_model.dart';
import 'package:funapp/src/pages/registro_denuncias.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:funapp/src/models/denuncias_model.dart';
import 'package:funapp/src/models/texto_registro.dart';
import 'package:funapp/src/providers/denuncias_provider.dart';
import 'package:funapp/src/search/search_delegate.dart';
import 'package:funapp/src/widgets/card_swiper.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:funapp/src/style/theme.dart' as Theme;

import 'home_page_admin.dart';



class HomePage extends StatefulWidget {


String value;
String nick;
HomePage({Key key, @required this.value, @required this.nick}) : super (key : key);
  
  @override
  _HomePageState createState() => _HomePageState();
  
}



class _HomePageState extends State<HomePage> {


  String info;
  String ip;

  TextoRegistro txt = new TextoRegistro();
  
  Usuario usuario = Usuario();
RoundedRectangleBorder roundedRectangleBorder = RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0)));

  


     List<dynamic> lista = new List();
     final denunciasProvider = new DenunciasProvider();
     final denuncia = new Denuncia();
     List<Denuncia> ls = new List();
    
  @override
  Widget build(BuildContext context) {

  
     final Denuncia denuncia = ModalRoute.of(context).settings.arguments; 
    
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Colors.purple[200],
         shape: roundedRectangleBorder,
      
         title: Text('Pagina Principal',style: TextStyle(fontFamily: "WorkSans-Thin"),textAlign:TextAlign.center,),
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("Admin"),
                currentAccountPicture:Container(  
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image:
                        AssetImage("lib/src/assets/bg9.jpeg"))
                        )),
                accountEmail: Text(widget.nick),
                decoration: BoxDecoration(
                  color: Colors.purple[200],)
                  ),               
            ListTile(
              title: Text("Home"),
              onTap: () {
                Navigator.of(context).pop();
                bloc.updateNavigation("Home");
              },
            ),
            ListTile(
              title: Text("Envia tu funa"),
              onTap: () {
                Navigator.of(context).pop();
              //  bloc.updateNavigation("PageOne");
                _alertaPrimera();
              },
            ),
            ListTile(
              title: Text("Buscar Funad@"),
              onTap: () {
                Navigator.of(context).pop();
                //bloc.updateNavigation("PageTwo");
                showSearch(context: context, delegate: DataSearch());
              },
            ),
             ListTile(
              title: Text("Cerrar Sesión"),
              onTap: () {
                Navigator.of(context).pop();
                cerrarSesion();
              },
            ),
          ],
        ),
      ),

       body: SingleChildScrollView(      
           child: Container(
               decoration: new BoxDecoration(
                 image: DecorationImage(
            image: AssetImage('lib/src/assets/image_05.png'),
            fit: BoxFit.cover,
          ),
                ),
             child: Column(

               children: <Widget>[                       
                 _swiperTarjetas(),
                   WillPopScope(
                  onWillPop: () async => false,
                      child: Container(),
                ),
                  Container(
                    height: 500.0,
                  )
               ],
             ),
           ),
         
       ),
     
       


    );
  }

  Widget _swiperTarjetas(){
     // return CardSwiper();

     return FutureBuilder(
      future: denunciasProvider.getTitulo(),
      builder: (BuildContext context, AsyncSnapshot <List>snapshot) {

        if (snapshot.hasData)
        {
      return CardSwiper(denuncias: snapshot.data);
          
        } else{

          return Container(
            height: 400.0,
            child: Center (
              child : CircularProgressIndicator()));
        }
        
      }
    );
     
 
  }


 Future <List> login() async{

   final response = await http.post("http://192.168.0.10:8080/test/login.php",body:{
     "username" : "Juan",
     "password" : "12345"

   });

    var datauser =json.decode(response.body);

    if(datauser.length == 0){
      print('incorrecto');
    }else{
      print('correcto');
    }
 }

 


   _alertaPrimera(){
    
      return 
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Importante, antes de que envies una funa:"),
          content: new Text("•Asegurate de completar todos los campos con * \n\n•No coloques Rut o domicilios. \n\n•Por el momento no podrás subir fotos, por eso pedimos el link al post original en facebook o instagram. \n\n •Porfavor, asegurate de copiar y pegar la historia en el campo requerido" ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Ir al registro"),
              onPressed: () {
                
               Navigator.of(context).pop();

              usuario.setCorreo(widget.value);
                    print(usuario.getCorreo());
                   var route = new MaterialPageRoute(
                   builder:  (BuildContext context){
                     return new RegistroFunas(value:widget.value);
                      }
                      );
                         Navigator.of(context).push(route);
              },
            ),
            
          ],
        );
      },
    );
  

  }



  
getDevice() async{


  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

var brand = androidInfo.id;
setState(() {
  info = brand;
});

}



  cerrarSesion(){
    
      return 
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Cerrar sesion"),
          content: new Text("Quieres cerrar la sesión?" ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            new FlatButton(
              child: new Text("Cerrar Sesión"),
              onPressed: () {
               Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.pushNamed(context, '/');
              },
            ),
            
          ],
        );
      },
    );
  

  }


Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Are you sure?'),
            content: Text('You are going to exit the application!!'),
            actions: <Widget>[
              FlatButton(
                child: Text('NO'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              FlatButton(
                child: Text('YES'),
                onPressed: () {
                  Navigator.of(context).pop();  
                  Navigator.of(context).pop(); 
                  Navigator.pushNamed(context, '/');
                },
              ),
            ],
          );
        });
  }


Color getColor(){


  return Colors.black;
}


getNick(String mail) async{

   final response = await http.post("http://yenya.000webhostapp.com/Home.php"
   ,body:{
     "mail" : mail,
   });
    var datauser =json.decode(response.body);
        return datauser;      
    
 }

  }