import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

String broker = 'broker.mqttdashboard.com';
int port = 1883;
String username = 'hs-anhalt-ims';
String password = 'hs-anhalt-ims';
String clientIdentifier = 'clientId-Z5Q0iVymbd';

connectToSubscribe({@required String topic}) async {
  final String typeMethode = "subscribe" ;
  connect(topic: topic, type: typeMethode);
}

connectToPublish({@required String topic}) async {
  final String typeMethode = "publish" ;
  connect(topic: topic, type: typeMethode);
}

connect({@required String topic, @required String type}) async {
  final client = MqttServerClient(broker, clientIdentifier);
  final connMess = MqttConnectMessage()
      .withClientIdentifier(clientIdentifier)
      .keepAliveFor(20)
      .authenticateAs(username, password)
      .startClean();

  print(
      'DisplaySensor::Mqtt client client with topic $topic to $type connecting....'
  );

  client.connectionMessage = connMess;

  try {
    await client.connect();
  } on Exception catch (e) {
    print('DisplaySensor::client exception - $e');
    client.disconnect();
  }

  if (client.connectionStatus.state == MqttConnectionState.connected) {
    print(
        'DisplaySensor::Mqtt client connected with topic $topic to $type');
  } else {
    /// Use status here rather than state if you also want the broker return code.
    print(
        'DisplaySensor::ERROR Mqtt client connection failed - disconnecting, status is ${client.connectionStatus}');
    client.disconnect();
  }

}
