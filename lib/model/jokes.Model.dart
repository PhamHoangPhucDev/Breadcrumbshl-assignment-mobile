class JokesModel {
  int? id;
  String? description;
  
  JokesModel({this.id,this.description});

  factory JokesModel.fromJson(Map<String, dynamic>? json) {
    late JokesModel result = JokesModel();
    if (json != null) {
      result = JokesModel(
        id: (json["id"]) ?? 0,
        description: (json["description"]) ?? "",
      );
    }
    return result;
  }

  static List<JokesModel> fromJsonList(List? list) {
    if (list == null) return [];
    return list.map((item) => JokesModel.fromJson(item)).toList();
  }

  // static List<Map<String, dynamic>> toJsonList(List<JokesModel>? list) {
  //   if (list == null) return [];
  //   return list.map((item) => item.toJson()).toList();
  // }
}