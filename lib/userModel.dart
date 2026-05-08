class UserModel {
  int? id;
  String name;
  String phone;
  int age;
  String gender;
  String email;

  UserModel({
    this.id,
    required this.name,
    required this.phone,
    required this.age,
    required this.gender,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'age': age,
      'gender': gender,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      phone: map['phone'],
      age: map['age'],
      gender: map['gender'],
      email: map['email'],
    );
  }
}