// To parse this JSON data, do
//
//     final userDataModel = userDataModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';


UserModel userDataModelFromJson(String str) => UserModel.fromJson(json.decode(str));

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


// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

// import 'dart:convert';

// List<UserModel> userModelFromJson(String str) => List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

// String userModelToJson(List<UserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class UserModel {
//     UserModel({
//      required   this.id,
//     required    this.email,
//     required    this.firstName,
//     required    this.lastName,
//     required    this.avatar,
//     });

//     int id;
//     String email;
//     String firstName;
//     String lastName;
//     String avatar;

//     factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
//         id: json["id"],
//         email: json["email"],
//         firstName: json["first_name"],
//         lastName: json["last_name"],
//         avatar: json["avatar"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "email": email,
//         "first_name": firstName,
//         "last_name": lastName,
//         "avatar": avatar,
//     };
// }
