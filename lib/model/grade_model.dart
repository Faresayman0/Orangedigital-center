class GradeModel {
  String code = "";
  String message = "";
  List<Data> data = [];
  GradeModel();
  @override
  int get hashCode => super.hashCode;

  bool operator ==(dynamic other) => other != null;

  GradeModel.input(this.code, this.message, this.data);

  GradeModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? grade = "";

  Data({this.grade});
  bool operator ==(dynamic other) => other != null;

  @override
  int get hashCode => super.hashCode;

  Data.fromJson(Map<String, dynamic> json) {
    grade = json['grade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grade'] = this.grade;
    return data;
  }
}
