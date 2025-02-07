import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stage Zero',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: FeatureUi(),
    );
  }
}

class FeatureUi extends StatelessWidget {
  const FeatureUi({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardWidget(
                image: 'assets/images/hng_logo.jpg',
                text:
                    'Hire the best Developers available for hire and freelance jobs anywhere in the world',
                buttonColor: Color.fromRGBO(0, 174, 255, 1),
                buttonText: 'HNG TECH',
                buttonLink: 'https://hng.tech/hire/flutter-developers',
              ),
              SizedBox(height: size.height * 0.02),
              CardWidget(
                image: 'assets/images/GitHub-Logo.png',
                text: 'Github Repository for HNGTech',
                buttonColor: Colors.black,
                buttonText: 'Git Hub',
                buttonLink: 'https://github.com/Raadebowale/HNGIT',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.image,
    required this.text,
    required this.buttonColor,
    required this.buttonText,
    required this.buttonLink,
  });

  final String image;
  final String text;
  final Color buttonColor;
  final String buttonText;
  final String buttonLink;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Future<void> _launchURL(String url) async {
      try {
        await launchUrl(
          Uri.parse(url),
          mode: LaunchMode.externalApplication,
          webViewConfiguration: WebViewConfiguration(
            enableJavaScript: true,
            headers: {
              'Content-Type': 'application/json',
            },
          ),
        );
      } catch (e) {
        throw 'Could not launch $e';
      }
    }

    return Container(
      width: size.width * 0.6,
      padding: EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(215, 237, 247, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size.width * 0.4,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(image),
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: size.height * 0.02),
          Center(
            child: GestureDetector(
              onTap: () {
                _launchURL(buttonLink);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 50,
                ),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 174, 255, 1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  buttonText,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
