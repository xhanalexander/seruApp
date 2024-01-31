import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:seruapp/models/provinsi_model.dart';

class WilayahIndonesiaAPI {
  final apiUrls = dotenv.env['WEBS'];
  final Dio fetch = Dio();

  Future<List<dynamic>> getProvinsi() async {
    try {
      final response = await fetch.get('$apiUrls/provinces.json');
      final datas = response.data as Map<String, dynamic>;
      final list = datas.entries.map((e) => Provinsi.fromJson(e.value)).toList();
      debugPrint('list: $list');
      return list;
    } catch (e) {
      rethrow;
    }
  }
  
}