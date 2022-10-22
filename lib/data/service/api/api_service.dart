import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class ApiService {
  static final ApiService _instance = ApiService.init();
  static ApiService get instance => _instance;
  ApiService.init();

  final _dio = Dio();

  Future<String> downloadFile(
      {required String url, required String name}) async {
    try {
      final appStorage = await getApplicationDocumentsDirectory();
      File file = File("${appStorage.path}/$name");
      Response response = await _dio.get(
        url,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ),
      );
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file.path;
    } catch (e) {
      throw Exception(e);
    }
  }
}
