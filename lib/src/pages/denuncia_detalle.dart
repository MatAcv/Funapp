<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:funapp/src/models/denuncias_model.dart';

class DetalleDenuncia extends StatelessWidget {

=======
import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:funapp/src/models/denuncias_model.dart';
import 'package:funapp/src/providers/get_device.dart';

class DetalleDenuncia extends StatelessWidget {

ScrollController _scrollController;
>>>>>>> RamaUno

 @override
Widget build(BuildContext context) {
   final Denuncia denuncia = ModalRoute.of(context).settings.arguments; 
<<<<<<< HEAD
  return new Scaffold(
    body: new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage(denuncia.getPoster()), fit: BoxFit.cover,),
          ),
        ),
        new Center( 
          child: new Text("Hello background"),
        )
      ],
    )
  );
}
=======
   final _box = denuncia.getDescripcion();
   double reciprocal(double d) => 1 / d;
   double length = _box.length.toDouble();

   Future<String> info;

  
  
  return new Scaffold(

    appBar: AppBar(
               leading: new IconButton(
               icon: new Icon(Icons.arrow_back, color: Colors.black),
               onPressed: () => Navigator.of(context).pop(),
              ), 
              title: Text("Testimonio"),
              centerTitle: true,
            ),
    
    body:ListView.builder( 
  
      itemCount: 1,
      itemBuilder: (BuildContext context , int index){

     
        return Stack(
          children:<Widget>[
            new Container(
          margin: EdgeInsets.only(top: 100.0),
          padding: EdgeInsets.only(left: 10.0),
          child: new 
          Text(denuncia.getTitulo(),
            style: TextStyle(
              fontSize: 40.0
            ),),
        ),
              Container (
             padding:EdgeInsets.all(20.0) ,
             margin: EdgeInsets.only(top: 200.0),
            constraints: BoxConstraints.tightFor(height: length),
            child: Text(denuncia.getDescripcion(),style: TextStyle(fontSize: 18.0))
          ),
          FloatingActionButton(
            onPressed: (){},
          )

          ]
        );
      },


    ),
        
  );


}


>>>>>>> RamaUno
}