

import 'package:json_annotation/json_annotation.dart';
part 'User.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FavoriteList {
   FavoriteList(){
     list = new List();
   }
  List<User> list  ;
  FavoriteList.name(this.list);
  factory FavoriteList.fromJson(dynamic json) => _$FavoriteListFromJson(json);
  toJson() => _$FavoriteListToJson(this);
}

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
     String gender ;
     Name name;
     Location location;
     String email;
     Login login;
     String dob;
     String registered;
     String phone;
     String cell;
     Id id;
     String na;
     Picture picture;

     User(this.gender, this.name, this.location, this.email, this.login, this.dob,
      this.registered, this.phone, this.cell, this.id, this.na, this.picture);

     factory User.fromJson(dynamic json) => _$UserFromJson(json);

     toJson() => _$UserToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class Picture {
  String large;
  String medium;
  String thumbnail;

  Picture(this.large, this.medium, this.thumbnail);

  factory Picture.fromJson(dynamic json) => _$PictureFromJson(json);

  toJson() => _$PictureToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class Id {
  String name;
  String value;

  Id(this.name, this.value);
  factory Id.fromJson(dynamic json) => _$IdFromJson(json);

  toJson() => _$IdToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class Login {
  String username;
  String password;
  String salt;
  String md5;
  String sha1;
  String sha256;

  Login(this.username, this.password, this.salt, this.md5, this.sha1,
      this.sha256);
  factory Login.fromJson(dynamic json) => _$LoginFromJson(json);

  toJson() => _$LoginToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class Location {
  String street;
  String city;
  String state;
  num postCode;

  Location(this.street, this.city, this.state, this.postCode);
  factory Location.fromJson(dynamic json) => _$LocationFromJson(json);

  toJson() => _$LocationToJson(this);
}
@JsonSerializable(fieldRename: FieldRename.snake)
class Name {
  String title ;
  String first;
  String last;
  @override
  String toString() => first + " " + title + " " + last;
  Name(this.title, this.first, this.last);
  factory Name.fromJson(dynamic json) => _$NameFromJson(json);

  toJson() => _$NameToJson(this);
}