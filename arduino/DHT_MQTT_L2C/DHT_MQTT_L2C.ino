#include <ArduinoJson.h>
#include <ESP8266WiFi.h>
#include <MQTT.h>

#include "dht.h"

#define dht_apin D5

#include <LiquidCrystal_I2C.h>


dht DHT;
LiquidCrystal_I2C lcd(0x27,2,1,0,4,5,6,7,3,POSITIVE);
     //Das Wort piezo ist jetzt die Zahl 5 

const char ssid[] = "Taem";
const char pass[] = "taemalJAZZAR123**";

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
  while (!client.connect("clientId-AYeFH92p3d", "hs-anhalt-ims", "hs-anhalt-ims")) {
    Serial.print(".");
    delay(1000);
  }

  Serial.println("\nconnected!");

  client.subscribe("/ledwemos2");
  // client.unsubscribe("/hello");
}

void messageReceived(String &topic, String &payload) {
  //Serial.println("incoming: " + topic + " - " + payload);
  if(payload=="true"){
    digitalWrite(LED_BUILTIN, HIGH);
  }
  else if (payload=="false"){
    digitalWrite(LED_BUILTIN, LOW);
  }
}

void setup() {
  pinMode(LED_BUILTIN, OUTPUT);
  Serial.begin(115200);
  WiFi.begin(ssid, pass);
  lcd.begin(16,2);

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
  
  lcd.setBacklight(HIGH);
  lcd.setCursor(0,0);

  float temp = DHT.temperature;
  float humi = DHT.humidity;

  lcd.print("Humidity");
  lcd.print(humi);

  lcd.setCursor(0,1);
  lcd.print("temperature");
  lcd.print(temp);
  
  if (!client.connected()) {
    connect();
  }
  // publish a message roughly every second.
  if (millis() - lastMillis > 1000) {
    lastMillis = millis();
    
    const size_t CAPACITY = JSON_OBJECT_SIZE(4);
    StaticJsonDocument<CAPACITY> doc;
    JsonObject object = doc.to<JsonObject>();
    String message;
    String temps=String(temp);
    String humis=String(humi);
    object["temp"] = temps;
    object["humidity"] = humis;
    serializeJson(doc, message);  
    client.publish("/infowemos2", message);
  }
  delay(200);
}
