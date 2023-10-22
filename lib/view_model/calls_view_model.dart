import 'package:emergency_call_app/model/request_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart' ;

import '../generated/l10n.dart';
import '../model/call_model.dart';

class CallsViewModel extends ChangeNotifier {

  List<CallModel> calls =[
    CallModel(image: AssetImage("images/ambulance.jpg"), name: S.current.ambulance,nameOfCall: "123", color: Colors.red.shade50),
    CallModel(image: AssetImage("images/police.png"), name: S.current.police,nameOfCall: "122", color: Colors.blue.shade100),
    CallModel(image: AssetImage("images/fire.jpg"),name: S.current.fireDepartment , nameOfCall: "180", color: Colors.orange.shade100),
    CallModel(image: AssetImage("images/electricity.png"),name:S.current.electricityEmergency , nameOfCall: "121", color: Colors.green.shade100),
    CallModel(image: AssetImage("images/naturalgas.png"), name:S.current.naturalGasEmergency,nameOfCall: "129", color: Colors.yellow.shade200),
    CallModel(image: AssetImage("images/road.jpg"),name:S.current.roadRescue , nameOfCall: "01221110000", color: Colors.greenAccent.shade200),
    CallModel(image: AssetImage("images/drugs.jpg"),name: S.current.antiDrugs, nameOfCall: "08003300033", color: Colors.blueGrey.shade200),
    CallModel(image: AssetImage("images/Women.jpg"),name:S.current.theNationalCouncilforWomen , nameOfCall: "15115", color: Colors.purple.shade300),
    CallModel(image: AssetImage("images/water.jpg"),name: S.current.waterComplains, nameOfCall: "129", color: Colors.pink.shade100),
    CallModel(image: AssetImage("images/covid2.jpg"),name:S.current.covid19, nameOfCall: "105", color: Colors.greenAccent),
    CallModel(image: AssetImage("images/911.png"),name:"911", nameOfCall: "911", color: Colors.red.shade300),
    CallModel(image: AssetImage("images/request.jpg"),name:"",nameOfCall: S.current.requestCall, color:Colors.blueAccent)


  ];

  List<Request> requests = [];
  int get numRequests => requests.length;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  void addRequest(Request newRequest) {
    requests.add(newRequest);
    notifyListeners();
  }
  void deleteRequest(int requestIndex) {
    requests.removeAt(requestIndex);
    notifyListeners();
  }
  void deleteAllRequests() {
    requests.clear();
    notifyListeners();
  }
  void addCall(CallModel call) {
    calls.add(call);
    notifyListeners();
  }

  void directCall(int index) async  {
    String  call_number=calls[index].nameOfCall;
    bool? res = await  FlutterPhoneDirectCaller.callNumber(call_number);
    //final call = Uri.parse(call_number);
    //if (await canLaunchUrl(call)) {
   //   launchUrl(call);
   // } else {
     // throw 'Could not launch $call';
   // }

    notifyListeners();
  }


}