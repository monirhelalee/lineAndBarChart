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
      lastDate: DateTime(2099),
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
      firstDate: DateTime(2018),
      lastDate: DateTime(2099),
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
        //color: Colors.green,
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      color: Colors.redAccent,
                      child: Column(
                        children: [
                          Text("Start Date"),
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
                      color: Colors.greenAccent,
                      child: Column(
                        children: [
                          Text("End Date"),
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
                      color: Colors.blueAccent,
                      child: FlatButton(
                        child: Text("Confirm"),
                        onPressed: (){
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
