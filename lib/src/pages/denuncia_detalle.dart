import 'package:flutter/material.dart';
import 'package:funapp/src/models/denuncias_model.dart';

class DetalleDenuncia extends StatelessWidget {

ScrollController _scrollController;

 @override
Widget build(BuildContext context) {
   final Denuncia denuncia = ModalRoute.of(context).settings.arguments; 
   final _box = denuncia.getDescripcion();
   double reciprocal(double d) => 1 / d;
   double length = _box.length.toDouble();

  
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

          ]
        );
      },


    ),
        
  );
}





Widget scroll(Denuncia denuncia){


  return new Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage(denuncia.getPoster()), fit: BoxFit.cover,),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(top: 100.0),
          padding: EdgeInsets.only(left: 10.0),
          child: new 
          Text(denuncia.getTitulo(),
            style: TextStyle(
              fontSize: 40.0
            ),),
        ),
        new Container(
          width: 100.0,
          height: 100.0,
          margin: EdgeInsets.only(top:200.0),
          child: FadeInImage(
         image: NetworkImage('https://es.zenit.org/wp-content/uploads/2018/05/no-image-icon.png'),
         placeholder: NetworkImage('https://es.zenit.org/wp-content/uploads/2018/05/no-image-icon.png'),
          )
        ),
        new Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(top: 300.0),
          child: Text(denuncia.descripcion,style: TextStyle(fontSize: 18.0),),

        )
      ],
    );



  
}







Widget _verticalScrollView(Denuncia denuncia){


 return new Scaffold(
    body: CustomScrollView(

      slivers: <Widget>[
        SliverFixedExtentList(
          itemExtent: 1500,
          delegate: SliverChildListDelegate(
            [
              Stack(
      children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new AssetImage(denuncia.getPoster()), fit: BoxFit.cover,),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(top: 100.0),
          padding: EdgeInsets.only(left: 10.0),
          child: new 
          Text(denuncia.getTitulo(),
            style: TextStyle(
              fontSize: 40.0
            ),),
        ),
        new Container(
          width: 100.0,
          height: 100.0,
          margin: EdgeInsets.only(top:200.0),
          child: FadeInImage(
         image: NetworkImage('https://es.zenit.org/wp-content/uploads/2018/05/no-image-icon.png'),
         placeholder: NetworkImage('https://es.zenit.org/wp-content/uploads/2018/05/no-image-icon.png'),
          )
        ),
        new Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.only(top: 300.0),
          child: Text(denuncia.descripcion,style: TextStyle(fontSize: 18.0),),

        ),
        
        
      ],
    )



            ]
          ),
          
        )
      ],

    ),
  );

}



Widget crearAppBar(Denuncia denuncia){

  
    return SliverAppBar(

      elevation: 2.0,
      backgroundColor: Colors.indigoAccent,
      expandedHeight:0.0 ,
      floating: false,
      pinned: true,
      flexibleSpace:FlexibleSpaceBar(
        centerTitle: true,
        title: Text(
        'Funa',
        style: TextStyle(color : Colors.white, fontSize: 20.0),
        ),    
        ) ,


    );


}
 

}