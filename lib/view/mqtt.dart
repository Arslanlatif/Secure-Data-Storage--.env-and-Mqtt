import 'package:flutter/material.dart';
import 'package:practice/model/mqtt_service.dart';

class MqttScreen extends StatefulWidget {
  const MqttScreen({super.key});

  @override
  State<MqttScreen> createState() => _MqttScreenState();
}

class _MqttScreenState extends State<MqttScreen> {
  final mqttService = MQTTService();
  bool isConnected = false;

  // @override
  // void initState() {
  //   super.initState();
  //   _connectToMQTT();
  // }

  Future<void> _connectToMQTT() async {
    if (!isConnected) {
      await mqttService.connecting();
    } else {}
    setState(() {
      isConnected = !isConnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MQTT Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _connectToMQTT,
              child: Text(
                  isConnected ? 'Disconnect from MQTT' : 'Connect to MQTT'),
            ),
            const SizedBox(height: 20),
            Text('Status: ${isConnected ? 'Connected' : 'Disconnected'}'),
          ],
        ),
      ),
    );
  }
}
