// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';
import 'dart:io';

UserModel userDataModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str));

String userDataModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.email,
    this.username,
    this.header,
    this.role,
    this.verified,
    this.active,
    this.about,
    this.gender,
    this.interest,
    this.location,
    this.name,
    this.occupation,
    this.surname,
    this.photo
  });

  String? id;
  String? email;
  String? username;
  String? header;
  String? role;
  bool? verified;
  bool? active;
  String? about;
  String? gender;
  String? interest;
  String? location;
  String? name;
  String? occupation;
  String? surname;
  String? photo;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        email: json["email"],
        username: json["username"],
        header: json["header"],
        role: json["role"],
        verified: json["verified"],
        active: json["active"],
        about: json["about"],
        gender: json["gender"],
        interest: json["interest"],
        location: json["location"],
        name: json["name"],
        occupation: json["occupation"],
        surname: json["surname"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "username": username,
        "header": header,
        "role": role,
        "verified": verified,
        "active": active,
        "about": about,
        "gender": gender,
        "interest": interest,
        "location": location,
        "name": name,
        "occupation": occupation,
        "surname": surname,
        "photo": photo,
      };
}
