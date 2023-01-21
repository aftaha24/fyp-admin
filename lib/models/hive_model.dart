class HiveModel {
  String? hiveNumber;
  String? location;
  String? createdAt;
  String? driveLink;
  String? userID;
  String? amountHoney;

  HiveModel({
    this.hiveNumber,
    this.location,
    this.createdAt,
    this.driveLink,
    this.userID,
    this.amountHoney,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hiveNumber': hiveNumber,
      'location': location,
      'createdAt': createdAt,
      'driveLink': driveLink,
      'userID': userID,
      'amountHoney': amountHoney,
    };
  }

  factory HiveModel.fromMap(Map<String, dynamic> map) {
    return HiveModel(
      hiveNumber:
          map['hiveNumber'] != null ? map['hiveNumber'] as String : null,
      location: map['location'] != null ? map['location'] as String : null,
      createdAt: map['createdAt'] != null ? map['createdAt'] as String : null,
      driveLink: map['driveLink'] != null ? map['driveLink'] as String : null,
      userID: map['userID'] != null ? map['userID'] as String : null,
      amountHoney:
          map['amountHoney'] != null ? map['amountHoney'] as String : null,
    );
  }
}
