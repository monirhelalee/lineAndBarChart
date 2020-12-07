import 'package:flutter/material.dart';
import 'package:pub_chart/test/publishInfo.dart';

import 'apiManager.dart';

class TestList extends StatefulWidget {
  @override
  _TestListState createState() => _TestListState();
}

class _TestListState extends State<TestList> {
  Future<PublisherModel> _publisherModel;

  @override
  void initState() {
    _publisherModel = API_Manager().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<PublisherModel>(
          future: _publisherModel,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.publisher.length,
                  itemBuilder: (context, index) {
                    var user = snapshot.data.publisher[index];
                    return Container(
                      height: 70,
                      color: Colors.teal,
                      margin: const EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          SizedBox(width: 30.0),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  user.date,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 22.0),
                                ),
                                Text(
                                  user.publishNo,
                                  style: TextStyle(fontSize: 18.0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  });
            } else
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
