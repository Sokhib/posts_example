import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApplicationState extends ChangeNotifier {
  String _dataUrl = "https://reqres.in/api/users?per_page=20";
  String _jsonResponse = "";
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    var response = await http.get(_dataUrl);

    if (response.statusCode == 200) {
      _jsonResponse = response.body;
    }
    _isLoading = false;
    notifyListeners();
  }

  List<dynamic> getResponseJson() {
    if (_jsonResponse.isNotEmpty) {
      Map<String, dynamic> json = jsonDecode(_jsonResponse);
      return json['data'];
    }
    return null;
  }
}
