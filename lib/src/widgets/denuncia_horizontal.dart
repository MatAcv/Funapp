import 'package:flutter/material.dart';
import 'package:funapp/src/models/denuncias_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';


class DenunciaHorizontal extends StatelessWidget {
  PageController _pageController = PageController(initialPage: 0, keepPage: false);

final List<Denuncia> denuncias;
int previousPage =0;

DenunciaHorizontal({@required this.denuncias});
  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;
    return Container(

      height: _screenSize.height * 0.3,
      
      child: GestureDetector(
           
        
          child: PageView(
            
          pageSnapping: false,
          
          controller: PageController(
            keepPage: true,
          
            initialPage: 0,
            viewportFraction: 0.8
          ),
          onPageChanged:_onPageViewChange ,
          
          
          children: denuncias.map((denuncia){             
        return Container(
          margin: EdgeInsets.only(right: 15.0),
          child: Stack(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                  child: FadeInImage(
                  image: AssetImage(denuncia.getPoster()),
                  placeholder: NetworkImage('https://sciences.ucf.edu/psychology/wp-content/uploads/sites/63/2019/09/No-Image-Available.png'),
                  fit: BoxFit.cover,
                  height: 200.0,
                  width: 300.0,
                ),
              ),
              Container(     
                child : Column(
                 children: <Widget>[
                  Icon(Icons.visibility),
                   Container(
                    child: Text("${denuncia.getViews()}",overflow: TextOverflow.ellipsis,),
                       ), 
                       Container( 
                            padding: EdgeInsets.only(left: 20.0),   
                            margin: EdgeInsets.all(10.0),                    
                            child: Text("${denuncia.getTitulo()}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold ),),), 
                      ],
                    )                          
                ),
            ],
          ),
        );


    }).toList(),
          
        ),
        onTap: ()=>Navigator.pushNamed(context, 'denunciaDetalleDos', arguments : denuncias[previousPage]),
      ),

      
    );
  }

 


_onPageViewChange(int page) {   
  print("Current Page: " + page.toString());
   previousPage = page;

}


}