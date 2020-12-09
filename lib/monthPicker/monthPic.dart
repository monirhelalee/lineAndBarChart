import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'monthPickerTest.dart';

class MonthPic extends StatefulWidget {
  @override
  _MonthPicState createState() => _MonthPicState();
}

class _MonthPicState extends State<MonthPic> {
  String fromDate, toDate;
  Future<String> createAlertDialog(bool isFrom) {
    PageController pageController = PageController(initialPage: DateTime.now().year);
    DateTime selectedDate;
    int displayedYear;

    buildHeader() {
      return Material(
        color: Theme.of(context).primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${DateFormat.yMMM().format(selectedDate)}'),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('${DateFormat.y().format(DateTime(displayedYear))}',
                      style: TextStyle(color: Colors.white)),
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.keyboard_arrow_up, color: Colors.white),
                        onPressed: () => pageController.animateToPage(
                            displayedYear -1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOut),
                      ),
                      IconButton(
                        icon:
                        Icon(Icons.keyboard_arrow_down, color: Colors.white),
                        onPressed: () => pageController.animateToPage(
                            displayedYear + 1,
                            duration: Duration(milliseconds: 400),
                            curve: Curves.easeInOut),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
    buildPager() => Container(
      color: Colors.white,
      height: 210.0,
      width: 500.0,
      child: Theme(
          data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(
                  padding: EdgeInsets.all(0.0),
                  shape: CircleBorder(),
                  minWidth: 1.0)),
          child: PageView.builder(
            controller: pageController,
            scrollDirection: Axis.vertical,
            onPageChanged: (index) {
              setState(() {
                displayedYear = index;
                //print("year $displayedYear");
              });
            },
            itemBuilder: (context, year) {
              return GridView.count(
                padding: EdgeInsets.all(12.0),
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 5,
                children: List<int>.generate(12, (i) => i + 1)
                    .map((month) => DateTime(year, month))
                    .map(
                      (date) => Padding(
                    padding: EdgeInsets.all(4.0),
                    child: FlatButton(
                      onPressed: () => setState(() {
                        selectedDate =
                            DateTime(date.year, date.month);
                        print("data: $selectedDate");
                      }),
                      color: date.month == selectedDate.month &&
                          date.year == selectedDate.year
                          ? Colors.orange
                          : null,
                      textColor: date.month == selectedDate.month &&
                          date.year == selectedDate.year
                          ? Colors.white
                          : date.month == DateTime.now().month &&
                          date.year == DateTime.now().year
                          ? Colors.orange
                          : null,
                      child: Text(
                        DateFormat.MMM().format(date),
                      ),
                    ),
                  ),
                )
                    .toList(),
              );
            },
          )),
    );
    yearMonthPicker() => Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Builder(builder: (context) {
          if (MediaQuery.of(context).orientation == Orientation.portrait) {
            return IntrinsicWidth(
              child: Column(children: [
                buildHeader(),
                Material(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [buildPager()],
                  ),
                )
              ]),
            );
          }
          return IntrinsicHeight(
            child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildHeader(),
                  Material(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [buildPager()],
                    ),
                  )
                ]),
          );
        }),
      ],
    );


    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Pick Your Month"),
            content: Material(child: yearMonthPicker()),
            actions: <Widget>[
              MaterialButton(
                elevation: 5.0,
                child: Text("Ok"),
                onPressed: () {
                  print("pressed");
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      //color: Colors.green,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    height: 75,
                    width: 115,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Text("From"),
                        FlatButton(
                          child: Text(""),
                          onPressed: () {
                            createAlertDialog(true);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    height: 75,
                    width: 115,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Text("To"),
                        FlatButton(
                          child: Text(""),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    height: 75,
                    width: 115,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(18)),
                      border: Border.all(color: Colors.black),
                      color: Colors.yellow,
                    ),
                    child: FlatButton(
                      child: Text("Filter"),
                      onPressed: () {
                        setState(() {
                          print("button pressed");
                        });
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
