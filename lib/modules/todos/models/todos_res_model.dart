
class TodosResModel {
  TodosResModel({
    required this.statusMessage,
    required this.statusCode,
    required this.data,
  });
  late final String statusMessage;
  late final int statusCode;
  late final List<TodosResModelData> data;

  TodosResModel.fromJson(Map<String, dynamic> json){
    statusMessage = json['status_message'];
    statusCode = json['status_code'];
    data = List.from(json['data']).map((e)=>TodosResModelData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status_message'] = statusMessage;
    _data['status_code'] = statusCode;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class TodosResModelData {
  TodosResModelData({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });
  late final int userId;
  late final int id;
  late final String title;
  late final bool completed;

  TodosResModelData.fromJson(Map<String, dynamic> json){
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    completed = json['completed'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userId'] = userId;
    _data['id'] = id;
    _data['title'] = title;
    _data['completed'] = completed;
    return _data;
  }
}