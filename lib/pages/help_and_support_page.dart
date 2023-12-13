import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HelpAndSupportPage extends StatelessWidget {
  const HelpAndSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Text('GET SUPPORT',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
              SizedBox(
                height: 10,
              ),
              Text(
                'Get help finding the right products and services for your needs.',
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                ),
                textAlign: TextAlign.center,
              ),

              SizedBox(height: 20,),

              const Padding(
                padding:
                EdgeInsets.only(left: 25.0, right: 25.0, bottom: 20),
                child: Divider(
                  color: Colors.white,
                ),
              ),

              HelpAndSupportText(() => null, FontAwesomeIcons.phone, 'Call Us'),

              const Padding(
                padding:
                EdgeInsets.only(left: 25.0, right: 25.0, bottom: 20),
                child: Divider(
                  color: Colors.white,
                ),
              ),

              HelpAndSupportText(() => null, FontAwesomeIcons.solidCircleQuestion, 'Browse FAQs'),

            ],
          ),
        ),
      ),
    );
  }

  Widget HelpAndSupportText(Function() nameFuntion, IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
      child: GestureDetector(
        onTap: nameFuntion,
        child: Container(
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 15,
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                Spacer(),
                Icon(
                  FontAwesomeIcons.angleRight,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
