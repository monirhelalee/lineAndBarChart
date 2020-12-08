import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pub_chart/test/publishInfo.dart';
import 'package:pub_chart/charts/strings.dart';

// ignore: camel_case_types
class API_Manager {
  Future<PublisherModel> getData() async {
    var client = http.Client();
    var publisherModel;

    try {
      var response = await client.get(Strings.pub_url);
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = json.decode(jsonString);

        publisherModel = PublisherModel.fromJson(jsonMap);
      }
    } catch (Exception) {
      return publisherModel;
    }

    return publisherModel;
  }
}