import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:joke_app/models/joke_model.dart';

class HomeProvider with ChangeNotifier {
  List<JokeModel>? jokeList;
  bool isLoading = false;
  Dio? _dio;
  bool isThereAnyError = false;
  createDio() {
    _dio ??= Dio(BaseOptions(
      baseUrl: 'https://v2.jokeapi.dev/joke/Any?type=single&amount=10',
    ));
  }

  void getJoke() async {
    isLoading = true;
    isThereAnyError = false;
    notifyListeners();
    createDio();
    final response = await _dio?.get('');
    if (response?.statusCode == 200) {
      jokeList = (response?.data['jokes'] as List<dynamic>)
          .map(
            (data) => JokeModel.fromJson(data),
          )
          .toList();
    } else {
      isThereAnyError = true;
    }
    isLoading = false;
    notifyListeners();
  }
}
