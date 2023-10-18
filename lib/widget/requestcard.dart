import 'package:flutter/material.dart';
class RequestCard extends StatelessWidget {
   RequestCard({super.key,this.name,this.phone,this.address});
   final name;
   final phone;
   final address;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(name),
        Text(phone),
        Text(address),
      ],),
    );
  }
}
