import 'package:coligo/dashboard/model/quiz.dart';
import 'package:flutter/material.dart';

class CardAnnounceMedium extends StatelessWidget {
  final Quiz quiz;
  final IconData? iconData;

  const CardAnnounceMedium(
      {Key? key, required this.quiz, required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
          contentPadding:
              const EdgeInsets.only(top: 32, bottom: 32, right: 12, left: 20),
          visualDensity:
              const VisualDensity(vertical: VisualDensity.maximumDensity),
          leading: iconData != null
              ? Icon(
                  Icons.hourglass_top_rounded,
                  size: 40,
                  color: Theme.of(context).colorScheme.primary,
                )
              : null,
          title: Text(
            quiz.title!,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "Course: ",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: quiz.course,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "Topic:    ",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: quiz.topic,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              RichText(
                text: TextSpan(children: <TextSpan>[
                  TextSpan(
                    text: "Duo To: ",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: quiz.duoTo,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ],
          )),
    );
  }
}
