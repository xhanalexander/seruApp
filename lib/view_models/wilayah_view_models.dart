import 'package:flutter/material.dart';
import 'package:seruapp/models/api/wilayah_api.dart';
import 'package:seruapp/models/kecamatan_model.dart';
import 'package:seruapp/models/kota_model.dart';
import 'package:seruapp/models/provinsi_model.dart';

enum DataState {
  loading,
  loaded,
  error,
}

class WilayahViewModels with ChangeNotifier {
  List<Provinsi> _provinsi = [];
  List<Kota> _kota = [];
  List<Kecamatan> _kecamatan = [];

  List<Provinsi> get provinsi => _provinsi;
  List<Kota> get kota => _kota;
  List<Kecamatan> get kecamatan => _kecamatan;

  DataState _state = DataState.loading;
  DataState get state => _state;

  Future<void> getProvinsis() async {
    try {
      _state = DataState.loading;
      notifyListeners();
      
      _provinsi = await IndonesiaAreaAPI().getProvinsi();
      _state = DataState.loaded;
      notifyListeners();
    } catch (e) {
      debugPrint('error: $e');
      throw Exception('Error: $e');
    }
  }

  Future<void> getKotas(String id) async {
    try {
      _state = DataState.loading;
      notifyListeners();
      
      _kota = await IndonesiaAreaAPI().getKota(id);
      _state = DataState.loaded;
      notifyListeners();
    } catch (e) {
      debugPrint('error: $e');
      throw Exception('Error: $e');
    }
  }
  
  Future<void> getKecamatans(String id) async {
    try {
      _state = DataState.loading;
      notifyListeners();
      
      _kecamatan = await IndonesiaAreaAPI().getKecamatan(id);
      _state = DataState.loaded;
      notifyListeners();
    } catch (e) {
      debugPrint('error: $e');
      throw Exception('Error: $e');
    }
  }
  
}