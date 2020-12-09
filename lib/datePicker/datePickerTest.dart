import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePick extends StatefulWidget {
  @override
  _DatePickState createState() => _DatePickState();
}

class _DatePickState extends State<DatePick> {
  DateTime _date = DateTime.now();
  DateTime _date1 = DateTime.now();

  //DateTime _lastDate;

  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2018),
      lastDate: _date1,
    );

    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
      });
    }
  }

  Future<Null> selectDate1(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date1,
      firstDate: _date,
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _date1) {
      setState(() {
        _date1 = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String _formatDate = DateFormat("dd/MM/yyyy").format(_date);
    String _formatDate1 = DateFormat("dd/MM/yyyy").format(_date1);

    return SingleChildScrollView(
      child: Container(
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Column(
                        children: [
                          Text("From"),
                          FlatButton(
                            child: Text("$_formatDate"),
                            onPressed: () {
                              selectDate(context);
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(18)),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Column(
                        children: [
                          Text("To"),
                          FlatButton(
                            child: Text("$_formatDate1"),
                            onPressed: () {
                              selectDate1(context);
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
                        border: Border.all(color:Colors.black),
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
      ),
    );
  }
}
