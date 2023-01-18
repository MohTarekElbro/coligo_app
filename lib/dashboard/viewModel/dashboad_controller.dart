import 'dart:ffi';

import 'package:coligo/dashboard/model/announcement.dart';
import 'package:coligo/dashboard/model/quiz.dart';
import 'package:coligo/dashboard/repository/repository.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

class DashboardController extends GetxController {
  Repository? repository;

  List<Quiz> quizzes = List.empty();
  List<Announcement> announcements = List.empty();

  @override
  void onInit() async {
    if (!GetIt.I.isRegistered<Repository>()) {
      GetIt.I.registerSingleton<Repository>(Repository());
    }
    repository = GetIt.I.get<Repository>();

    QuizResponse? QuizResult = await repository?.getQuizzes();
    AnnouncementResponse? AnnouncementResult =
        await repository?.getAnnouncements();
    quizzes = QuizResult!.data;
    announcements = AnnouncementResult!.data;
    update();
    super.onInit();
  }
}
