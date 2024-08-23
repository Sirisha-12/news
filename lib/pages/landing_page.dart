import 'package:flutter/material.dart';

import 'package:news/pages/home.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                width: MediaQuery.of(context).size.height / 2,
                'assets/landing.jpg',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              textAlign: TextAlign.center,
              'News from around the world just for you',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.all(3),
              child: const Text(
                textAlign: TextAlign.center,
                "Best time to read ,take a little more time of your's to know what is happening around the world",
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Home(),
                    ));
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.indigo),
                child: const Center(
                  child: Text('Get Started',
                      style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
