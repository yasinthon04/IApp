// PeopleModel.dart
class PeopleModel {
  final String? id;
  final String name;
  final String api;
  final String phone;
  final String address;
  final String email;
  final String imageUrl;

  PeopleModel({
    this.id,
    required this.name,
    required this.api,
    required this.phone,
    required this.address,
    required this.email,
    required this.imageUrl,
  });

  // Factory constructor for creating a new PeopleModel instance from a map.
  factory PeopleModel.fromJson(Map<String, dynamic> map) {
    return PeopleModel(
      id: map['id'] as String,
      name: map['name'] as String,
      api: map['api'] as String,
      phone: map['phone'] as String,
      address: map['address'] as String,
      email: map['email'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'api': api,
      'phone': phone,
      'address': address,
      'email': email,
      'imageUrl': imageUrl,
    };
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
