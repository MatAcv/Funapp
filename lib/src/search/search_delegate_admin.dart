import 'package:flutter/material.dart';
import 'package:funapp/src/models/denuncias_model.dart';
import 'package:funapp/src/providers/denuncias_provider.dart';


class DataSearchAdmin extends SearchDelegate{


  final denunciasProvider = new DenunciasProvider();
  @override
  List<Widget> buildActions(BuildContext context) {

  

    // TODO: implement buildActions
    return [

      IconButton(
        icon : Icon(Icons.clear),
        onPressed: (){
          query='';

            print('0');
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {

    
    
    // TODO: implement buildLeading
    return IconButton(
      icon:AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        print('icon press');
        close(context, null);
      },
    ) ;
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
     final _screenSize = MediaQuery.of(context).size;
 
     if(query.isEmpty) {
      return 
      Container(
        padding: EdgeInsets.symmetric(horizontal: 100.0),
        child: Text('Busca por el nombre del funado'));
    }

   return FutureBuilder(
      future: denunciasProvider.buscarPoster(query),
      builder: (BuildContext context, AsyncSnapshot<List<Denuncia>> snapshot) {
        if(snapshot.hasData){
          final denuncias =snapshot.data;
          return ListView(

            children: denuncias.map((denuncia){
              return ListTile(
                /* leading: FadeInImage(
                  image: NetworkImage(denuncia.getPosterimg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  width: 50.0,
                  fit: BoxFit.contain,
                ), */
                title: Text(denuncia.titulo),
                subtitle:Text('Funa a : '+denuncia.id_funado+'\nid :'+denuncia.getId()) ,
                onTap: (){
                  close(context,null);                 
                  Navigator.pushNamed(context, 'denunciaDetalleProd',arguments: denuncia);
                },
              );
            }).toList( )
          );
        }else{
          return Center(
            child: CircularProgressIndicator(),
            
          );
        }
      },
    );
  }




}