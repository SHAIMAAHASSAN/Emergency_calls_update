import 'package:flutter/material.dart';
class CallCard extends StatelessWidget {
   CallCard({super.key,required this.image,required this.name, required this.nameOfCall,required
  this.color,required this.onPressed,});
  ImageProvider image;
  String name;
  String nameOfCall;
  Color color ;
  void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
     width: 200,
     //height: 200,
     // height:MediaQuery.of(context).size.height*0.45,
     // width: double.infinity,
      //margin:EdgeInsets.all(5),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
    color: color,),
      constraints: BoxConstraints.tightFor(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
       // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 10,),
          Image(image: image,height: 100,fit: BoxFit.cover,),
          SizedBox(height: 10,),
          Text(name,maxLines: 2,style: TextStyle(fontSize: 12),),
          SizedBox(height: 10,),
          Padding(
            padding:  EdgeInsets.only(bottom:3.0),
            child: MaterialButton(
             // textTheme: ButtonTextTheme(),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              onPressed: onPressed,
              color: color,
              child: Text(
               nameOfCall,
                style: TextStyle(
                  //fontSize: 16,
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
