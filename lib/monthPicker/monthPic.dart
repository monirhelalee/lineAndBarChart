import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MonthPic extends StatefulWidget {
  @override
  _MonthPicState createState() => _MonthPicState();
}

class _MonthPicState extends State<MonthPic> {

  String dropdownValueYear1 = DateTime.now().year.toString();
  String dropdownValueYear2 = DateTime.now().year.toString();
  String dropdownValueMonth1 = DateFormat.MMM().format(DateTime.now());
  String dropdownValueMonth2 = DateFormat.MMM().format(DateTime.now());



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      //color: Colors.green,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    height: 75,
                    width: 115,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Text("From Month",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            DropdownButton<String>(
                              value: dropdownValueMonth1,
                              onChanged: (String newValue){
                                setState(() {
                                  dropdownValueMonth1 = newValue;
                                });
                              },
                              style:TextStyle(fontSize: 13,fontWeight: FontWeight.bold, color: Colors.black),
                              items: <String>['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            DropdownButton<String>(
                              value: dropdownValueYear1,
                              onChanged: (String newValue){
                                setState(() {
                                  dropdownValueYear1 = newValue;
                                });
                              },
                              style:TextStyle(fontSize: 13,fontWeight: FontWeight.bold, color: Colors.black),
                              items: <String>[(DateTime.now().year-11).toString(),(DateTime.now().year-10).toString(),(DateTime.now().year-9).toString(),(DateTime.now().year-8).toString(),(DateTime.now().year-7).toString(),(DateTime.now().year-6).toString(),(DateTime.now().year-5).toString(),(DateTime.now().year-4).toString(),(DateTime.now().year-3).toString(),(DateTime.now().year-2).toString(),(DateTime.now().year-1).toString(),(DateTime.now().year).toString()].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    height: 75,
                    width: 115,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Text("To Month",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Row(
                          children: [
                            DropdownButton<String>(
                              value: dropdownValueMonth2,
                              onChanged: (String newValue){
                                setState(() {
                                  dropdownValueMonth2 = newValue;
                                });
                              },
                              style:TextStyle(fontSize: 13,fontWeight: FontWeight.bold, color: Colors.black),
                              items: <String>['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                            DropdownButton<String>(
                              value: dropdownValueYear2,
                              onChanged: (String newValue){
                                setState(() {
                                  dropdownValueYear2 = newValue;
                                });
                              },
                              style:TextStyle(fontSize: 13,fontWeight: FontWeight.bold, color: Colors.black),
                              items: <String>[(DateTime.now().year-11).toString(),(DateTime.now().year-10).toString(),(DateTime.now().year-9).toString(),(DateTime.now().year-8).toString(),(DateTime.now().year-7).toString(),(DateTime.now().year-6).toString(),(DateTime.now().year-5).toString(),(DateTime.now().year-4).toString(),(DateTime.now().year-3).toString(),(DateTime.now().year-2).toString(),(DateTime.now().year-1).toString(),(DateTime.now().year).toString()].map<DropdownMenuItem<String>>((String value){
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    height: 75,
                    width: 115,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      border: Border.all(color: Colors.black),
                      color: Colors.yellow,
                    ),
                    child: FlatButton(
                      child: Text("Filter",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      onPressed: () {
                        setState(() {
                          print("button pressed");
                        });
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
