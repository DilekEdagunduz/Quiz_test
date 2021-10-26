import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class MyRaisedButon extends StatelessWidget {
  final Widget child ;
  //final Color color;
  final VoidCallback onPressed ;  

  const MyRaisedButon({Key key,@required /*this.color*/ this.onPressed, @required this.child}) : super(key: key);@override

  Widget build(BuildContext context){
    return ElevatedButton(


      // Color: color,
            onPressed : onPressed,
            child: child,
            // (gerek yok )shape: RoundedRectangleBorder(Radius.circular(10))
            
            
            );
  }
}