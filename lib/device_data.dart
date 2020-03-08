import 'dart:convert';
import 'dart:math';

class DeviceDataRepository {
  List<DeviceData> deviceDatas = [];
  List<DeviceData> activeDeviceDatas = [];

  DeviceDataRepository(String deviceDataJson, {List<String> activeDevices}) {
    deviceDatas = DeviceData.listDeserializerFromJson(deviceDataJson);
    activeDeviceDatas = deviceDatas;
    // If a list of active devices exists, set active devices list.
//    deviceDatas.removeWhere((e) => !activeDevices.any((activeDevice) => e.name == activeDevice));
  }

  void addDeviceData(DeviceData deviceData) {
    if (!deviceDatas.contains(deviceData)) deviceDatas.add(deviceData);
  }

  void removeDeviceData(DeviceData deviceData) {
    deviceDatas.remove(deviceData);
  }

  List<DeviceData> addAllWithBrand(String brand) {
    Iterable<DeviceData> matchedDevices =
        deviceDatas.where((element) => element.brand == brand);
    matchedDevices.forEach((element) {
      if (!activeDeviceDatas.contains(element)) {
        activeDeviceDatas.add(element);
      }
    });

    return activeDeviceDatas;
  }
}

class DeviceData {
  final String name;
  final String brand;
  final String model;
  final int width;
  final int height;
  final double physicalSize;
  final double devicePixelRatio;
  final double aspectRatio;
  final int dpi;

  DeviceData({
    this.name,
    this.brand,
    this.model,
    this.width,
    this.height,
    this.physicalSize,
    this.devicePixelRatio,
    this.aspectRatio,
    this.dpi,
  });

  DeviceData copyWith({
    String name,
    String brand,
    String model,
    int width,
    int height,
    double physicalSize,
    double devicePixelRatio,
    double aspectRatio,
    int dpi,
  }) =>
      DeviceData(
        name: name ?? this.name,
        brand: brand ?? this.brand,
        model: model ?? this.model,
        width: width ?? this.width,
        height: height ?? this.height,
        physicalSize: physicalSize ?? this.physicalSize,
        devicePixelRatio: devicePixelRatio ?? this.devicePixelRatio,
        aspectRatio: aspectRatio ?? this.aspectRatio,
        dpi: dpi ?? this.dpi,
      );

  factory DeviceData.fromJson(String str) =>
      DeviceData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DeviceData.fromMap(Map<String, dynamic> json) => DeviceData(
        name: (json["brand"] + " " + json["model"]).toString().trim(),
        brand: json["brand"],
        model: json["model"],
        width: json["width"],
        height: json["height"],
        physicalSize: json["physicalSize"]?.toDouble(),
        devicePixelRatio: json["devicePixelRatio"].toDouble(),
        aspectRatio: json["width"] / json["height"],
        dpi: (json["physicalSize"] != null)
            ? (sqrt(json["width"] * json["width"] +
                        json["height"] * json["height"]) /
                    json["physicalSize"])
                .round()
            : null,
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "brand": brand,
        "model": model,
        "width": width,
        "height": height,
        "physicalSize": physicalSize,
        "devicePixelRatio": devicePixelRatio,
        "aspectRatio": aspectRatio,
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
    r'[{"brand":"iPhone","model":"11 Pro Max","width":1242,"height":2688,"physicalSize":6.5,"devicePixelRatio":3},{"brand":"iPhone","model":"11 Pro","width":1125,"height":2436,"physicalSize":5.8,"devicePixelRatio":3},{"brand":"iPhone","model":"11","width":828,"height":1792,"physicalSize":6.1,"devicePixelRatio":2},{"brand":"iPhone","model":"XS Max","width":1242,"height":2688,"physicalSize":6.5,"devicePixelRatio":3},{"brand":"iPhone","model":"XS","width":1125,"height":2436,"physicalSize":5.8,"devicePixelRatio":3},{"brand":"iPhone","model":"XR","width":828,"height":1792,"physicalSize":6.1,"devicePixelRatio":2},{"brand":"iPhone","model":"X","width":1125,"height":2436,"physicalSize":5.8,"devicePixelRatio":3},{"brand":"iPhone","model":"8 Plus","width":1080,"height":1920,"physicalSize":5.5,"devicePixelRatio":3},{"brand":"iPhone","model":"8","width":750,"height":1334,"physicalSize":4.7,"devicePixelRatio":2},{"brand":"Pixel","model":"4 XL","width":1440,"height":3040,"physicalSize":6.3,"devicePixelRatio":3.5},{"brand":"Pixel","model":"4","width":1080,"height":2280,"physicalSize":5.7,"devicePixelRatio":2.625},{"brand":"Pixel","model":"3a XL","width":1080,"height":2160,"physicalSize":6,"devicePixelRatio":2.625},{"brand":"Pixel","model":"3a","width":1080,"height":2220,"physicalSize":5.6,"devicePixelRatio":2.625},{"brand":"Pixel","model":"3 XL","width":1440,"height":2960,"physicalSize":6.3,"devicePixelRatio":3.5},{"brand":"Pixel","model":"3","width":1080,"height":2160,"physicalSize":5.5,"devicePixelRatio":2.625},{"brand":"Samsung","model":"Note 10+","width":1440,"height":3040,"physicalSize":6.8,"devicePixelRatio":3.5},{"brand":"Samsung","model":"Note 10","width":1080,"height":2280,"physicalSize":6.3,"devicePixelRatio":2.625},{"brand":"Samsung","model":"S10+","width":1440,"height":3040,"physicalSize":6.4,"devicePixelRatio":3.5},{"brand":"Samsung","model":"S10","width":1440,"height":3040,"physicalSize":6.1,"devicePixelRatio":4},{"brand":"Samsung","model":"S9+","width":1440,"height":2960,"physicalSize":6.2,"devicePixelRatio":4},{"brand":"Samsung","model":"S9","width":1440,"height":2960,"physicalSize":6.4,"devicePixelRatio":3.5},{"brand":"Pro Display","model":"XDR","width":6016,"height":3384,"physicalSize":32,"devicePixelRatio":1},{"brand":"iMac","model":"5K","width":5120,"height":2880,"physicalSize":27,"devicePixelRatio":1},{"brand":"","model":"8K","width":7680,"height":4320,"physicalSize":null,"devicePixelRatio":1},{"brand":"","model":"4K","width":3840,"height":2160,"physicalSize":null,"devicePixelRatio":1},{"brand":"","model":"QHD","width":2560,"height":1440,"physicalSize":null,"devicePixelRatio":1},{"brand":"","model":"HD","width":1920,"height":1080,"physicalSize":null,"devicePixelRatio":1},{"brand":"","model":"720p","width":1280,"height":720,"physicalSize":null,"devicePixelRatio":1},{"brand":"","model":"480p","width":480,"height":360,"physicalSize":null,"devicePixelRatio":1},{"brand":"iPad","model":"Pro 12.9\"","width":2048,"height":2732,"physicalSize":12.9,"devicePixelRatio":2},{"brand":"iPad","model":"Pro 11\"","width":1668,"height":2388,"physicalSize":11,"devicePixelRatio":2},{"brand":"iPad","model":"Air","width":1668,"height":2224,"physicalSize":10.5,"devicePixelRatio":2},{"brand":"iPad","model":"","width":1620,"height":2160,"physicalSize":10.2,"devicePixelRatio":2}]';
