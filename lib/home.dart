import 'package:flutter/material.dart';
import 'package:pub_chart/charts/barChart.dart';
import 'package:pub_chart/charts/lineChart.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Publisher Chart'),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            LineChartSample(),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            BarChartSample(),
          ],
        )),
      ),
    );
  }
}
