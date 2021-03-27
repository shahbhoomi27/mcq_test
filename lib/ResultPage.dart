import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mcq_demo/ResultListItem.dart';
import 'package:mcq_demo/ViewModel/DataStore.dart';
import 'package:provider/provider.dart';

class ResultPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text(
                  "Result",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Scrollbar(
                isAlwaysShown: true,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return ResultListItem(index);
                  },
                  itemCount: Provider.of<DataStore>(context, listen: false)
                      .listItemCount,
                ),
              ),
            ),
            buildSummary(context),
          ],
        ),
      ),
    ));
  }

  Widget buildSummary(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Total Right Questions : ${Provider.of<DataStore>(context, listen: false).rightAnsCount}",
            style: TextStyle(
                fontSize: 18,
                color: Colors.lightGreen,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Total Wrong Questions : ${Provider.of<DataStore>(context, listen: false).wrongAnsCount}",
            style: TextStyle(
                fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "Total No Answer Questions : ${Provider.of<DataStore>(context, listen: false).noAnsCount}",
            style: TextStyle(
                fontSize: 18,
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
