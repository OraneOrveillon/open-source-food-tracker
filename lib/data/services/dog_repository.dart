import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../models/dog_model.dart';

abstract class DogRepository {
  static const String uri = "https://dog.ceo/api/breeds/image/random";

  static Future<Either<Exception, Dog>> fetchDog() async {
    final response = await GetHttpClient().get(uri);

    if (response.statusCode == 200) {
      return Right(Dog.fromJson(response.body));
    } else {
      return Left(Exception(response.statusText));
    }
  }
}
