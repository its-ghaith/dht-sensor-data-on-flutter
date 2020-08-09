import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import '../constants.dart';

class Wemos extends StatefulWidget {
  final String no;
  final String clientIdentifier;

  Wemos(this.no, this.clientIdentifier);

  @override
  _WemosState createState() => _WemosState(this.no, this.clientIdentifier);
}

class _WemosState extends State<Wemos> {
  String no;
  bool led = false;
  String iconled = "assets/icons/icons8-led-diode-100.png";

  double temp = 0;
  double humidity = 0;

  String broker = 'broker.mqttdashboard.com';
  int port = 1883;
  String clientIdentifier;

  MqttClient client;
  MqttConnectionState connectionState;

  TextEditingController subController = new TextEditingController();
  TextEditingController pubController = new TextEditingController();

// ignore: cancel_subscriptions
  StreamSubscription subscription;

  _WemosState(String no, String clientIdentifier) {
    this.no = no;
    this.clientIdentifier = clientIdentifier;
    _connect();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                flex: 0,
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              flex: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * .49,
                                height: 40,
                                child: TextField(
                                  controller: subController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    hintText: "sub. topic wemos " + this.no,
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 0,
                              child: IconButton(
                                  padding: EdgeInsets.symmetric(horizontal: 0),
                                  icon: new Image.asset(
                                      "assets/icons/icons8-computer-verbinden-100.png"),
                                  onPressed: subscriptionConnect())),
                          Expanded(
                              flex: 0,
                              child: IconButton(
                                  padding: EdgeInsets.symmetric(horizontal: 0),
                                  icon: new Image.asset(
                                      "assets/icons/icons8-getrennt-64.png"),
                                  onPressed: subscriptionDisconnect())),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * .49,
                                height: 40,
                                child: TextField(
                                  controller: pubController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    hintText: "pub. topic wemos " + this.no,
                                  ),
                                ),
                              )
                          ),
                          Expanded(
                              flex: 0,
                              child: IconButton(
                                  padding: EdgeInsets.symmetric(horizontal: 0),
                                  icon: new Image.asset("assets/icons/emptyIcon.png"),
                                  )
                          ),
                          Expanded(
                              flex: 0,
                              child: IconButton(
                                  padding: EdgeInsets.symmetric(horizontal: 0),
                                  icon: new Image.asset("assets/icons/emptyIcon.png"),
                              )
                          )
                        ],
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 0,
                child: Container(
                  child: Column(
                    children: [
                      Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: primaryColor,
                          child: IconButton(
                            icon: new Image.asset(iconled),
                            iconSize: 10,
                            onPressed: ledswitch(),
                          ))
                    ],
                  ),
                ))
          ],
        ),
        Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          color: primaryColor,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.23,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      'assets/icons/icons8-thermometer-64.png'),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                      child: Text(
                                        "Temperature: " +
                                            temp.toString() +
                                            "\u00B0",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                    child: Column(
                      children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          color: primaryColor,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.23,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                      'assets/icons/icons8-feuchtigkeitsmesser-64.png'),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03),
                                      child: Text(
                                        'humidity: ' + humidity.toString(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 14,
                                        ),
                                      ))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ],
    );
  }

  void _connect() async {
    client = MqttServerClient(broker, clientIdentifier);
    client.port = port;

    client.logging(on: false);

    client.keepAlivePeriod = 30;

    final MqttConnectMessage connMess = MqttConnectMessage()
        .withClientIdentifier(clientIdentifier)
        .startClean() // Non persistent session for testing
        .keepAliveFor(30)
        .withWillQos(MqttQos.atMostOnce);
    print('[MQTT client] MQTT client connecting....');
    client.connectionMessage = connMess;

    try {
      await client.connect();
    } catch (e) {
      print(e);
    }

    if (client.connectionState == MqttConnectionState.connected) {
      print('[MQTT client] connected');
      setState(() {
        connectionState = client.connectionState;
      });
    } else {
      print('[MQTT client] ERROR: MQTT client connection failed - '
          'disconnecting, state is ${client.connectionState}');
    }

    subscription = client.updates.listen(_onMessage);
  }

  void _onMessage(List<MqttReceivedMessage> event) {
    final MqttPublishMessage recMess = event[0].payload as MqttPublishMessage;
    final String message =
        MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

    print('[MQTT client] MQTT message: topic is <${event[0].topic}>, '
        'payload is <-- ${message} -->');
    print(client.connectionState);
    print("[MQTT client] message with topic: ${event[0].topic}");
    print("[MQTT client] message with message: ${message}");
    setState(() {
      Map<String, dynamic> info = jsonDecode(message);
      temp = double.parse(info['temp']);
      humidity = double.parse(info['humidity']);
    });
  }

  void publishMessage() {
    final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
    builder.addString(this.led.toString());

    print(
        'MQTTClientWrapper::Publishing message ${this.led} to topic ${pubController.text}');
    client.publishMessage(
        pubController.text, MqttQos.exactlyOnce, builder.payload);
  }

  Function ledswitch() {
    if (pubController.text.isEmpty && pubController.text.trim() == "")
      return null;
    else {
      return () {
        setState(() {
          led = !led;
          iconled = led
              ? "assets/icons/icons8-led-diode-100 off.png"
              : "assets/icons/icons8-led-diode-100.png";
        });
        print("Led wemos ${this.no} ${led.toString()} switched");
        publishMessage();
      };
    }
  }

  subscriptionConnect() {
    if (subController.text.isEmpty && subController.text.trim() == "")
      return null;
    else
      return () async {
        if (this.client.connectionState == MqttConnectionState.disconnected)
          await _connect();
        print("sub connect " + this.no);
        _subscribeToTopic(subController.text);
      };
  }

  subscriptionDisconnect() {
    return () {
      print("sub disconnect " + this.no);
      this.client.disconnect();
    };
  }

  void _subscribeToTopic(String topic) {
    if (connectionState == MqttConnectionState.connected) {
      print('[MQTT client] Subscribing to ${topic.trim()}');
      client.subscribe(topic, MqttQos.exactlyOnce);
    }
  }
}
