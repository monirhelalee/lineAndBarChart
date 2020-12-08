import 'dart:convert';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pub_chart/test/publishInfo.dart';
import 'package:pub_chart/charts/strings.dart';
import 'package:pub_chart/test/apiManager.dart';
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
  List<PubData> chartData = [];

  Future<PubData> getData() async {
    var client = http.Client();

    var response = await client.get(Strings.pub_url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);

      setState(() {
        //int y = 0;
        for (Map i in jsonMap) {
          chartData.add(PubData.fromJson(i));
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
                      LineSeries<PubData, String>(
                        // animationDuration: 2000,
                        // onRendererCreated: (ChartSeriesController controller) {
                        //   _chartSeriesController = controller;
                        // },

                        dataSource: chartData,
                        xValueMapper: (PubData pd, _) => pd.date,
                        yValueMapper: (PubData pd, _) => pd.publishNo,
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
