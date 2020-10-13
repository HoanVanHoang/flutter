
import 'package:json_annotation/json_annotation.dart';
part 'models.g.dart';

@JsonSerializable()
class Metadata {
  int results;
  int page;
  String version;
  String seed;


  Metadata(this.results, this.page, this.version, this.seed);

  factory Metadata.fromJson(dynamic json) => _$MetadataFromJson(json);

  toJson() => _$MetadataToJson(this);
}

class SingleResponse<T> {
  T item;
  SingleResponse(Map<String, dynamic> json, String itemsRoot,
      T Function(dynamic itemJson) itemConverter) {
    if (itemsRoot == null) {
      item = itemConverter(json);
    } else {
      var itemFomart = json[itemsRoot];

      item = itemConverter(itemFomart);
    }
  }
}

class ListResponse<T> {
  List<T> items = [];
  Metadata metadata;

  ListResponse(Map<String, dynamic> json, String itemsRoot, T Function(dynamic itemJson) itemConverter) {
    print("test map");
    if (json['metadata'] != null) {
      metadata = Metadata.fromJson(json['metadata']);
    }
    var itemsJson = json[itemsRoot];
    if (itemsJson is List) {
      items = itemsJson.map(itemConverter).toList();
    }
  }

  @override
  String toString() {
    return items.map((f) => f.toString()).toString();
  }
}

class ApiResponse<T> {
  T data;
  int statusCode;
  ApiResponse(this.data, this.statusCode);

  @override
  String toString() {
    if (data != null) {
      return data.toString();
    }
  }
}
