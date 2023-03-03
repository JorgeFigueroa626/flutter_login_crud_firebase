import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:page_indicator/page_indicator.dart';

final googleClientId = Platform.isIOS
    ? '943369872612-a7b03dhl57prpdtmb2vorfsj6n8bkj65.apps.googleusercontent.com'
    : '943369872612-uot87ceu9fnv8m5em2vdaaf1fj6mlsii.apps.googleusercontent.com';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
      ),
      body: _IntroPage()
    );
  }
}

class _IntroPage  extends StatelessWidget {
  final String exampleText = 'Esto es la primera portada, '
      'Es una portda de prueba '
      'Ultima porta de prueba.';
  const _IntroPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return PageIndicatorContainer(
      align: IndicatorAlign.bottom,
      length: 4,
      indicatorSpace:12,
      indicatorColor: Colors.grey,
      indicatorSelectorColor: Colors.black,
      child: PageView(
        children: <Widget>[
          _DescriptionPage(text: exampleText,
            imagePath: 'assets/intro_1.png',
          ),
          _DescriptionPage(text: exampleText,
            imagePath: 'assets/intro_2.png',
          ),
          _DescriptionPage(text: exampleText,
            imagePath: 'assets/intro_3.png',
          ),
          _LoginPage(),
        ],
      ),
    );
  }
}


class _DescriptionPage extends StatelessWidget {
  final String text;
  final String imagePath;

  const _DescriptionPage({
    super.key,
    required this.text,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(imagePath,
            width: 300,
            height: 400,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style:const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  SignInScreen(
      providerConfigs: [
        const  EmailProviderConfiguration(),
        GoogleProviderConfiguration(clientId: googleClientId),
        const FacebookProviderConfiguration(clientId: ''),
      ],
    );
  }
}

