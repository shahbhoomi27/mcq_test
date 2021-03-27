import 'dart:convert';

import 'package:http/http.dart' as http;

class Questions {
  int questionId;
  String question;
  String ansA;
  String ansB;
  String ansC;
  String ansD;
  String answer;
  String ansResult;

  Questions(
      {this.questionId,
      this.question,
      this.ansA,
      this.ansB,
      this.ansC,
      this.ansD,
      this.answer,
      this.ansResult});

  Future<List<Questions>> getDataList() async {
    final response =
        await http.get("https://demoapp.in/practical/practical.php");
    if (response.statusCode == 200) {
      Map<String, dynamic> map = json.decode(response.body);

      var data = map["DATA"]["questions"] as List;
      List<Questions> dataList =
          data.map((model) => Questions.fromJson(model)).toList();

      return dataList;
    } else {
      throw Exception('Failed to load data!');
    }
  }

  Questions.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    question = json['question'];
    ansA = json['ans_a'];
    ansB = json['ans_b'];
    ansC = json['ans_c'];
    ansD = json['ans_d'];
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question_id'] = this.questionId;
    data['question'] = this.question;
    data['ans_a'] = this.ansA;
    data['ans_b'] = this.ansB;
    data['ans_c'] = this.ansC;
    data['ans_d'] = this.ansD;
    data['answer'] = this.answer;
    return data;
  }
}
