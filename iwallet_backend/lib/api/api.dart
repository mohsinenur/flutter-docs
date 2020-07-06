import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:iwalletapp/helper/device_info.dart';

class CallApi {
  final String _url = 'https://65ae3297acc1.ngrok.io/api/v1/';
  Dio dio = Dio();
  var deviceId = DeviceInfo().findDeviceId();

  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;

    return await dio.post(
      fullUrl,
      data: data,
      options: Options(
        headers: _setHeaders(),
      ),
    );
  }

  getData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;

    return await http.get(
      fullUrl,
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'device-id': deviceId,
      };
}