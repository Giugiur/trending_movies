import 'package:flutter/material.dart';

class MovieDetailInformation extends StatelessWidget {
  final String label;
  final String text;

  const MovieDetailInformation({
    required this.label,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
              text: label,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary
              )
          ),
          TextSpan(
            text: text,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
