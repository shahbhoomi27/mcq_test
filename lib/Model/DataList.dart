import 'Questions.dart';

class DataList {
  int sTATUSCODE;
  String mESSAGE;
  DATA dATA;

  DataList({this.sTATUSCODE, this.mESSAGE, this.dATA});

  DataList.fromJson(Map<String, dynamic> json) {
    sTATUSCODE = json['STATUS_CODE'];
    mESSAGE = json['MESSAGE'];
    dATA = json['DATA'] != null ? new DATA.fromJson(json['DATA']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['STATUS_CODE'] = this.sTATUSCODE;
    data['MESSAGE'] = this.mESSAGE;
    if (this.dATA != null) {
      data['DATA'] = this.dATA.toJson();
    }
    return data;
  }
}

class DATA {
  List<Questions> questions;

  DATA({this.questions});

  DATA.fromJson(Map<String, dynamic> json) {
    if (json['questions'] != null) {
      questions = new List<Questions>();
      json['questions'].forEach((v) {
        questions.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
