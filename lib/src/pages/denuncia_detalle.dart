import 'package:flutter/material.dart';
import 'package:funapp/src/models/denuncias_model.dart';

class DetalleDenuncia extends StatelessWidget {


 @override
Widget build(BuildContext context) {
   final Denuncia denuncia = ModalRoute.of(context).settings.arguments; 
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
}