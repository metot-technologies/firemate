![image](https://i.ibb.co/st0d159/1.png)


<br/>
Firemate is a tool to help firefighters to speed up their response.

## ❗️  Introduction
The average response time for firefighters is 45 minutes in some areas in Indonesia, exceeding the national standard of 15 minutes. This is due to the delay in officers receiving information about the fire incident. This causes great loss. To bridge this gap, we created Firemate, an app that speed up firefighters response. We used ESP8266 as the microcontroller, ESP32-CAM, MQ-2 Smoke/Gas sensor, KY-026 flame sensor and NEO-6M GPS Module. <br/>
With Firemate, we hope Fire Fighter in Bali, Indonesia will got the fire information faster, and hopefully will reduce the loss of fire victim.
<br/>

## 🎯 **Our Goal**

![](https://i.ibb.co/tMWVjpz/123.png)

**Firemate** aims to address UN Sustainable Development Goals (SDGs) 9. industry, innovation and infrastructure, 11. sustainable cities and communities, and 17. partnerships for the goals. Our overarching goal is make a new innovation to reduce communities loss and make a partnership with firefighter and goverment. 
<br><br>

## 🛠  Project Architecure

![structure](https://i.ibb.co/hm3Crjh/3d363564353730.png)

**Firemate** uses 3 Google Technologies;
- **Firebase** to connect IOT to the app.
  - **Realtime Database** to store the data (status, lat, lon, etc).
  - **Firestore** to save the captured image from ESP32-CAM.
- **Flutter** as the android app.
- And **Google Maps** to show direction to the fire incident.

**Firemate** also uses IOT that utilized ESP8266 as the microcontroller, ESP32-CAM, MQ-2 Smoke/Gas sensor, KY-026 flame sensor and NEO-6M GPS Module, you can check the code and detailed pin connection [here](https://github.com/metot-technologies/firemate-iot). The schematic as shown below.<br/>
![IOT-shcematic](https://i.ibb.co/XCVWC96/schematic.png)

## 📽  Demo Video Link

 [![Firemate](https://i.ibb.co/MDjQhGP/53836.png)](https://youtu.be/5NMMLgB3WJE)
 
 <br/>

 
 
## 👩🏼‍💻  User Guide
### 01 Home Screen
| Screen                                | Explanation |
|---------------------------------------|-------------------------------------------------------|
|**1) Home Screen** <br/> <br/> <img src="https://i.ibb.co/CJX3n2R/image.png" width="250"/> | Firefighter can see fire incident list that they need to response. <br/> <br/> |
| **2) Selesai Button** <br/> <br/> <img src="https://i.ibb.co/0Bs1YVL/c0a6bec902.gif" width="250"/> | When "Selesai" button clicked, the fire incident will marked as done. |
| **3) Lokasi Button** <br/> <br/> <img src="https://i.ibb.co/Bn3dh9r/Screen-recording-20240503-203513.gif" width="250"/> | When "Lokasi" button clicked, the app will open Google Maps and show the direction to the fire incident location. |
| **4) Preview Image** <br/> <br/> <img src="https://i.ibb.co/mBg8hRB/Screen-recording-20240503-203558.gif" width="250"/> | the image can be viewed to check if there is a true or false notification |

### 02 History Screen
| Screen                                | Explanation |
|---------------------------------------|-------------------------------------------------------|
|<img src="https://i.ibb.co/VJ3Hh6T/image.png" width="250"/> | Firefighter can see history of the fire incident that they already response. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br/> <br/> [ User Guide ] <br/>  1. [Lokasi] To open google maps that show direction to the location |
<br/>

## 📲  Execution Method

###  For Android User

1. Download the apk file at [Releases tab](https://github.com/metot-technologies/firemate/releases).
2. Run the apk file on your phone.

### For Dev

1. Clone the project
```sh
git clone https://github.com/metot-technologies/firemate.git
```
2. Navigate to the project directory
```sh
cd firemate
```
3. Install dependencies
```sh
flutter pub get
```
4. Run the app
```sh
flutter run
```
<br/>

## 👥  Contributors

|[Pantera](https://github.com/BagoesPantera)|[Radika](https://github.com/RadikaBadra)|[Galang](https://github.com/manggalang)|[Angga](https://github.com/AnggaPalguna)|
|---|---|---|---|
|<img src="https://github.com/BagoesPantera.png" size="10px">|<img src="https://github.com/RadikaBadra.png">|<img src="https://github.com/manggalang.png">|<img src="https://github.com/AnggaPalguna.png">|
