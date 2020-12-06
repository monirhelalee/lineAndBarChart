import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LineChartSampleState();
}

class LineChartSampleState extends State<LineChartSample> {
  final List<double> dailyData = [
    0,
    5.0,
    6.0,
    5.0,
    7.0,
    0,
    4.0,
    6.0,
    10.0,
    1.0,
    3.0,
    2.0,
    10.0,
    9,
    8,
    4,
    0,
    3,
    1,
    5,
    9,
    0,
    4,
    5,
    5,
    6,
    0,
    10,
    10,
    2,
    7,
    0
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
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
            'Total: ${sum(dailyData).floor()}',
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
              child: LineChart(sampleData()),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  LineChartData sampleData() {
    return LineChartData(
      lineTouchData: LineTouchData(
        touchTooltipData: LineTouchTooltipData(
          tooltipBgColor: Colors.white,
        ),
        touchCallback: (LineTouchResponse touchResponse) {},
        handleBuiltInTouches: true,
      ),
      gridData: FlGridData(
        show: false,
      ),
      titlesData: FlTitlesData(
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          rotateAngle: -90,
          margin: 10,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          margin: 8,
          reservedSize: 30,
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Colors.red,
            width: 4,
          ),
          left: BorderSide(
            color: Colors.transparent,
          ),
          right: BorderSide(
            color: Colors.transparent,
          ),
          top: BorderSide(
            color: Colors.transparent,
          ),
        ),
      ),
      minX: 1,
      maxX: 31,
      maxY: 10,
      minY: 0,
      lineBarsData: linesBarData(),
    );
  }

  List<LineChartBarData> linesBarData() {
    final LineChartBarData lineChartBarData = LineChartBarData(
      spots: [
        FlSpot(1, dailyData[1]),
        FlSpot(2, dailyData[2]),
        FlSpot(3, dailyData[3]),
        FlSpot(4, dailyData[4]),
        FlSpot(5, dailyData[5]),
        FlSpot(6, dailyData[6]),
        FlSpot(7, dailyData[7]),
        FlSpot(8, dailyData[8]),
        FlSpot(9, dailyData[9]),
        FlSpot(10, dailyData[10]),
        FlSpot(11, dailyData[11]),
        FlSpot(12, dailyData[12]),
        FlSpot(13, dailyData[13]),
        FlSpot(14, dailyData[14]),
        FlSpot(15, dailyData[15]),
        FlSpot(16, dailyData[16]),
        FlSpot(17, dailyData[17]),
        FlSpot(18, dailyData[18]),
        FlSpot(19, dailyData[19]),
        FlSpot(20, dailyData[20]),
        FlSpot(21, dailyData[21]),
        FlSpot(22, dailyData[22]),
        FlSpot(23, dailyData[23]),
        FlSpot(24, dailyData[24]),
        FlSpot(25, dailyData[25]),
        FlSpot(26, dailyData[26]),
        FlSpot(27, dailyData[27]),
        FlSpot(28, dailyData[28]),
        FlSpot(29, dailyData[29]),
        FlSpot(30, dailyData[30]),
        FlSpot(31, dailyData[31]),
      ],
      isCurved: false,
      colors: [
        const Color(0xffaa4cfc),
      ],
      barWidth: 3,
      dotData: FlDotData(
        show: true,
      ),
      belowBarData: BarAreaData(
        show: true,
        colors: [
          Color(0xffaa4cfc).withOpacity(0.3),
        ],
      ),
    );

    return [
      lineChartBarData,
    ];
  }
}

double sum(List<double> lst) {
  double s = 0;
  for (var i = 0; i < lst.length; i++) {
    s += lst[i];
  }
  return s;
}
