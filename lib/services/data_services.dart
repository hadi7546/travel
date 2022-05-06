import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:travel/utility/strings.dart';
import '../models/data_models.dart';

class DataServices {
  Future<List<DataModel>> getInfo() async {
    http.Response res = await http.get(
      Uri.parse(AppUrls.baseUrl + "/" + AppUrls.api + "/"+ApiUrls.getPlaces),
    );
    if (res.statusCode == 200) {
      List<dynamic> list = json.decode(res.body);
      print(list);
      return list.map((e) => DataModel.fromJson(e)).toList();
    } else {
      return <DataModel>[];
    }
  }
}
