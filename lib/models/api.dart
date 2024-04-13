// ApiModel.dart
class ApiModel {
  final int userId;
  final int id;
  final String title;
  final String body;

  ApiModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // Factory constructor for creating a new ApiModel instance from a map.
  factory ApiModel.fromJson(Map<String, dynamic> map) {
    return ApiModel(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}

class ApiList {
  final List<ApiModel> data;
  ApiList(this.data);

  factory ApiList.fromJson(List<dynamic> json) {
    List<ApiModel> apiList=
        json.map((data) => ApiModel.fromJson(data)).toList();

    return ApiList(apiList);
  }
}
