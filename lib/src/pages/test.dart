import 'package:flutter/material.dart';


@override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(image: new DecorationImage(image: new AssetImage('lib/src/assets/bg5.jpeg'), fit: BoxFit.fill)),
          ),
          SingleChildScrollView(
            child: new Container(
              color: Colors.transparent,
              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Padding( padding: EdgeInsets.only(top: 50.0)),

                    ],
                  ),         
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }