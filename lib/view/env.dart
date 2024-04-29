import 'package:flutter/material.dart';
import 'package:practice/model/env_config.dart';

class EnvExample extends StatelessWidget {
  const EnvExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Env Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'API Key: ${EnvConfig.apiKey}',
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'API URL: ${EnvConfig.apiUrl}',
            ),
          ],
        ),
      ),
    );
  }
}
