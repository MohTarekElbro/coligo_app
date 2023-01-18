import 'package:flutter/material.dart';

class NavigateButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final IconData? iconData;
  final double iconSpace;

  const NavigateButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.iconData,
    this.iconSpace = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: iconData == null
            ? Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
              )
            : Row(
                children: [
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  if (iconSpace > 0) SizedBox(width: iconSpace),
                  Icon(iconData, size: 18),
                ],
              ),
      ),
    );
  }
}

class DescriptionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final bool selected;
  final double iconSpace;

  const DescriptionButton({
    Key? key,
    required this.onTap,
    required this.title,
    required this.selected,
    this.iconSpace = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: !selected
            ? Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.bold),
              )
            : Row(
                children: [
                  Text(
                    "Full description",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: selected
                            ? Theme.of(context).colorScheme.primary
                            : Colors.black),
                  ),
                  const SizedBox(width: 3),
                  Icon(
                    Icons.arrow_forward,
                    size: 18,
                    color: selected
                        ? Theme.of(context).colorScheme.primary
                        : Colors.black,
                  ),
                ],
              ),
      ),
    );
  }
}
