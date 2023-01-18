// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class AnnouncementResponse {
  int length;
  int page;
  List<Announcement> data;
  AnnouncementResponse({
    required this.length,
    required this.page,
    required this.data,
  });

  AnnouncementResponse copyWith({
    int? length,
    int? page,
    List<Announcement>? data,
  }) {
    return AnnouncementResponse(
      length: length ?? this.length,
      page: page ?? this.page,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'length': length,
      'page': page,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory AnnouncementResponse.fromMap(Map<String, dynamic> map) {
    return AnnouncementResponse(
      length: map['length'] as int,
      page: map['page'] as int,
      data: List<Announcement>.from(
        (map['data'] as List<dynamic>).map<Announcement>(
          (x) => Announcement.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnnouncementResponse.fromJson(String source) =>
      AnnouncementResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AnnouncementResponse(length: $length, page: $page, data: $data)';

  @override
  bool operator ==(covariant AnnouncementResponse other) {
    if (identical(this, other)) return true;

    return other.length == length &&
        other.page == page &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => length.hashCode ^ page.hashCode ^ data.hashCode;
}

class Announcement {
  String name;
  String description;
  String specialization;
  Announcement({
    required this.name,
    required this.description,
    required this.specialization,
  });

  Announcement copyWith({
    String? name,
    String? description,
    String? specialization,
  }) {
    return Announcement(
      name: name ?? this.name,
      description: description ?? this.description,
      specialization: specialization ?? this.specialization,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'description': description,
      'specialization': specialization,
    };
  }

  factory Announcement.fromMap(Map<String, dynamic> map) {
    return Announcement(
      name: map['name'] as String,
      description: map['description'] as String,
      specialization: map['specialization'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Announcement.fromJson(String source) =>
      Announcement.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Announcement(name: $name, description: $description, specialization: $specialization)';

  @override
  bool operator ==(covariant Announcement other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.description == description &&
        other.specialization == specialization;
  }

  @override
  int get hashCode =>
      name.hashCode ^ description.hashCode ^ specialization.hashCode;
}
