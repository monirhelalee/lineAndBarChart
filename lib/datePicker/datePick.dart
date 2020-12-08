import 'package:flutter/material.dart';

class DatePick {
   getDate(){
    Future<Null> selectDate(BuildContext context) async{
      final DateTime picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2018),
        lastDate: DateTime(2099),
      );

      if(picked != null){
        return picked;
      }
    }
  }
}