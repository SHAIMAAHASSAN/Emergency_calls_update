import 'package:emergency_call_app/model/request_model.dart';
import 'package:emergency_call_app/views/mainscreen.dart';
import 'package:emergency_call_app/views/requestsscreen.dart';
import 'package:emergency_call_app/views/signInscreen.dart';
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
    GlobalKey<FormState> formstate = GlobalKey();
    //  Request newRequest = Request(nameController.text, phoneController.text, addressController.text);
    return Consumer<CallsViewModel>(builder: (context, value, child) {
      return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.purple.shade100,
          items: [
            BottomNavigationBarItem(

              icon: GestureDetector(child: Icon(Icons.home),onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainScreen(),
                  ),
                );
              } ,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: GestureDetector(child: Icon(Icons.person),onTap:(){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignInScreen(),
                  ),
                );
              } ,),
              label: 'Login',

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ),
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
          title: Text(
            S.of(context).requestCall,
//style: GoogleFonts.notoSerif(
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: IconThemeData(
            color: Colors.black54,
          ),
        ),
        body: Center(
          child: Form(
            key: formstate,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  CircleAvatar(backgroundImage:AssetImage("images/call.jpg") ,maxRadius: 60,) ,
                  SizedBox(
                    height: 10,
                  ),
                  DropDownBox(),
                  Container(
//width: 550,
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: value.nameController,
                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'Name',
                      ),
                      validator: (valuex) {
                        // Check if the name matches the regular expression.
                        if (valuex!.isEmpty ||
                            !RegExp(r'^[a-zA-Z ]+$').hasMatch(valuex)) {
                          return 'Please enter a valid name.';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: value.phoneController,
                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'Phone Number',
                      ),
                      validator: (valuex) {
                        // Check if the name matches the regular expression.
                        if (valuex!.isEmpty ||
                            !RegExp(r'^(02|010|011|012|015)\d{8}$')
                                .hasMatch(valuex)) {
                          return 'Please enter a valid Phone number.';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(top: 15, bottom: 20, right: 15, left: 15),
                    child: TextFormField(
                      controller: value.addressController,
                      decoration: const InputDecoration(
                        filled: true,
                        labelText: 'Address',
                      ),
                      validator: (valuex) {
                        // Check if the name matches the regular expression.
                        if (valuex!.isEmpty)
                        // !RegExp(r'^\((?:[0-9]+)(?:\s?[a-zA-Z]+)*\s?[a-zA-Z]+\s?[a-zA-Z]+\s?[a-zA-Z]+\)$')
                        //  .hasMatch(valuex))
                        {
                          return 'Please enter a valid Address.';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: ElevatedButton(
                      onPressed: () {
                        //Provider.of<CallsViewModel>(context, listen: false)
                        if (formstate.currentState!.validate()) {
                          value.addRequest(Request(
                              value.nameController.text,
                              value.phoneController.text,
                              value.addressController.text));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RequestsScreen(
                                    name: value.nameController.text,
                                    phone: value.phoneController.text,
                                    address: value.addressController.text),
                              ));
                          value.nameController.clear();
                          value.phoneController.clear();
                          value.addressController.clear();
                        }

                        // Show an error message.
                        else {
                          // Submit the form.
                          value.nameController.clear();
                          value.phoneController.clear();
                          value.addressController.clear();
                        }
                      },
                      child: Text(
                        S.of(context).save,
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blueAccent),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
