import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:seruapp/models/provinsi_model.dart';

class IndonesiaAreaAPI {
  final String apiUrls = dotenv.env['WEBS']!;
  final Dio fetch = Dio();

  Future<List<Provinsi>> getProvinsi() async {
    try {
      final response = await fetch.get('$apiUrls/provinces.json');
      final datas = response.data as Map<String, dynamic>;
      debugPrint('datas: $datas');
      // final list = datas.entries.map((e) => Provinsi.fromJson(e.value)).toList();
      // debugPrint('list: $list');
      return datas.entries.map((e) => Provinsi.fromJson(e.value)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<dynamic>> getKota(String id) async {
    try {
      final response = await fetch.get('$apiUrls/regencies/$id.json');
      final datas = response.data as Map<String, dynamic>;
      debugPrint('datas: $datas');
      // final list = datas.entries.map((e) => Provinsi.fromJson(e.value)).toList();
      // debugPrint('list: $list');
      return datas.entries.map((e) => Provinsi.fromJson(e.value)).toList();
    } catch (e) {
      rethrow;
    }
  }
  
}