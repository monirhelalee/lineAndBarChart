import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void handleReadOnlyInputClick(context) {
  showBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        child: YearPicker(
          selectedDate: DateTime(1997),
          firstDate: DateTime(1995),
          lastDate: DateTime.now(),
          onChanged: (val) {
            print(val);
            Navigator.pop(context);
          },
        ),
      ));
}

void handleReadOnlyInputClick2(context) {
  showBottomSheet(
      context: context,
      builder: (BuildContext context) => Container(
        width: MediaQuery.of(context).size.width,
        child: MonthPicker(
          selectedDate: DateTime(1997),
          firstDate: DateTime(1995),
          lastDate: DateTime.now(),
          onChanged: (val) {
            print(val);
            Navigator.pop(context);
          },
        ),
      ));
}

class PM extends StatefulWidget {
  @override
  _PMState createState() => _PMState();
}

class _PMState extends State<PM> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        //validator: value.isEmpty ? 'this field is required' : null,
        readOnly: true,
        style: TextStyle(fontSize: 13.0),
        decoration: InputDecoration(
            hintStyle: TextStyle(fontSize: 13.0),
            hintText: 'Pick Year',
            contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.calendar_today)),
        onTap: () => handleReadOnlyInputClick(context),
      ),
    );
  }
}
