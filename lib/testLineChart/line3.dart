import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pub_chart/charts/strings.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class ChartApp2 extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  ChartApp2({Key key}) : super(key: key);
  @override
  _ChartApp2State createState() => _ChartApp2State();
}
class _ChartApp2State extends State<ChartApp2> {
  List<SalesData> chartData = [];
  // Future<String> _loadSalesDataAsset() async {
  //   return await rootBundle.loadString('assets/data.json');
  // }
  //
  // Future loadSalesData() async {
  //   String jsonString = await _loadSalesDataAsset();
  //  // print(jsonString);
  //   final jsonResponse = json.decode(jsonString);
  //   print(jsonResponse);
  //   setState(() {
  //     for(Map i in jsonResponse) {
  //       chartData.add(SalesData.fromJson(i));
  //       print(chartData);
  //     }
  //   });
  // }
  Future<SalesData> getNews() async {
    var client = http.Client();
    var response = await client.get(Strings.pub_url);
    if (response.statusCode == 200) {
      var jsonString = response.body;
      var jsonMap = json.decode(jsonString);
      setState(() {
        for(Map i in jsonMap) {
          chartData.add(SalesData.fromJson(i));
          print(chartData);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            //  color: Colors.yellow.shade300,
              borderRadius: BorderRadius.circular(14.0)),
          height: 400,
          child: SfCartesianChart(
            title: ChartTitle(text: "Monthly Chart"),
            tooltipBehavior: TooltipBehavior(
                enable: true,
                activationMode: ActivationMode.longPress),
            primaryXAxis: CategoryAxis(
                labelRotation: 300,
                title: AxisTitle(
                    text: 'Publisher Name',
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300))
            ),
            primaryYAxis: NumericAxis(
                title: AxisTitle(
                    text: 'Number of Publish',
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w300))
            ),
            legend: Legend(isVisible: true),
            series: <ChartSeries>[
              ColumnSeries<SalesData, String>(
                dataSource: chartData,
                xValueMapper: (SalesData series, _) => series.publisher,
                yValueMapper: (SalesData series, _) => series.total,
                name: "Publisher",
                legendIconType: LegendIconType.diamond,
                dataLabelSettings: DataLabelSettings(
                  isVisible: true,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
class SalesData {
  SalesData(this.publisher, this.total);
  final String publisher;
  final double total;
  factory SalesData.fromJson(Map<String, dynamic> parsedJson) {
    return SalesData(
      parsedJson['publisher'].toString(),
      parsedJson['total'] as double,
    );
  }
}