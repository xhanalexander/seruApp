import 'package:flutter/material.dart';
import 'package:seruapp/models/api/wilayah_api.dart';
import 'package:seruapp/models/provinsi_model.dart';

enum DataState {
  loading,
  loaded,
  error,
}

class ProvinsiViewModel with ChangeNotifier {
  List<Provinsi> _provinsi = [];

  List<Provinsi> get provinsi => _provinsi;

  DataState _state = DataState.loading;

  DataState get state => _state;

  Future<void> getProvinsi() async {
    try {
      _state = DataState.loading;
      notifyListeners();
      final response = await IndonesiaAreaAPI().getProvinsi();
      _provinsi = response;
      _state = DataState.loaded;
      notifyListeners();
    } catch (e) {
      _state = DataState.error;
      debugPrint('error: $e');
      throw Exception('Error: $e');
    }
  }

  
}