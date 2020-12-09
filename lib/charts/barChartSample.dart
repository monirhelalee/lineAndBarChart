import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pub_chart/datePicker/datePickerTest.dart';
import 'package:pub_chart/test/publishInfo.dart';
import 'package:pub_chart/charts/strings.dart';
import 'package:pub_chart/test/apiManager.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PubMonthData {
  PubMonthData(this.month, this.publishNo);

  final String month;
  final double publishNo;

  factory PubMonthData.fromJson(Map<String, dynamic> parsedJson) {
    return PubMonthData(
      parsedJson['month'].toString(),
      parsedJson['publishNo'] as double,
    );
  }
}

class BarChartSample2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  List<PubMonthData> barData = [];

  Future<PubMonthData> getData() async {
    var client = http.Client();

    var response = await client.get(Strings.pub_month_url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      setState(() {
        //int y = 0;
        for (Map i in jsonMap) {
          barData.add(PubMonthData.fromJson(i));
          //print(chartData[y].date);
          //y = y+1;
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
    return ListView(
      children: [
        DatePick(),
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
              Text(
                "total",
                //'Total: ${sum(dailyData).floor()}',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  //letterSpacing: 2,
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
                    //legend: Legend(isVisible: true),
                    tooltipBehavior: TooltipBehavior(
                      enable: true,
                    ),
                    primaryXAxis: CategoryAxis(
                      labelRotation: 320,
                      //labelRotation: 90,
                      interval: 2,
                      minorTicksPerInterval: 3,
                      //maximum:
                      //minimum:
                    ),
                    //borderWidth: 4,
                    //isTransposed: true,
                    series: <ChartSeries>[
                      // Initialize line series
                      ColumnSeries<PubMonthData, String>(
                        // animationDuration: 2000,
                        // onRendererCreated: (ChartSeriesController controller) {
                        //   _chartSeriesController = controller;
                        // },

                        dataSource: barData,
                        xValueMapper: (PubMonthData pd, _) => pd.month,
                        yValueMapper: (PubMonthData pd, _) => pd.publishNo,
                        dataLabelSettings: DataLabelSettings(
                          isVisible: true,
                          textStyle: TextStyle(fontWeight: FontWeight.w400),

                          //useSeriesColor: true,
                        ),
                        //animationDuration: 1000,
                        markerSettings: MarkerSettings(
                          isVisible: true,
                          //shape: DataMarkerType.diamond,
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
