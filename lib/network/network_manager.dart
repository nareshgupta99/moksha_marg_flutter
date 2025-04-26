import 'dart:io';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:moksha_marg/app/profile/profile_controller.dart';
import 'package:moksha_marg/network/network_endpoint.dart';
import 'package:moksha_marg/network/network_exception.dart';
import 'package:moksha_marg/network/network_resources.dart';
import 'package:moksha_marg/util/custom_enum.dart';
import 'package:moksha_marg/util/global_constants.dart';
import 'package:moksha_marg/util/local_keys.dart';
import 'package:moksha_marg/util/local_storage.dart';

class NetworkManager extends GetxService {
  final int _timeoutInSeconds = 30;
  Map<String, String> _requestCurl = {};
  final _baseURL = GlobalConstants.baseUrl;

  void networkRequestCurlWith({String? token}) {
    _requestCurl = {
      'charset': 'UTF-8',
      'Charset': 'utf-8',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'ngrok-skip-browser-warning': 'true',
    };
    if (token != null) {
      _requestCurl.addAll({
        'Authorization': 'Bearer ${jsonDecode(token)}',
      });
    }
    final requestCurlTree =
        const JsonEncoder.withIndent('  ').convert(_requestCurl);
    print('Request curl :: $requestCurlTree');
  }

  Future<dynamic> loadHTTP(
      {required Endpoints endpoint,
      String? slashedQuery,
      required HTTPMethod method,
      Map<String, dynamic>? payload,
      Map<String, dynamic>? queryParameters,
      Map<String, String>? multipartPayload,
      List<MultipartFiles>? multipartFiles}) async {
    final url = slashedQuery != null
        ? Uri.parse(_baseURL + endpointRawValues[endpoint]! + slashedQuery)
            .replace(queryParameters: queryParameters)
        : Uri.parse(_baseURL + endpointRawValues[endpoint]!)
            .replace(queryParameters: queryParameters);
    print('Request url :: $url');
    print('Endpoint :: ${endpointRawValues[endpoint]!}');
    final bearerToken = await LocalStorage.getStringData(key: Keys.bearerToken);
    print('Bearer token :: ${bearerToken ?? 'Not Authorized'}');

    networkRequestCurlWith(token: bearerToken);

    final payloadTree = const JsonEncoder.withIndent('  ').convert(payload);
    if (payload != null) print('Payload :: $payloadTree');

    final multipartPayloadTree =
        const JsonEncoder.withIndent('  ').convert(multipartPayload);
    if (multipartPayload != null)
      print('Multipart Payload :: $multipartPayloadTree');

    dynamic jsonResponse;
    dynamic httpResponse;

    try {
      switch (method) {
        case (HTTPMethod.get):
          httpResponse = await http
              .get(url, headers: _requestCurl)
              .timeout(Duration(seconds: _timeoutInSeconds));
          break;
        case (HTTPMethod.post):
          httpResponse = await http
              .post(url, headers: _requestCurl, body: jsonEncode(payload))
              .timeout(Duration(seconds: _timeoutInSeconds));
          break;
        case (HTTPMethod.put):
          httpResponse = await http
              .put(url, headers: _requestCurl, body: jsonEncode(payload))
              .timeout(Duration(seconds: _timeoutInSeconds));
          break;
        case (HTTPMethod.delete):
          httpResponse = await http
              .delete(url, headers: _requestCurl, body: jsonEncode(payload))
              .timeout(Duration(seconds: _timeoutInSeconds));
          break;
        case (HTTPMethod.patch):
          httpResponse = await http
              .patch(url, headers: _requestCurl, body: jsonEncode(payload))
              .timeout(Duration(seconds: _timeoutInSeconds));
          break;
        case (HTTPMethod.multipartPUT):
          httpResponse = await httpMultipart(
              request: http.MultipartRequest('PUT', url),
              payload: multipartPayload,
              files: multipartFiles);
          break;
        case (HTTPMethod.multipartPOST):
          httpResponse = await httpMultipart(
              request: http.MultipartRequest('POST', url),
              payload: multipartPayload,
              files: multipartFiles);
          break;
      }
      jsonResponse = decodeHTTPResponseBody(
          httpResponse: httpResponse, endpoint: endpointRawValues[endpoint]!);
    } on SocketException {
      throw FetchNetworkException(
          exceptionRawValues[Exceptions.timedOutOrNoInternet]);
    }
    return jsonResponse;
  }

  Future<dynamic> httpMultipart(
      {required http.MultipartRequest request,
      Map<String, String>? payload,
      List<MultipartFiles>? files}) async {
    request.headers.addAll(_requestCurl);
    for (MultipartFiles file0 in (files ?? [])) {
      if (file0.file != null) {
        File file = File(file0.file!.path);
        request.files.add(http.MultipartFile(
            file0.key, file.readAsBytes().asStream(), file.lengthSync(),
            filename: file.path.split('/').last));
      }
    }
    if (payload != null) request.fields.addAll(payload);
    http.Response response =
        await http.Response.fromStream(await request.send())
            .timeout(Duration(seconds: _timeoutInSeconds));
    return response;
  }

  dynamic decodeHTTPResponseBody(
      {required http.Response httpResponse, required String endpoint}) {
    print('Status code for $endpoint :: ${httpResponse.statusCode}');
    switch (httpResponse.statusCode) {
      case (201):
      case (200):
        try {
          final responseJson = json.decode(httpResponse.body.toString());
          final responseTree =
              const JsonEncoder.withIndent('  ').convert(responseJson);
          print('Response for $endpoint :: $responseTree');
          return responseJson;
        } catch (_) {
          throw FetchNetworkException(
              exceptionRawValues[Exceptions.unPreocessableResponse]);
        }
      case (400):
        throw FetchNetworkException(
            exceptionRawValues[Exceptions.badRequest400]);
      case (401):
        // throw FetchNetworkException(
        //     exceptionRawValues[Exceptions.unauthorized401]);
        final body = httpResponse.body;
        final decoded = jsonDecode(body);
        final message = decoded['message'] ?? 'Unauthorized access';
        Get.snackbar("error", message);
      case (403):
        Get.find<ProfileController>().deleteAuth();
      // throw FetchNetworkException(
      //     exceptionRawValues[Exceptions.forbidden403]);
      case (404):
        final body = httpResponse.body;
        final decoded = jsonDecode(body);
        final message = decoded['message'] ?? 'Unauthorized access';
        Get.snackbar("error", message);
      // throw FetchNetworkException(
      //     exceptionRawValues[Exceptions.requestNotFound404]);
      case (405):
        throw FetchNetworkException(
            exceptionRawValues[Exceptions.methodNotAllowd405]);
      case (409):
        throw FetchNetworkException(
            exceptionRawValues[Exceptions.conflictInRequest409]);
      case (500):
        throw FetchNetworkException(
            exceptionRawValues[Exceptions.serverError500]);
      case (503):
        throw FetchNetworkException(
            exceptionRawValues[Exceptions.serviceUnavailable503]);
      default:
        throw FetchNetworkException(
            exceptionRawValues[Exceptions.unknownError000]);
    }
  }
}
