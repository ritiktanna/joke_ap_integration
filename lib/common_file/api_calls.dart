import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:joke_app/models/joke_model.dart';

class ApiCalls {
  late Dio _dio;
  ApiCalls() {
    _dio = Dio();
  }

  Future<Either<String, JokeModel>> getJokeList() async {
    try {
      final response = await _dio.get(
        'https://v2.jokeapi.dev/joke/Any?type=single',
      );
      if (response.statusCode == 200) {
        return Right(JokeModel.fromJson(response.data));
      } else {
        return Left(response.statusMessage ?? 'Something went Wrong');
      }
    } catch (e) {
      return const Left('Something Went Wrong');
    }
  }
}
