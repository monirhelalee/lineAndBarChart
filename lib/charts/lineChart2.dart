import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:pub_chart/datePicker/datePickerTest.dart';
import 'package:pub_chart/charts/strings.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PubData {
  PubData(this.date, this.publishNo);

  final String date;
  final double publishNo;

  factory PubData.fromJson(Map<String, dynamic> parsedJson) {
    return PubData(
      parsedJson['date'].toString(),
      parsedJson['publishNo'] as double,
    );
  }
}

class LineChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LineChartSample2State();
}

class LineChartSample2State extends State<LineChartSample2> {
  DateTime _date = DateTime.now();
  DateTime _date1 = DateTime.now();

  //DateTime _lastDate;

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2018),
      lastDate: _date1,
    );

    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  Future<Null> selectDate1(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date1,
      firstDate: _date,
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _date1) {
      setState(() {
        _date1 = picked;
      });
    }
  }

  List<PubData> chartData = [];

  Future<PubData> getData() async {
    chartData.clear();
    var client = http.Client();

    var response = await client.get(Strings.pub_url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      setState(() {
        //int y = 0;
        for (Map i in jsonMap) {
          chartData.add(PubData.fromJson(i));
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    ChartSeriesController _chartSeriesController;
    String _formatDate = DateFormat("dd/MM/yyyy").format(_date);
    String _formatDate1 = DateFormat("dd/MM/yyyy").format(_date1);
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
                            Text("From Date",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            FlatButton(
                              child: Text("$_formatDate"),
                              onPressed: () {
                                selectDate(context);
                              },
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
                            Text("To Date",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            FlatButton(
                              child: Text("$_formatDate1"),
                              onPressed: () {
                                selectDate1(context);
                              },
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
                          child: Text("Filter",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          onPressed: () {
                            setState(() {
                              print("button pressed");
                              getData();
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
          height: 400,
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
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Daily Publish',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                  child: SfCartesianChart(
                    enableAxisAnimation: true,
                    tooltipBehavior: TooltipBehavior(
                      enable: true,
                    ),
                    primaryXAxis: CategoryAxis(
                      labelRotation: 320,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, color:Colors.black),
                      interval: 2,
                      minorTicksPerInterval: 3,
                    ),
                    primaryYAxis: NumericAxis(
                      labelStyle: TextStyle(fontWeight: FontWeight.bold, color:Colors.black),
                    ),

                    series: <ChartSeries>[
                      // Initialize line series
                      LineSeries<PubData, String>(
                        dataSource: chartData,
                        xValueMapper: (PubData pd, _) => pd.date,
                        yValueMapper: (PubData pd, _) => pd.publishNo,
                        name: "Publisher",
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          textStyle: TextStyle(fontWeight: FontWeight.w400),
                        ),
                        markerSettings: MarkerSettings(
                          isVisible: true,
                        ),
                        width: 5,
                      ),
                    ],
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
