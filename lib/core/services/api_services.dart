import 'package:dio/dio.dart';
import 'package:movie_hub/core/data/errors/exceptions.dart';
import 'package:movie_hub/core/data/network/network_connection.dart';

abstract class IApiService {
  Future<Response> getData(String endpoint);
}

class ApiService implements IApiService {
  ApiService(
    this.dio,
    this.networkConnection,
  );
  final Dio dio;
  final NetworkConnection networkConnection;

  @override
  Future<Response> getData(String endpoint) async {
    final bool isConnected = await networkConnection.isConnected();
    if (isConnected) {
      final response = await dio.get(endpoint);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw ServerException();
      }
    } else {
      throw NoInternetException();
    }
  }
}
