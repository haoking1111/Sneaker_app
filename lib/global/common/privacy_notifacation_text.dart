import 'package:flutter/material.dart';

class PrivacyNotificationText extends StatelessWidget {
  final String textTitle;
  final String textContent;
  final String textDescription;
  final bool switchValue;
  final ValueChanged<bool> onSwitchChanged;

  const PrivacyNotificationText(
      this.textTitle,
      this.textContent,
      this.textDescription,
      this.switchValue,
      this.onSwitchChanged,
      );

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textTitle,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                textContent,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                textDescription,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            ],
          ),
        ),
        Switch(
          value: switchValue,
          onChanged: onSwitchChanged,
        ),
      ],
    );
  }
}