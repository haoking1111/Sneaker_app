import 'package:flutter/material.dart';
import 'package:sneaker_app/global/common/privacy_notifacation_text.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool notifyMe = false;
  bool notifyEvent = true;
  bool notifyMember = true;
  bool notifyLatest = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text('Notifications', style: TextStyle(fontWeight: FontWeight.w500),),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
            padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              PrivacyNotificationText(
              'Notify Me',
              'Never miss a drop. Get reminders for items you want when they become available.',
              'Edit Schedule',
                  notifyMe,
                      (value) {
                setState(() {
                  notifyMe = value;
                });
              }),

              const Padding(
                padding: EdgeInsets.only(top: 20, bottom: 10),
                child: Divider(
                  color: Colors.grey,
                ),
              ),

              PrivacyNotificationText(
                  'Articles, Events & Training Tips',
                  'Get motivated with stories, training tips and expert advice.',
                  '',
                  notifyEvent,
                      (value) {
                    setState(() {
                      notifyEvent = value;
                    });
                  }),

              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Divider(
                  color: Colors.grey,
                ),
              ),

              PrivacyNotificationText(
                  'Nike Member Rewards & Promos',
                  'Enjoy a birthday gift, special offers and access to exclusive products.',
                  '',
                  notifyMember,
                      (value) {
                    setState(() {
                      notifyMember = value;
                    });
                  }),

              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Divider(
                  color: Colors.grey,
                ),
              ),

              PrivacyNotificationText(
                  'Latest Products & Bestsellers',
                  'Get notified about the latest styles and top-selling favourites.',
                  '',
                  notifyLatest,
                      (value) {
                    setState(() {
                      notifyLatest = value;
                    });
                  }),
              const Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
