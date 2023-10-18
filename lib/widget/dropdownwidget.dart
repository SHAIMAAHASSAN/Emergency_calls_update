import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class DropDownBox extends StatefulWidget {
  const DropDownBox({super.key});

  @override
  State<DropDownBox> createState() => _DropDownBoxState();
}

class _DropDownBoxState extends State<DropDownBox> {
  List<String> options = [
    S.current.serviceName,
    S.current.ambulance,
    S.current.police,
    S.current.fireDepartment,
    S.current.electricityEmergency,
    S.current.naturalGasEmergency,
    S.current.roadRescue,
    S.current.antiDrugs,
    S.current.theNationalCouncilforWomen,
    S.current.waterComplains,
    S.current.covid19
  ];

  // Selected option.
  String selectedOption = S.current.serviceName;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(16)),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButton<String>(
        //menuMaxHeight:50,
        value: selectedOption,
        onChanged: (String? value) {
          setState(() {
            selectedOption = value!;
          });
        },
        underline: const SizedBox(),
        isExpanded: true,
        style: const TextStyle(color: Colors.black),
        dropdownColor: Colors.white,
        icon: const Icon(Icons.keyboard_arrow_down, color: Colors.black),
        selectedItemBuilder: (BuildContext context) {
          return options.map((String value) {
            return Align(
              alignment: Alignment.centerLeft,
              child: Text(
                selectedOption,
              ),
            );
          }).toList();
        },
        items: options.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
