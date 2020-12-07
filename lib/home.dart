import 'package:flutter/material.dart';
import 'package:pub_chart/charts/barChart.dart';
import 'package:pub_chart/charts/lineChart.dart';
import 'package:pub_chart/test/testList.dart';

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
                  text: "Test",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              LineChartSample(),
              BarChartSample(),
              TestList(),
            ],
          ),
        ),
      ),
    );
  }
}
