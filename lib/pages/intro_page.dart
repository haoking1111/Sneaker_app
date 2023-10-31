import 'package:flutter/material.dart';
import 'home_page.dart';
class IntroPage extends StatelessWidget{
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset('assets/images/nike.png', height: 240,),
              ),
              const SizedBox(height: 25.0),

              // title
              const Text(
                'Just Do It',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(height: 24.0),

              // subtitle
              const Text(
                'Brand new speakers and custom kicks made with premium quality',
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48.0),

              // start button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(
                    builder: (context) => HomePage(),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(25.0),
                  child: const Center(
                    child: Text(
                      'Shop now',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}