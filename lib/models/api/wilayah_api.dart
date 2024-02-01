import 'package:dio/dio.dart';
import 'package:seruapp/constant/const.dart';
import 'package:seruapp/models/kota_model.dart';
import 'package:seruapp/models/kecamatan_model.dart';
import 'package:seruapp/models/provinsi_model.dart';

class IndonesiaAreaAPI {
  final Dio dios = Dio();
  final urls = ConstValue().webApis;

  Future<List<Provinsi>> getProvinsi() async {
    try {
      final response = await dios.get('${urls}provinces.json');
      final result = response.data as List<dynamic>;
      final list = result.map((e) => Provinsi.fromJson(e)).toList();
      return list;
    } catch (e) {
      throw Exception('not Founds: $e');
    }
  }

  Future<List<Kota>> getKota(String id) async {
    try {
      final response = await dios.get('${urls}regencies/$id.json');
      final result = response.data as List<dynamic>;
      final list = result.map((e) => Kota.fromJson(e)).toList();
      return list;
    } catch (e) {
      throw Exception('not Founds: $e');
    }
  }

  Future<List<Kecamatan>> getKecamatan(String id) async {
    try {
      final response = await dios.get('${urls}districts/$id.json');
      final result = response.data as List<dynamic>;
      final list = result.map((e) => Kecamatan.fromJson(e)).toList();
      return list;
    } catch (e) {
      throw Exception('not Founds: $e');
    }
  }
}