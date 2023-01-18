// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class QuizResponse {
  int length;
  int page;
  List<Quiz> data;
  QuizResponse({
    required this.length,
    required this.page,
    required this.data,
  });

  QuizResponse copyWith({
    int? length,
    int? page,
    List<Quiz>? data,
  }) {
    return QuizResponse(
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

  factory QuizResponse.fromMap(Map<String, dynamic> map) {
    return QuizResponse(
      length: map['length'] as int,
      page: map['page'] as int,
      data: List<Quiz>.from(
        (map['data'] as List<dynamic>).map<Quiz>(
          (x) => Quiz.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizResponse.fromJson(String source) =>
      QuizResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'QuizResponse(length: $length, page: $page, data: $data)';

  @override
  bool operator ==(covariant QuizResponse other) {
    if (identical(this, other)) return true;

    return other.length == length &&
        other.page == page &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => length.hashCode ^ page.hashCode ^ data.hashCode;
}

class Quiz {
  String? sId;
  String? title;
  String? course;
  String? topic;
  String? duoTo;
  Quiz({
    this.sId,
    this.title,
    this.course,
    this.topic,
    this.duoTo,
  });

  Quiz copyWith({
    String? sId,
    String? title,
    String? course,
    String? topic,
    String? duoTo,
  }) {
    return Quiz(
      sId: sId ?? this.sId,
      title: title ?? this.title,
      course: course ?? this.course,
      topic: topic ?? this.topic,
      duoTo: duoTo ?? this.duoTo,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'sId': sId,
      'title': title,
      'course': course,
      'topic': topic,
      'duoTo': duoTo,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      sId: map['sId'] != null ? map['sId'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
      course: map['course'] != null ? map['course'] as String : null,
      topic: map['topic'] != null ? map['topic'] as String : null,
      duoTo: map['duo_to'] != null ? map['duo_to'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Quiz.fromJson(String source) =>
      Quiz.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Quiz(sId: $sId, title: $title, course: $course, topic: $topic, duoTo: $duoTo)';
  }

  @override
  bool operator ==(covariant Quiz other) {
    if (identical(this, other)) return true;

    return other.sId == sId &&
        other.title == title &&
        other.course == course &&
        other.topic == topic &&
        other.duoTo == duoTo;
  }

  @override
  int get hashCode {
    return sId.hashCode ^
        title.hashCode ^
        course.hashCode ^
        topic.hashCode ^
        duoTo.hashCode;
  }
}
