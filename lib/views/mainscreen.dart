import 'package:emergency_call_app/main.dart';
import 'package:emergency_call_app/view_model/calls_view_model.dart';
import 'package:emergency_call_app/views/requestcallscreen.dart';
import 'package:emergency_call_app/widget/callcard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../generated/l10n.dart';
import '../model/language.dart';
import '../model/language_constant.dart';

class MainScreen extends StatelessWidget {
   MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        //title: Text(AppLocalizations.of(context)!.emergencyCallsApp ),
        title: Text(S.of(context)!.emergencyCallsApp,style: TextStyle(fontSize: 14), ),

        actions: <Widget>[

          Padding(
            padding: const EdgeInsets.only(left:10,right:10),
            child:
            DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale _locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, _locale);

                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                  value: e,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[

                      Text(
                        e.flag ,
                        style: const TextStyle(fontSize: 30),
                      ),
                      Text(e.name)
                    ],
                  ),
                ),
              )
                  .toList(),
            ),
          ),

        ],
      ),
      body: Container(

        child: Column(
      crossAxisAlignment:CrossAxisAlignment.start ,
      children: [

        Padding(
          padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: Text(S.of(context)!.emergencyCalls,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
        ),
        Expanded(

          child: Consumer<CallsViewModel>(
            builder: (context, value, child) {
              return GridView.builder(
                padding: const EdgeInsets.all(7),
                //physics: const NeverScrollableScrollPhysics(),
                itemCount: value.calls.length ,
               // shrinkWrap: true,
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:2,
                   // childAspectRatio:1/1.2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                     (MediaQuery.of(context).size.height / 1.4),
                  mainAxisSpacing: 10.0,
                 crossAxisSpacing: 10.0,
                ),

                itemBuilder: (context, index) {
                  if( index == value.calls.length-1){
                    return CallCard(image: AssetImage("images/request.jpg"),name:"",
                        nameOfCall: S.of(context).requestCall, color:Colors.blue.shade300, onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RequestCall(),
                              ));
                        });
                  }
                   else return CallCard(
                    image: value.calls[index].image,
                    name: value.calls[index].name,
                    nameOfCall: value.calls[index].nameOfCall,
                    color: value.calls[index].color,
                    onPressed:() =>
                        Provider.of<CallsViewModel>(context, listen: false)
                            .directCall(index),

                  );
                },
              );
            },
          ),
        ),
        // CallCard(image: AssetImage("images/request.jpg"), nameOfCall: "Request Call", color: Colors.blueAccent, onPressed: (){})
      ],
        ),
      ),
    );
  }
}
