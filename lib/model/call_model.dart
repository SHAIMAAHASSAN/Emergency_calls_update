
import 'package:flutter/cupertino.dart';

class CallModel{
  ImageProvider image;
  String nameOfCall;
  String name;
  Color color ;
  void Function()? onPressed;
  CallModel({ required this.image,required this.name,required this.nameOfCall,required
  this.color});

}