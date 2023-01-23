import 'package:dio/dio.dart';
import 'package:holy_quran/constants.dart';

class DioHelper {
  late Dio dio;
 DioHelper(){
  BaseOptions options=BaseOptions(
    baseUrl: baseUrl,
    receiveDataWhenStatusError: true
  );
  dio=Dio(options);
 }

Future<List<dynamic>> getAllSurah()async{
  try {
    Response response=await dio.get("surah");
   // print(response.data["data"]);
    return response.data['data'];

  } catch (e) {
    print(e.toString());
    return [];
    
  }
}
Future<List<dynamic>> getAllAyah({required int number})async{
  try {
    Response response=await dio.get("surah/$number");
   // print(response.data["data"]);
    return response.data['data']['ayahs'];

  } catch (e) {
    print(e.toString());
    return [];
    
  }
}
}
