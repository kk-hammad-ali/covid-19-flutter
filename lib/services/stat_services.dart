import 'dart:convert';

import 'package:covid_19/model/all_countries_model.dart';
import 'package:covid_19/services/utilites/app_urls.dart';
import 'package:http/http.dart' as http;

class StatServices{
  Future<AllCountriesModel> getWorldStats()async {
    final response = await http.get(Uri.parse(AppUrl.worldStatApi));
    var data = jsonDecode(response.body);
    if(response.statusCode == 200){
      return AllCountriesModel.fromJson(data);
    } 
    else{
      throw Exception('Errors');
    }
  }
}