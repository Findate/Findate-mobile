// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';


AllUsersModel userDataModelFromJson(String str) => AllUsersModel.fromJson(json.decode(str));

String userDataModelToJson(AllUsersModel data) => json.encode(data.toJson());

class AllUsersModel {
    AllUsersModel({
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

    factory AllUsersModel.fromJson(Map<String, dynamic> json) => AllUsersModel(
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
    };
}

