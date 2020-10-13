// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'User.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteList _$FavoriteListFromJson(Map<String, dynamic> json) {
  return FavoriteList()
    ..list = (json['list'] as List)
        ?.map((e) => e == null ? null : User.fromJson(e))
        ?.toList();
}

Map<String, dynamic> _$FavoriteListToJson(FavoriteList instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['gender'] as String,
    json['name'] == null ? null : Name.fromJson(json['name']),
    json['location'] == null ? null : Location.fromJson(json['location']),
    json['email'] as String,
    json['login'] == null ? null : Login.fromJson(json['login']),
    json['dob'] as String,
    json['registered'] as String,
    json['phone'] as String,
    json['cell'] as String,
    json['id'] == null ? null : Id.fromJson(json['id']),
    json['na'] as String,
    json['picture'] == null ? null : Picture.fromJson(json['picture']),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'gender': instance.gender,
      'name': instance.name,
      'location': instance.location,
      'email': instance.email,
      'login': instance.login,
      'dob': instance.dob,
      'registered': instance.registered,
      'phone': instance.phone,
      'cell': instance.cell,
      'id': instance.id,
      'na': instance.na,
      'picture': instance.picture,
    };

Picture _$PictureFromJson(Map<String, dynamic> json) {
  return Picture(
    json['large'] as String,
    json['medium'] as String,
    json['thumbnail'] as String,
  );
}

Map<String, dynamic> _$PictureToJson(Picture instance) => <String, dynamic>{
      'large': instance.large,
      'medium': instance.medium,
      'thumbnail': instance.thumbnail,
    };

Id _$IdFromJson(Map<String, dynamic> json) {
  return Id(
    json['name'] as String,
    json['value'] as String,
  );
}

Map<String, dynamic> _$IdToJson(Id instance) => <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };

Login _$LoginFromJson(Map<String, dynamic> json) {
  return Login(
    json['username'] as String,
    json['password'] as String,
    json['salt'] as String,
    json['md5'] as String,
    json['sha1'] as String,
    json['sha256'] as String,
  );
}

Map<String, dynamic> _$LoginToJson(Login instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'salt': instance.salt,
      'md5': instance.md5,
      'sha1': instance.sha1,
      'sha256': instance.sha256,
    };

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    json['street'] as String,
    json['city'] as String,
    json['state'] as String,
    json['post_code'] as num,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'street': instance.street,
      'city': instance.city,
      'state': instance.state,
      'post_code': instance.postCode,
    };

Name _$NameFromJson(Map<String, dynamic> json) {
  return Name(
    json['title'] as String,
    json['first'] as String,
    json['last'] as String,
  );
}

Map<String, dynamic> _$NameToJson(Name instance) => <String, dynamic>{
      'title': instance.title,
      'first': instance.first,
      'last': instance.last,
    };
