import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pox_globe/services/utilities/app_url.dart';

import '../models/WorldStatsModel.dart';

class StatServices {
  Future<WorldStatsModel> FetchWorldStats() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatsModel.fromJson(data);
    } else {
      throw Exception('error');
    }
  }
}
