// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

import 'dart:convert';

UserDataModel userDataModelFromJson(String str) => UserDataModel.fromJson(json.decode(str));

String userDataModelToJson(UserDataModel data) => json.encode(data.toJson());

class UserDataModel {
    UserDataModel({
       this.id,
      required  this.email,
      required  this.username,
        this.header,
        this.role,
        this.verified,
        this.active,
        this.createdAt,
        this.updatedAt,
        this.about,
        this.dob,
        this.gender,
        this.interest,
        this.location,
        this.name,
        this.occupation,
        this.surname,
    });

    String? id;
    String email;
    String username;
    String? header;
    String? role;
    bool? verified;
    bool? active;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? about;
    DateTime? dob;
    String? gender;
    String? interest;
    String? location;
    String? name;
    String? occupation;
    String? surname;

    factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
        id: json["_id"],
        email: json["email"],
        username: json["username"],
        header: json["header"],
        role: json["role"],
        verified: json["verified"],
        active: json["active"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        about: json["about"],
        dob: DateTime.parse(json["dob"]),
        gender: json["gender"],
        interest: json["interest"],
        location: json["location"],
        name: json["name"],
        occupation: json["occupation"],
        surname: json["surname"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "username": username,
        "header": header,
        "role": role,
        "verified": verified,
        "active": active,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "about": about,
        "dob": dob!.toIso8601String(),
        "gender": gender,
        "interest": interest,
        "location": location,
        "name": name,
        "occupation": occupation,
        "surname": surname,
    };
}
