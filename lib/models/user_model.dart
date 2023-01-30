class UserModel {
  String? name;
  String? uid;
  String? email;
  String? password;
  String? hiveCount;
  String? createdAt;
  String? totalAmountOfHoney;
  String? profileImage;

  UserModel({
    this.name,
    this.uid,
    this.email,
    this.password,
    this.hiveCount,
    this.createdAt,
    this.totalAmountOfHoney,
    this.profileImage,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'uid': uid,
      'email': email,
      'password': password,
      'hiveCount': hiveCount,
      'createdAt': createdAt,
      'totalAmountOfHoney': totalAmountOfHoney,
      'profileImage': profileImage,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] != null ? map['name'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      password: map['password'] != null ? map['password'] as String : null,
      hiveCount: map['hiveCount'] != null ? map['hiveCount'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      profileImage:
          map['profileImage'] != null ? map['profileImage'] as String : null,
      totalAmountOfHoney: map['totalAmountOfHoney'] != null
          ? map['totalAmountOfHoney'] as String
          : null,
    );
  }
}
