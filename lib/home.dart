import 'package:flutter/material.dart';
import 'package:pub_chart/charts/barChart.dart';
import 'package:pub_chart/datePicker/datePickerTest.dart';
import 'package:pub_chart/testLineChart/lineChart.dart';
import 'package:pub_chart/charts/lineChart2.dart';
import 'package:pub_chart/test/testList.dart';

import 'testLineChart/line3.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text("Publisher Chart"),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: "Daily Chart",
                ),
                Tab(
                  text: "Monthly Chart",
                ),
                Tab(
                  text: "Date Picker",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              LineChartSample2(),
              BarChartSample(),
              DatePick(),
            ],
          ),
        ),
      ),
    );
  }
}
