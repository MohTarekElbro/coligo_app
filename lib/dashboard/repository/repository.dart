import 'dart:convert';

import 'package:coligo/dashboard/model/announcement.dart';
import 'package:coligo/dashboard/model/quiz.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<QuizResponse> getQuizzes() async {
    dynamic url = Uri.https("coligo12.herokuapp.com", "/quizzes");
    http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    dynamic result = QuizResponse.fromJson(response.body);
    return result;
  }

  Future<AnnouncementResponse> getAnnouncements() async {
    dynamic url = Uri.https("coligo12.herokuapp.com", "/announcements");
    http.Response response = await http.get(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
    );
    dynamic result = AnnouncementResponse.fromJson(response.body);
    return result;
  }
}
