import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pub_chart/monthPicker/monthPic.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class Bar2 extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Bar2({Key key}) : super(key: key);

  @override
  _Bar2State createState() => _Bar2State();
}

class _Bar2State extends State<Bar2> {
  List<SalesData> chartData = [];

  Future<SalesData> getBarData() async {
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
        MonthPic(),
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
                      //title: ChartTitle(text: "Monthly Chart"),
                      tooltipBehavior: TooltipBehavior(
                        enable: true,
                        //activationMode: ActivationMode.longPress,
                      ),
                      primaryXAxis: CategoryAxis(
                        labelRotation: 300,
                        // title: AxisTitle(
                        //   text: 'Month',
                        //   textStyle: TextStyle(
                        //       color: Colors.black,
                        //       fontSize: 14,
                        //       fontStyle: FontStyle.italic,
                        //       fontWeight: FontWeight.w300),
                        // ),
                      ),
                      primaryYAxis: NumericAxis(
                        // title: AxisTitle(
                        //   text: 'Number of Publish',
                        //   textStyle: TextStyle(
                        //       color: Colors.black,
                        //       fontSize: 14,
                        //       fontStyle: FontStyle.italic,
                        //       fontWeight: FontWeight.w300),
                        // ),
                      ),
                      //legend: Legend(isVisible: true),
                      series: <ChartSeries>[
                        ColumnSeries<SalesData, String>(
                          dataSource: chartData,
                          xValueMapper: (SalesData series, _) => series.month,
                          yValueMapper: (SalesData series, _) =>
                              series.publishNo,
                          name: "Publisher",
                          //legendIconType: LegendIconType.diamond,
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
