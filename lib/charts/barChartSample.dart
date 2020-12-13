import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class Bar2 extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutable
  Bar2({Key key}) : super(key: key);

  @override
  _Bar2State createState() => _Bar2State();
}

class _Bar2State extends State<Bar2> {

  String dropdownValueYear1 = DateTime.now().year.toString();
  String dropdownValueYear2 = DateTime.now().year.toString();
  String dropdownValueMonth1 = DateFormat.MMM().format(DateTime.now());
  String dropdownValueMonth2 = DateFormat.MMM().format(DateTime.now());


  List<SalesData> chartData = [];
  Future<SalesData> getBarData() async {
    chartData.clear();
    var str =
        "https://raw.githubusercontent.com/voidMonir/dummyJson/main/monthlyPublish.json";
    var client = http.Client();
    var response = await client.get(str);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      setState(() {
        for (Map i in jsonMap) {
          chartData.add(SalesData.fromJson(i));
          //print(chartData);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getBarData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18)),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "From Month",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  value: dropdownValueMonth1,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValueMonth1 = newValue;
                                    });
                                  },
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  items: <String>[
                                    'Jan',
                                    'Feb',
                                    'Mar',
                                    'Apr',
                                    'May',
                                    'Jun',
                                    'Jul',
                                    'Aug',
                                    'Sep',
                                    'Oct',
                                    'Nov',
                                    'Dec'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                DropdownButton<String>(
                                  value: dropdownValueYear1,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValueYear1 = newValue;
                                    });
                                  },
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  items: <String>[
                                    (DateTime.now().year - 12).toString(),
                                    (DateTime.now().year - 11).toString(),
                                    (DateTime.now().year - 10).toString(),
                                    (DateTime.now().year - 9).toString(),
                                    (DateTime.now().year - 8).toString(),
                                    (DateTime.now().year - 7).toString(),
                                    (DateTime.now().year - 6).toString(),
                                    (DateTime.now().year - 5).toString(),
                                    (DateTime.now().year - 4).toString(),
                                    (DateTime.now().year - 3).toString(),
                                    (DateTime.now().year - 2).toString(),
                                    (DateTime.now().year - 1).toString(),
                                    (DateTime.now().year).toString()
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18)),
                          border: Border.all(color: Colors.black),
                        ),
                        child: Column(
                          children: [
                            Text(
                              "To Month",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                DropdownButton<String>(
                                  value: dropdownValueMonth2,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValueMonth2 = newValue;
                                    });
                                  },
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  items: <String>[
                                    'Jan',
                                    'Feb',
                                    'Mar',
                                    'Apr',
                                    'May',
                                    'Jun',
                                    'Jul',
                                    'Aug',
                                    'Sep',
                                    'Oct',
                                    'Nov',
                                    'Dec'
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                                DropdownButton<String>(
                                  value: dropdownValueYear2,
                                  onChanged: (String newValue) {
                                    setState(() {
                                      dropdownValueYear2 = newValue;
                                    });
                                  },
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  items: <String>[
                                    (DateTime.now().year - 12).toString(),
                                    (DateTime.now().year - 11).toString(),
                                    (DateTime.now().year - 10).toString(),
                                    (DateTime.now().year - 9).toString(),
                                    (DateTime.now().year - 8).toString(),
                                    (DateTime.now().year - 7).toString(),
                                    (DateTime.now().year - 6).toString(),
                                    (DateTime.now().year - 5).toString(),
                                    (DateTime.now().year - 4).toString(),
                                    (DateTime.now().year - 3).toString(),
                                    (DateTime.now().year - 2).toString(),
                                    (DateTime.now().year - 1).toString(),
                                    (DateTime.now().year).toString()
                                  ].map<DropdownMenuItem<String>>(
                                      (String value) {
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
                          borderRadius:
                              const BorderRadius.all(Radius.circular(18)),
                          border: Border.all(color: Colors.black),
                          color: Colors.yellow,
                        ),
                        child: FlatButton(
                          child: Text(
                            "Filter",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            setState(() {
                              print("button pressed");
                              getBarData();

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
        ),
        Container(
          height: 350,
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(18)),
            gradient: LinearGradient(
              colors: const [
                Colors.yellow,
                Color(0xff80cbc4),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Monthly Publish',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 5.0, left: 5.0),
                  child: Container(
                    margin: EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14.0)),
                    height: 400,
                    child: SfCartesianChart(
                      enableAxisAnimation: true,
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                      ),
                      primaryXAxis: CategoryAxis(
                        labelRotation: 300,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color:Colors.black),
                      ),
                      primaryYAxis: NumericAxis(
                        labelStyle: TextStyle(fontWeight: FontWeight.bold, color:Colors.black),
                      ),
                      //legend: Legend(isVisible: true),
                      series: <ChartSeries>[
                        ColumnSeries<SalesData, String>(
                          dataSource: chartData,
                          xValueMapper: (SalesData series, _) => series.month,
                          yValueMapper: (SalesData series, _) =>
                              series.publishNo,
                          name: "Publisher",
                          dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SalesData {
  SalesData(this.month, this.publishNo);

  final String month;
  final double publishNo;

  factory SalesData.fromJson(Map<String, dynamic> parsedJson) {
    return SalesData(
      parsedJson['month'].toString(),
      parsedJson['publishNo'] as double,
    );
  }
}
