import 'package:device_id/device_id.dart';

class DeviceInfo {
  Future<String> findDeviceId() async {
    String _deviceid;

    _deviceid = await DeviceId.getID;
    return _deviceid;
  }
}
