

import 'dart:convert';

List<Screen> screenFromJson(String str) => List<Screen>.from(json.decode(str).map((x) => Screen.fromJson(x)));

String screenToJson(List<Screen> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Screen {
    Screen({
        required this.id,
        required this.email,
        required this.password,
        required this.name,
        required this.role,
        required this.avatar,
        required this.creationAt,
        required this.updatedAt,
    });

    int id;
    String email;
    String password;
    String name;
    Role role;
    String avatar;
    DateTime creationAt;
    DateTime updatedAt;

    factory Screen.fromJson(Map<String, dynamic> json) => Screen(
        id: json["id"],
        email: json["email"],
        password: json["password"],
        name: json["name"],
        role: roleValues.map[json["role"]]!,
        avatar: json["avatar"],
        creationAt: DateTime.parse(json["creationAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "password": password,
        "name": name,
        "role": roleValues.reverse[role],
        "avatar": avatar,
        "creationAt": creationAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

enum Role { CUSTOMER, ADMIN }

final roleValues = EnumValues({
    "admin": Role.ADMIN,
    "customer": Role.CUSTOMER
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
