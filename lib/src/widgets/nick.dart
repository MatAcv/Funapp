import 'package:flutter/material.dart';
import 'package:funapp/src/models/usuario_model.dart';


class Nick extends StatelessWidget {

final List<Usuario> nick;
  Nick ({@required this.nick});
 

  @override
  Widget build(BuildContext context) {
    

    return Container(

        child: ListView.builder(

           itemCount: 1,
      itemBuilder: (BuildContext context , int index){

        return Text(nick[index].getNikck());

      }


        ),
    );
    
    
  

  }
}