// ignore_for_file: prefer_const_constructors, unused_element

import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'intro_page_model.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final pages = [
    const PageData(
      title: " Welcome to Chap Lifti",
      image: "assets/lottie_assets/1.json",
      bgColor: Colors.indigo,
      textColor: Colors.blue,
    ),
    const PageData(
      title: " Get your travel partner easly with Chap Lifti ",
      image: "assets/lottie_assets/2.json",
      bgColor: Colors.white,
      textColor: Colors.blueAccent,
    ),
    const PageData(
      title: " Click Next to Register",
      image: "assets/lottie_assets/2.json",
      bgColor: Colors.blue,
      textColor: Colors.indigo,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: ConcentricPageView(
        //  colors: <Color>[Colors.white, Colors.blue, Colors.red],
        colors: pages.map((e) => e.bgColor).toList(),
        radius: screenWidth * 0.1,
        nextButtonBuilder: (context) => Padding(
          padding: EdgeInsets.only(left: 3),
          child: Icon(
            Icons.navigate_next,
            size: screenWidth * 0.08,
          ),
        ), // null = infinity
        itemBuilder: (index) {
          final page = pages[index % pages.length];
          return SafeArea(child: _Page(page: page));
        },
      ),
    );
  }
}

class _Page extends StatelessWidget {
  final PageData page;
  const _Page({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              child: const Text(
                'Next',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        SizedBox(
          height: screenHeight * 3 / 100,
        ),
        Lottie.asset(page.image.toString()),
        SizedBox(
          height: screenHeight * 3 / 100,
        ),
        Text(
          page.title,
          style: TextStyle(
            fontSize: screenHeight * 0.035,
            color: Colors.black54,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
