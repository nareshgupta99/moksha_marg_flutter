import 'dart:io';

class MultipartFiles {
  String key;
  File? file;
  MultipartFiles(this.key, this.file);
}

// abstract class NetworkRequest {
//   void networkRequestCurlWith({required String? bearerToken, required String? languageId});
//   dynamic decodeHTTPResponseBody({required http.Response httpResponse, required String endpoint});
//   Future<dynamic> httpMultipart({required http.MultipartRequest request, Map<String, String>? payload, List<MultipartFiles> files});
//   Future<dynamic> loadHTTP({required Endpoints endpoint, String? slashedQuery, required HTTPMethod method, Map<String, dynamic>? payload, Map<String, dynamic>? queryParameters, Map<String, String>? multipartPayload, List<MultipartFiles>? multipartFiles});
// }
