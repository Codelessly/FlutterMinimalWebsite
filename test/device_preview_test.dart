import 'package:flutter_test/flutter_test.dart';
import 'package:minimal/device_data.dart';

void main() {
  test("DPI Calculation", () {
    DeviceDataRepository deviceDataRepository =
        DeviceDataRepository(deviceDataJson);
    deviceDataRepository.deviceDatas.forEach((element) {
      print(element.toJson().toString());
    });
  });
}
