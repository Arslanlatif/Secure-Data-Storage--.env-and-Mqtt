import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mqtt_client/mqtt_client.dart';

class MQTTService {
  late MqttClient client;

  // To establish connection
  Future<void> connecting() async {
    try {
      await dotenv.load();
      final mqttBroker = dotenv.env['MQTT_BROKER'];

      client = MqttClient(mqttBroker!, '');
      client.logging(on: true);
      client.onConnected = _onConnected;
      client.onDisconnected = _onDisconnected;

      // final connMessage = MqttConnectMessage()
      //     .withClientIdentifier('flutter_client')
      //     .startClean();

      await client.connect();
    } catch (e) {
      print('Exception: $e');
    }
  }

  void _onConnected() {
    print('Connected');
  }

  void _onDisconnected() {
    print('Disconnected');
  }
}
