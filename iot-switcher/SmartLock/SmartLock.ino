#include <WiFi.h>
#include <PubSubClient.h>
#include <ArduinoJson.h>
#include "DFRobot_Aliyun.h"

#define SET_DOOR_PIN  3
#define READ_DOOR_PIN  6

/*配置WIFI名和密码*/
const char * WIFI_SSID     = "main";
const char * WIFI_PASSWORD = "12312311";

/*配置设备证书信息*/

String ProductKey = "a1ERl02M7Id";
String ClientId = "alitest";
String DeviceName = "ali_kit";
String DeviceSecret ="dl46BBKockakVTDqXZremZJUZpsvD8AC";

/*配置域名和端口号*/
String ALIYUN_SERVER = "iot-as-mqtt.cn-shanghai.aliyuncs.com";
uint16_t PORT = 1883;

/*需要操作的产品标识符*/
String Identifier = "DoorState";

/*需要上报和订阅的两个TOPIC*/
const char * subTopic = "/sys/a1ERl02M7Id/ali_kit/thing/service/property/set";
const char * pubTopic = "/sys/a1ERl02M7Id/ali_kit/thing/event/property/post";

DFRobot_Aliyun myAliyun;
WiFiClient espClient;
PubSubClient client(espClient);

uint8_t readDoorStatus(){
  return digitalRead(READ_DOOR_PIN);
}
static void openDoor(){
  digitalWrite(SET_DOOR_PIN, HIGH);
  delay(500);
  digitalWrite(SET_DOOR_PIN, LOW);
}

void connectWiFi(){
  Serial.print("Connecting to ");
  Serial.println(WIFI_SSID);
  WiFi.begin(WIFI_SSID,WIFI_PASSWORD);
  while(WiFi.status() != WL_CONNECTED){
    delay(500);
    Serial.print(".");
  }
  Serial.println();
  Serial.println("WiFi connected");
  Serial.print("IP Adderss: ");
  Serial.println(WiFi.localIP());
}

void callback(char * topic, byte * payload, unsigned int len){
  Serial.print("Recevice [");
  Serial.print(topic);
  Serial.print("] ");
  for (int i = 0; i < len; i++){
    Serial.print((char)payload[i]);
  }
  Serial.println();
  StaticJsonBuffer<300> jsonBuffer;
  JsonObject& root = jsonBuffer.parseObject((const char *)payload);
  if(!root.success()){
    Serial.println("parseObject() failed");
    return;
  }
  uint8_t DoorStatus = root["params"][Identifier];
  Serial.print("readDoorStatus=");
  Serial.print(DoorStatus);
  if(DoorStatus == 1){
    openDoor();
  }
}

void ConnectAliyun(){
  while(!client.connected()){
    Serial.print("Attempting MQTT connection...");
    /*根据自动计算的用户名和密码连接到Alinyun的设备，不需要更改*/
    if(client.connect(myAliyun.client_id,myAliyun.username,myAliyun.password)){
      Serial.println("connected");
      client.subscribe(subTopic);
    }else{
      Serial.print("failed, rc=");
      Serial.print(client.state());
      Serial.println(" try again in 5 seconds");
      delay(5000);
    }
  }
}
void setup(){
  Serial.begin(115200);
  pinMode(SET_DOOR_PIN,OUTPUT);
  pinMode(READ_DOOR_PIN,INPUT_PULLUP);
  digitalWrite(SET_DOOR_PIN, LOW);
  
  /*连接WIFI*/
  connectWiFi();
  
  /*初始化Alinyun的配置，可自动计算用户名和密码*/
  myAliyun.init(ALIYUN_SERVER,ProductKey,ClientId,DeviceName,DeviceSecret);
  
  client.setServer(myAliyun.mqtt_server,PORT);
  
  /*设置回调函数，当收到订阅信息时会执行回调函数*/
  client.setCallback(callback);
  
  /*连接到Aliyun*/
  ConnectAliyun();
  
  /*上报门锁状态信息*/
  client.publish(pubTopic,("{\"id\":"+ClientId+",\"params\":{\""+Identifier+"\":"+readDoorStatus()+"},\"method\":\"thing.event.property.post\"}").c_str());
}
uint8_t tempDoorStatus  = 0;
uint8_t lastDoorStatus  = 0;
void loop(){
  if(!client.connected()){
    ConnectAliyun();
  }
  tempDoorStatus = readDoorStatus();
  if(tempDoorStatus != lastDoorStatus){
    lastDoorStatus = tempDoorStatus;
    /*上报门锁状态信息*/
    client.publish(pubTopic,("{\"id\":"+ClientId+",\"params\":{\""+Identifier+"\":"+tempDoorStatus+"},\"method\":\"thing.event.property.post\"}").c_str());
    delay(500);
  }
  client.loop();
}
