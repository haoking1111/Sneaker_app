import 'package:flutter/material.dart';

import '../global/common/privacy_notifacation_text.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({Key? key}) : super(key: key);

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {
  bool isSwitchProfile = true;
  bool isSwitchBehavioural = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          'Privacy',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Your privacy settings apply across all Sneaker apps. '
                    'When you change your settings in one app, they will change in the others. '
                    'For more information, visit our privacy policy page.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Privacy Policy',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Divider(
                  color: Colors.grey,
                ),
              ),

              PrivacyNotificationText(
                'Get personalised ads based on profile matching',
                'Share your email address and phone number with Sneaker ad partners, '
                    'so we can personalise ads based on your interests',
                'Lean More About Ad Partners',
                isSwitchProfile,
                    (value) {
                  setState(() {
                    isSwitchProfile = value;
                  });
                },
              ),

              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Divider(
                  color: Colors.grey,
                ),
              ),

              PrivacyNotificationText(
                'Get personalised ads based on behavioural data',
                'Use cookies, clickstream data and other technologies for advertising purposes.'
                    'Share behavioural data with ad networks to personalise ads',
                'Lean More About Behavioural Data',
                isSwitchBehavioural,
                    (value) {
                  setState(() {
                    isSwitchBehavioural = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
