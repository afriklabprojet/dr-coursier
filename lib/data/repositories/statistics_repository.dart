import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/api_constants.dart';
import '../../core/network/api_client.dart';
import '../models/statistics.dart';

final statisticsRepositoryProvider = Provider<StatisticsRepository>((ref) {
  return StatisticsRepository(ref.read(dioProvider));
});

class StatisticsRepository {
  final Dio _dio;

  StatisticsRepository(this._dio);

  Future<Statistics> getStatistics({String period = 'week'}) async {
    try {
      final response = await _dio.get(
        ApiConstants.statistics,
        queryParameters: {'period': period},
      );

      return Statistics.fromJson(response.data['data']);
    } catch (e) {
      throw Exception('Failed to fetch statistics: $e');
    }
  }
}
