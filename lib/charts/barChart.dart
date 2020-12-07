import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartSample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => BarChartSampleState();
}

class BarChartSampleState extends State<BarChartSample> {
  final List<double> monthlyData = [
    35.0,
    6.0,
    5.0,
    17.0,
    0,
    41.0,
    26.0,
    10.0,
    15.0,
    30.0,
    20.0,
    10.0
  ];
  int touchedIndex;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 350,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18.0),
            //color: const Color(0xff81e5cd),
            gradient: LinearGradient(
              colors: const [
                Color(0xff80cbc4),
                Colors.yellow,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          margin: EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'Monthly Publish',
                style: TextStyle(
                    color: const Color(0xff0f4a3c),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                'Total: ${sum(monthlyData).floor()}',
                style: TextStyle(
                    color: const Color(0xff379982),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: BarChart(
                    mainBarData(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  BarChartGroupData _buildBar(
    int x,
    double y, {
    bool isTouched = false,
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          width: 22,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            //background bar
            y: 50,
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> _buildAllBars() {
    return List.generate(
      monthlyData.length,
      (index) => _buildBar(index, monthlyData[index],
          isTouched: index == touchedIndex),
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: _buildBarTouchData(),
      titlesData: _buildAxes(),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: _buildAllBars(),
    );
  }

  FlTitlesData _buildAxes() {
    return FlTitlesData(
      // Build X axis.
      bottomTitles: SideTitles(
        showTitles: true,
        margin: 16,
        rotateAngle: -90,
        getTitles: (double value) {
          switch (value.toInt()) {
            case 0:
              return 'Jan';
            case 1:
              return 'Feb';
            case 2:
              return 'Mar';
            case 3:
              return 'Apr';
            case 4:
              return 'May';
            case 5:
              return 'Jun';
            case 6:
              return 'Jul';
            case 7:
              return 'Aug';
            case 8:
              return 'Sep';
            case 9:
              return 'Oct';
            case 10:
              return 'Nov';
            case 11:
              return 'Dec';
            default:
              return '';
          }
        },
      ),
      // Build Y axis.
      leftTitles: SideTitles(
        showTitles: false,
        getTitles: (double value) {
          return value.toString();
        },
      ),
    );
  }

  BarTouchData _buildBarTouchData() {
    return BarTouchData(
      touchTooltipData: BarTouchTooltipData(
        tooltipBgColor: Colors.blueGrey,
        getTooltipItem: (group, groupIndex, rod, rodIndex) {
          String month;
          switch (group.x.toInt()) {
            case 0:
              month = 'January';
              break;
            case 1:
              month = 'February';
              break;
            case 2:
              month = 'March';
              break;
            case 3:
              month = 'April';
              break;
            case 4:
              month = 'May';
              break;
            case 5:
              month = 'June';
              break;
            case 6:
              month = 'July';
              break;
            case 7:
              month = 'August';
              break;
            case 8:
              month = 'September';
              break;
            case 9:
              month = 'October';
              break;
            case 10:
              month = 'November';
              break;
            case 11:
              month = 'December';
              break;
          }
          return BarTooltipItem(
            month + '\n' + (rod.y).toString(),
            TextStyle(color: Colors.yellow),
          );
        },
      ),
      touchCallback: (barTouchResponse) {
        setState(() {
          if (barTouchResponse.spot != null &&
              barTouchResponse.touchInput is! FlPanEnd &&
              barTouchResponse.touchInput is! FlLongPressEnd) {
            touchedIndex = barTouchResponse.spot.touchedBarGroupIndex;
          } else {
            touchedIndex = -1;
          }
        });
      },
    );
  }
}

double sum(List<double> lst) {
  double s = 0;
  for (var i = 0; i < lst.length; i++) {
    s += lst[i];
  }
  return s;
}
