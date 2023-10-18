import 'package:emergency_call_app/model/request_model.dart';
import 'package:emergency_call_app/views/requestsscreen.dart';
import 'package:emergency_call_app/widget/dropdownwidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../generated/l10n.dart';
import '../view_model/calls_view_model.dart';

class RequestCall extends StatefulWidget {
   RequestCall({super.key});

  @override
  State<RequestCall> createState() => _RequestCallState();
  }

class _RequestCallState extends State<RequestCall> {

  @override
  Widget build(BuildContext context) {
  //  Request newRequest = Request(nameController.text, phoneController.text, addressController.text);
    return Consumer<CallsViewModel>(
        builder: (context, value, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            /*floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return   RequestsScreen(name: value.nameController.text,
                        phone: value.phoneController.text,
                        address: value.addressController.text);
                  },
                ),
              ),
              child: const Icon(Icons.shopping_bag),
            ),*/
            appBar: AppBar(
              backgroundColor: Colors.purple[200],
              elevation: 0,
              title: Text(S.of(context).requestCall,
//style: GoogleFonts.notoSerif(
                style: TextStyle(
                  fontSize:28,
                  fontWeight: FontWeight.bold,
                ),),
              iconTheme: IconThemeData(
                color: Colors.black54,
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  DropDownBox(),
                  Container(
//width: 550,
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: value.nameController,

                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'Name',
                      ),
                    ),
                  ),
                  Container(
                   
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: value.phoneController,


                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'Phone Number',
                      ),
                    ),
                  ),
                  Container(
                    
                    margin: EdgeInsets.all(10),
                    child: TextField(
                      controller: value.addressController,


                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'Address',
                      ),
                    ),
                  ),
                  Container(margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        //Provider.of<CallsViewModel>(context, listen: false)
                            value.addRequest(Request(value.nameController.text,value.phoneController.text,value.addressController.text));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>

                                 RequestsScreen(name: value.nameController.text,
                                      phone: value.phoneController.text,
                                    address: value.addressController.text),
                            )
                        );
                          value.nameController.clear();
                            value.phoneController.clear();
                            value.addressController.clear();
                      },
                      
                      child: Text(
                        S.of(context).save, style: TextStyle(color: Colors.white,fontSize: 14),),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueAccent),
                      ),
                    ),
                  )
                ],

              ),
            ),
          );
        });

  }
}


