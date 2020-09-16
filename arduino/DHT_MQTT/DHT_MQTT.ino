// https://arduinojson.org/v6/doc/ zur ArduinoJson6 Documentation
#include <ArduinoJson.h>

#include <ESP8266WiFi.h>

// https://github.com/256dpi/arduino-mqtt zur arduino-mqtt Documentation
#include <MQTT.h>

// http://arduino.cc/playground/Main/DHTLib zur DHTxx sensors Documentation
#include "dht.h"

// definieren vom pin, an dem das DHT Sensor verbunden wird.
#define dht_apin D5

// eine Instanz von DHT Klass
dht DHT;

// WIFI info
const char ssid[] = "Daba";
const char pass[] = "27408900";

// eine Instanz von WiFiClient Klass
WiFiClient net;

// eine Instanz von MQTTClient Klass, um die Verbindung zwischen
//dem Microkontroller und MQTT Broker zu verwalten
MQTTClient client;

unsigned long lastMillis = 0;

void connect() {
  
  // warten bis der Microkontroller mit dem Netz verbindent.
  Serial.print("checking wifi...");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(1000);
  }

  // warten bis der Microkontroller mit dem MQTT Broker verbindet.
  Serial.print("\nconnecting...");
  // <clientId-AYeFH92p3c> ist die Client-id und kann geändert werden.
  // <hs-anhalt-ims> ist der Username und kann geändert werden.
  // <hs-anhalt-ims> ist das Passwort und kann geändert werden.
  while (!client.connect("clientId-AYeFH92p3c", "hs-anhalt-ims", "hs-anhalt-ims")) {
    Serial.print(".");
    delay(1000);
  }

  Serial.println("\nconnected!");

  // Der Client abonniert das Topic z.B. </ledwemos1>,
  // an dem die Messwerte geschickt werden, und kann geändert werden.
  client.subscribe("/ledwemos1");
  // client.unsubscribe("/ledwemos1");
}

// Diese Funktion behandelt die Nachrichten, die an dem genannten topic geschickt wurden.
void messageReceived(String &topic, String &payload) {
  //Serial.println("incoming: " + topic + " - " + payload);
  
  // Logik, um die LED ein- und auszuschalten
  // Diese Logik kann für anderes Fall gelöscht oder geändert werden
  if(payload=="true"){
    digitalWrite(LED_BUILTIN, HIGH);
  }
  else if (payload=="false"){
    digitalWrite(LED_BUILTIN, LOW);
  }
  
}

void setup() {
  // Die Ausgabe Modus wurde der LED zugeordnet.
  pinMode(LED_BUILTIN, OUTPUT);
  
  Serial.begin(115200);
  
  // Hier wird die Verbindung zwischen dem Microkontroller und WIFI vorbereitet.
  WiFi.begin(ssid, pass);
  
  // Hier wird die Verbindung zwischen dem Microkontroller und MQTT Broker vorbereitet.
  client.begin("broker.mqttdashboard.com", net);

  // Hier wird die Funktion difiniert, die wenn eine Nachricht emfangen wurde.
  client.onMessage(messageReceived);
  
  connect();
}

void loop() {
  client.loop();
  delay(10);  // <- fixes some issues with WiFi stability
  
  // Hier wird festgestellt, an welechem Pin gehört, 
  // um Messdaten des DHT Sensors zu empfangen.
  DHT.read11(dht_apin);

  // Die gemessenen Werte des DHT Sensor werden in Variabeln gesetzt.
  float temp = DHT.temperature;
  float humi = DHT.humidity;
  
  // Sicherstellen, dass MQTT client bereit ist. 
  if (!client.connected()) {
    connect();
  }
  
  // publish a message roughly every second.
  if (millis() - lastMillis > 1000) {
    lastMillis = millis();

    // https://arduinojson.org/v6/doc/ zur ArduinoJson6 Documentation
    const size_t CAPACITY = JSON_OBJECT_SIZE(4);
    StaticJsonDocument<CAPACITY> doc;
    JsonObject object = doc.to<JsonObject>();
    String message;
    String temps=String(temp);
    String humis=String(humi);
    object["temp"] = temps;
    object["humidity"] = humis;
    serializeJson(doc, message);
    
    // Die Messwerte werden als Json Objekt an dem genannten Topic durch MQTT geschickt.   
    client.publish("/infowemos1", message);
  }
  delay(200);
}
