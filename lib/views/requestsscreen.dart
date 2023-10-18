import 'package:emergency_call_app/widget/requestinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../view_model/calls_view_model.dart';

class RequestsScreen extends StatefulWidget {
  RequestsScreen(
      {super.key,
      required this.name,
      required this.phone,
      required this.address});
  final name;
  final phone;
  final address;

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CallsViewModel>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple[200],
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                child: Icon(
                  Icons.delete,
                  color: Colors.black54,
                ),
                onTap:()=> value.deleteAllRequests(),
              ),
            ),
            Icon(Icons.settings, color: Colors.black54,),
          ],
          title: Text(
            S.of(context).requests,
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
        body: Consumer<CallsViewModel>(
          builder: (context, value, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("${value.numRequests}",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          S.of(context).totalRequests,
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Divider(),
                ),
// list view of cart
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: value.requests.length,
                      padding: EdgeInsets.all(12),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.cyan[50],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(value.requests[index].name,
                                        style: const TextStyle(fontSize: 16)),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      value.requests[index].phone,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      value.requests[index].address,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ]),
                              //SizedBox(  width: 250,),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Row(
                                  //crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    LoadingAnimationWidget.staggeredDotsWave(
                                      color: Colors.blue,
                                      size: 50,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    IconButton(
                                      icon: const Icon(Icons.cancel,size: 15,),
                                      onPressed: () =>
                                          Provider.of<CallsViewModel>(context,
                                                  listen: false)
                                              .deleteRequest(index),
                                    ),
                                  ],
                                ),
                              )

                            ],
                          ),

                        );
                      },
                    ),
                  ),
                ),

// total amount + pay now
              ],
            );
          },
        ),
      );
    });
  }
}
