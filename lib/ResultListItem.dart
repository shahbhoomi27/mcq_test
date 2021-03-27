import 'package:flutter/material.dart';
import 'package:mcq_demo/Model/Questions.dart';
import 'package:mcq_demo/ViewModel/DataStore.dart';
import 'package:provider/provider.dart';

class ResultListItem extends StatelessWidget {
  List<Questions> dataList;
  int index;

  MaterialColor mColr;
  ResultListItem(this.index);
  @override
  Widget build(BuildContext context) {
    dataList = Provider.of<DataStore>(context, listen: false).mDataList;

    setColorToAns();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Question ${dataList[index].questionId} > ",
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            width: 120,
            child: Text(
              dataList[index].ansResult,
              style: TextStyle(fontSize: 18, color: mColr),
            ),
          ),
        ],
      ),
    );
  }

  void setColorToAns() {
    if (dataList[index].ansResult == "Right") {
      mColr = Colors.lightGreen;
    } else if (dataList[index].ansResult == "Wrong") {
      mColr = Colors.red;
    } else {
      mColr = Colors.lightBlue;
    }
  }
}
