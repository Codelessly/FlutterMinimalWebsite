import 'dart:convert';
import 'dart:math';

class DeviceDataRepository {
  List<DeviceData> deviceDatas;
  List<DeviceData> activeDeviceDatas;

  DeviceDataRepository(String deviceDataJson, {List<String> activeDevices}) {
    deviceDatas = DeviceData.listDeserializerFromJson(deviceDataJson);
    // If a list of active devices exists, set active devices list.
//    deviceDatas.removeWhere((e) => !activeDevices.any((activeDevice) => e.name == activeDevice));
  }

  void addDeviceData(DeviceData deviceData) {
    if (!deviceDatas.contains(deviceData)) deviceDatas.add(deviceData);
  }

  void removeDeviceData(DeviceData deviceData) {
    deviceDatas.remove(deviceData);
  }
}

class DeviceData {
  final String name;
  final String brand;
  final String model;
  final int width;
  final int height;
  final int screenWidth;
  final int screenHeight;
  final double physicalSize;
  final double devicePixelRatio;
  final int dpi;

  DeviceData({
    this.name,
    this.brand,
    this.model,
    this.width,
    this.height,
    this.screenWidth,
    this.screenHeight,
    this.physicalSize,
    this.devicePixelRatio,
    this.dpi,
  });

  DeviceData copyWith({
    String name,
    String brand,
    String model,
    int width,
    int height,
    int screenWidth,
    int screenHeight,
    double physicalSize,
    double devicePixelRatio,
    double dpi,
  }) =>
      DeviceData(
        name: name ?? this.name,
        brand: brand ?? this.brand,
        model: model ?? this.model,
        width: width ?? this.width,
        height: height ?? this.height,
        screenWidth: screenWidth ?? this.screenWidth,
        screenHeight: screenHeight ?? this.screenHeight,
        physicalSize: physicalSize ?? this.physicalSize,
        devicePixelRatio: devicePixelRatio ?? this.devicePixelRatio,
        dpi: dpi ?? this.dpi,
      );

  factory DeviceData.fromJson(String str) =>
      DeviceData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeviceData.fromMap(Map<String, dynamic> json) => DeviceData(
        name: json["brand"] + json["model"],
        brand: json["brand"],
        model: json["model"],
        width: json["width"],
        height: json["height"],
        screenWidth: json["screenWidth"],
        screenHeight: json["screenHeight"],
        physicalSize: json["physicalSize"].toDouble(),
        devicePixelRatio: json["devicePixelRatio"].toDouble(),
        dpi: (sqrt(json["screenHeight"] * json["screenHeight"] +
                    json["screenWidth"] * json["screenWidth"]) /
                json["physicalSize"])
            .round(),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "brand": brand,
        "model": model,
        "width": width,
        "height": height,
        "screenWidth": screenWidth,
        "screenHeight": screenHeight,
        "physicalSize": physicalSize,
        "devicePixelRatio": devicePixelRatio,
        "dpi": dpi,
      };

  static List<DeviceData> listDeserializerFromJson(String str) =>
      DeviceData.listDeserializer(json.decode(str));

  static List<DeviceData> listDeserializer(List list) {
    return List<DeviceData>.generate(
        list.length, (index) => DeviceData.fromMap(list[index]));
  }
}

const String deviceDataJson =
    '[{"brand":"iPhone","model":"11 Pro Max","width":1242,"height":2688,"physicalSize":6.5,"devicePixelRatio":3},{"brand":"iPhone","model":"11 Pro","width":1125,"height":2436,"physicalSize":5.8,"devicePixelRatio":3},{"brand":"iPhone","model":"11","width":828,"height":1792,"physicalSize":6.1,"devicePixelRatio":2},{"brand":"iPhone","model":"XS Max","width":1242,"height":2688,"physicalSize":6.5,"devicePixelRatio":3},{"brand":"iPhone","model":"XS","width":1125,"height":2436,"physicalSize":5.8,"devicePixelRatio":3},{"brand":"iPhone","model":"XR","width":828,"height":1792,"physicalSize":6.1,"devicePixelRatio":2},{"brand":"iPhone","model":"X","width":1125,"height":2436,"physicalSize":5.8,"devicePixelRatio":3},{"brand":"iPhone","model":"8 Plus","width":1080,"height":1920,"physicalSize":5.5,"devicePixelRatio":3},{"brand":"iPhone","model":"8","width":750,"height":1334,"physicalSize":4.7,"devicePixelRatio":2},{"brand":"Pixel","model":"4 XL","width":1440,"height":3040,"physicalSize":6.3,"devicePixelRatio":3.5},{"brand":"Pixel","model":"4","width":1080,"height":2280,"physicalSize":5.7,"devicePixelRatio":2.625},{"brand":"Pixel","model":"3a XL","width":1080,"height":2160,"physicalSize":6,"devicePixelRatio":2.625},{"brand":"Pixel","model":"3a","width":1080,"height":2220,"physicalSize":5.6,"devicePixelRatio":2.625},{"brand":"Pixel","model":"3 XL","width":1440,"height":2960,"physicalSize":6.3,"devicePixelRatio":3.5},{"brand":"Pixel","model":"3","width":1080,"height":2160,"physicalSize":5.5,"devicePixelRatio":2.625},{"brand":"Samsung","model":"Note 10+","width":1440,"height":3040,"physicalSize":6.8,"devicePixelRatio":3.5},{"brand":"Samsung","model":"Note 10","width":1080,"height":2280,"physicalSize":6.3,"devicePixelRatio":2.625},{"brand":"Samsung","model":"S10+","width":1440,"height":3040,"physicalSize":6.4,"devicePixelRatio":3.5},{"brand":"Samsung","model":"S10","width":1440,"height":3040,"physicalSize":6.1,"devicePixelRatio":4},{"brand":"Samsung","model":"S9+","width":1440,"height":2960,"physicalSize":6.2,"devicePixelRatio":4},{"brand":"Samsung","model":"S9","width":1440,"height":2960,"physicalSize":6.4,"devicePixelRatio":3.5}]';
