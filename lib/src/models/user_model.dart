import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());
//modelo para usarlo mas sencillamente en las vistas
class UserModel {
    UserModel({
        this.id,
        this.name,
        this.lastName,
        this.birthDate,
        this.address,
    });
    int id;
    String name;
    String lastName;
    String birthDate;
    dynamic address;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["user"]["id"],
        name: json["user"]["name"],
        lastName: json["user"]["last_name"],
        birthDate: json["user"]["birth_date"],
        address: json["user"]["address"]
    );

    Map<String, dynamic> toJson() => {
        "id":id,
        "name": name,
        "last_name": lastName,
        "birth_date": birthDate,
        "address": address,
    };
}