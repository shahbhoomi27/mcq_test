import 'package:flutter/foundation.dart';
import 'package:mcq_demo/Model/Questions.dart';

class DataStore extends ChangeNotifier {
  List<Questions> mDataList = List<Questions>();
  List<String> ansList = List<String>();
  int rightAnsCount = 0;
  int wrongAnsCount = 0;
  int noAnsCount = 0;

  int get listItemCount {
    return mDataList.length;
  }

  void setData(List<Questions> dataList) {
    mDataList = dataList;
    notifyListeners();
    print("que ::  ${mDataList[0].question}");
  }

  void setAnsList(String ans) {
    ansList.add(ans);
    notifyListeners();
  }

  void checkAnswer(int index) {
    if (ansList[index] == "") {
      mDataList[index].ansResult = "No Answer ";
      noAnsCount++;
      notifyListeners();
      return;
    }
    if (mDataList[index].answer == ansList[index]) {
      mDataList[index].ansResult = "Right";
      rightAnsCount++;
      notifyListeners();
    } else {
      mDataList[index].ansResult = "Wrong";
      wrongAnsCount++;
      notifyListeners();
    }
  }
}
