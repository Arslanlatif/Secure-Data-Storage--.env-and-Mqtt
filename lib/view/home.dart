import 'package:flutter/material.dart';
import 'package:practice/view/env.dart';
import 'package:practice/view/mqtt.dart';
import 'package:practice/view/secure_storage.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('HomeScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EnvExample(),
                      ));
                },
                child: const Text('Go to env example ')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SecureStorage(),
                      ));
                },
                child: const Text('Go to Secure Data Storage')),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MqttScreen(),
                      ));
                },
                child: const Text('Go to Mqtt Screen')),
          ],
        ),
      ),
    );
  }
}
