#include <ArduinoJson.h>
#include <ESP8266WiFi.h>
#include <MQTT.h>

#include "dht.h"
#define dht_apin D5
dht DHT;

const char ssid[] = "Daba";
const char pass[] = "27408900";

WiFiClient net;
MQTTClient client;

unsigned long lastMillis = 0;

void connect() {
  Serial.print("checking wifi...");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(1000);
  }

  Serial.print("\nconnecting...");
  while (!client.connect("clientId-AYeFH92p3c", "hs-anhalt-ims", "hs-anhalt-ims")) {
    Serial.print(".");
    delay(1000);
  }

  Serial.println("\nconnected!");

  client.subscribe("/albaba");
  // client.unsubscribe("/hello");
}

void messageReceived(String &topic, String &payload) {
  Serial.println("incoming: " + topic + " - " + payload);
}

void setup() {
  Serial.begin(115200);
  WiFi.begin(ssid, pass);

  // Note: Local domain names (e.g. "Computer.local" on OSX) are not supported by Arduino.
  // You need to set the IP address directly.
  client.begin("broker.mqttdashboard.com", net);
  client.onMessage(messageReceived);

  connect();
}

void loop() {
  client.loop();
  delay(10);  // <- fixes some issues with WiFi stability
  DHT.read11(dht_apin);
  float temp = DHT.temperature;
  float humi = DHT.humidity;
  
  if (!client.connected()) {
    connect();
  }

  // publish a message roughly every second.
  if (millis() - lastMillis > 1000) {
    lastMillis = millis();
    DynamicJsonBuffer jBuffer;
    JsonObject& root = jBuffer.createObject();
    root["temperature"]= temp;
    root["humidity"]= humi;
    String message;
    root.printTo(message);
    client.publish("/albaba", message);
  }
  delay(1000);
}