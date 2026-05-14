class UserModel {
  String? uid;
  String name;
  String phone;
  int age;
  String gender;
  String email;

  UserModel({
    this.uid,
    required this.name,
    required this.phone,
    required this.age,
    required this.gender,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'phone': phone,
      'age': age,
      'gender': gender,
      'email': email,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      phone: map['phone'],
      age: map['age'],
      gender: map['gender'],
      email: map['email'],
    );
  }
}