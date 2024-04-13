// PeopleModel.dart
class PeopleModel {
  final String name;
  final String description;
  final String imageUrl;

  PeopleModel({
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  // Factory constructor for creating a new PeopleModel instance from a map.
  factory PeopleModel.fromJson(Map<String, dynamic> map) {
    return PeopleModel(
      name: map['name'] as String,
      description: map['description'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }
}

class PeopleList {
  final List<PeopleModel> data;
  PeopleList(this.data);

  factory PeopleList.fromJson(List<dynamic> json) {
    List<PeopleModel> peopleList =
        json.map((data) => PeopleModel.fromJson(data)).toList();

    return PeopleList(peopleList);
  }
}
