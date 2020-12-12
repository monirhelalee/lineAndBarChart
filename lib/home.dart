import 'package:flutter/material.dart';
import 'package:pub_chart/charts/lineChart2.dart';
import 'package:pub_chart/charts/barChartSample.dart';
import 'charts/barChartSample.dart';


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
        length: 2,
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
              ],
            ),
          ),
          body: TabBarView(
            children: [
              LineChartSample2(),
              Bar2(),
            ],
          ),
        ),
      ),
    );
  }
}
