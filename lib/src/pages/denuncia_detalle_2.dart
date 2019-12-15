import 'dart:convert';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:funapp/src/models/denuncias_model.dart';
import 'package:funapp/src/models/usuario_model.dart';
import 'package:funapp/src/providers/usuarios_provider.dart';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';



class DenunciaDetalleDos extends StatefulWidget {


  DenunciaDetalleDos({Key key}) : super(key: key);

  @override
  _DenunciaDetalleDosState createState() => _DenunciaDetalleDosState();
  
}

class _DenunciaDetalleDosState extends State<DenunciaDetalleDos> {
  

  String unico;
  String info;
  String info2;
  String id;
  bool view;
  String nick;
  Future<bool> res;
 final usuariosProvider = new UsuariosProvider();
  @override
  Widget build(BuildContext context) {
  final Denuncia denuncia = ModalRoute.of(context).settings.arguments; 
   getDevice();


id = denuncia.getId();
 



    
   return Stack(
        children:<Widget>[

          Image.asset(
            "lib/src/assets/image_05.png",
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          new Scaffold(
                backgroundColor: Colors.transparent,
      appBar: AppBar(
                 leading: new IconButton(
                 icon: new Icon(Icons.arrow_back, color: Colors.black),
                 onPressed: (){
                    insertaView(info,denuncia.getId()); 
                 Navigator.of(context).pop();
                   
                 }
                ), 
                title: Text(""),
                backgroundColor: Colors.purple[200],
                centerTitle: true,
              ),
      
       
      body:SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[

              Text(denuncia.getTitulo(), style: TextStyle(fontFamily: "Poppins-Bold",fontSize: 40,color:Colors.black), ),
              Padding(padding:EdgeInsets.only(top: 10.0)),
                Text('Por: '+denuncia.getNick() ,style: TextStyle(fontSize: 20,color:Colors.black),textAlign: TextAlign.start,),
               Padding(padding:EdgeInsets.only(top: 10.0)),
               Text('Funado: '+denuncia.getFunado() ,style: TextStyle(fontSize: 20,color:Colors.black),textAlign: TextAlign.start,),
                Padding(padding:EdgeInsets.only(top: 20.0)),
              Padding(padding:EdgeInsets.symmetric(horizontal: 10.0),child: Text(denuncia.getDescripcion(),style: TextStyle(fontFamily: "WorkSans-Thin",color:Colors.black,fontSize: 20))),
              Padding(padding:EdgeInsets.only(top: 20.0)),
           
      returnLink(denuncia.getLink()),
       new WillPopScope(
                  onWillPop: () async => false,
                   child: Container()
              ),              
            ],
          ),
        ),
      )     
  ),


        ] 
   );
  }




 getDevice() async{


  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;

var brand = androidInfo.androidId;

setState(() {
  info = brand;
 
});

}


 Future insertaView(String id_user, String id_denuncia) async{

 final response = await http.post( "https://funapp.cl/2y12R9v6Gka0XnCPCEzfv.6OY7Kc8gLY1Uokq62bXhbhaVbJoyxhyH6/addviewUser.php"  /* "http://192.168.0.10:8080/test/addviewUser.php" */
   ,body:{
     "id_user" : id_user,
     "id_denuncia" : id_denuncia,


   });


    var datauser =json.decode(response.body);

    if(datauser.length == 0){
      print('no existe view');


    await http.post( "https://funapp.cl/2y12R9v6Gka0XnCPCEzfv.6OY7Kc8gLY1Uokq62bXhbhaVbJoyxhyH6/addview.php"  /* 'http://192.168.0.10:8080/test/addview.php' */,body:{
     "id" : id,


   });  //inserta view
   
    await http.post("https://funapp.cl/2y12R9v6Gka0XnCPCEzfv.6OY7Kc8gLY1Uokq62bXhbhaVbJoyxhyH6/insertViewUser.php",body:{
     "id_user" : id_user,
     "id_denuncia" : id_denuncia,
   });  






    }else{
       print('existe view');
  
    }


  
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

  

  _openUrl(String urlx){

   
    var url = urlx;
    try{
    launch(url);


    }catch(PlatformException)  {
        print('ctm');
    }
    finally{
      print('asda');
    }
  }




  Widget returnLink(String link)
  {

      if(link.length > 0)
          {
            return  GestureDetector(
  child: Text("Ir al post original", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
  onTap: () {
  _openUrl(link);

      print('ctm');
  
  }
);
          }

          else{
            return Container();
          }


  }


 getNick(String id) async{

  final resp = await http.post( 'https://funapp.cl/2y12R9v6Gka0XnCPCEzfv.6OY7Kc8gLY1Uokq62bXhbhaVbJoyxhyH6/getNickFinal.php'  /* 'http://192.168.0.10:8080/test/getNickFinal.php' */, body: {
       "id" : id,

  });
  final decodedData = json.decode(resp.body);

 //final denuncia = Us.parseJson(decodedData);

 
 //final f = new Us.fromJsonList(decodedData);

 // print (denuncia.item[0].titulo);

 final f =  Us.parseJson(decodedData);
 nick = f;

 print(f);
 
  //return denuncia.item;


}




}