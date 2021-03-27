import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mcq_demo/Model/Questions.dart';
import 'package:mcq_demo/ResultPage.dart';
import 'package:provider/provider.dart';

import 'ViewModel/DataStore.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedOpt = "";
  int queIndex = 0;

  Future<List<Questions>> getAllData() async {
    Questions que = Questions();
    print("called api $queIndex");
    List<Questions> queList = await que.getDataList();
    Provider.of<DataStore>(context, listen: false).setData(queList);
  }

  @override
  void initState() {
    super.initState();
    getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<DataStore>(
        builder: (context, dataStore, child) {
          if (dataStore.listItemCount <= 0) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "00:60",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Question.",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      // snapshot.data[0].question
                      buildQueOptionUI(dataStore.mDataList[queIndex]),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  buildNextButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildNextButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              setState(() {
                Provider.of<DataStore>(context, listen: false)
                    .setAnsList(selectedOpt);
                selectedOpt = "";
                Provider.of<DataStore>(context, listen: false)
                    .checkAnswer(queIndex);
                if (queIndex <
                    ((Provider.of<DataStore>(context, listen: false)
                            .listItemCount) -
                        1)) {
                  queIndex++;
                } else {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => ResultPage()),
                      (Route<dynamic> route) => false);

                  /*Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ResultPage()));*/
                }
                print("queIndex :: $queIndex");
              });
            },
            child: Text(
              "Next >",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildQueOptionUI(Questions mdata) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mdata.question,
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 40,
          ),
          buildOptionUI((mdata.ansA), (value) {
            setState(() {
              selectedOpt = value;
              print("selected :: $selectedOpt");
            });
          }),
          buildOptionUI(mdata.ansB, (value) {
            setState(() {
              selectedOpt = value;
              print("selected :: $selectedOpt");
            });
          }),
          buildOptionUI(mdata.ansC, (value) {
            setState(() {
              selectedOpt = value;
              print("selected :: $selectedOpt");
            });
          }),
          buildOptionUI(mdata.ansD, (value) {
            setState(() {
              selectedOpt = value;
              print("selected :: $selectedOpt");
            });
          }),
        ],
      ),
    );
  }

  Widget buildOptionUI(String title, Function selectOpt) {
    return RadioListTile(
        groupValue: selectedOpt,
        title: Text(
          title,
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        value: title,
        onChanged: selectOpt);
  }
}
