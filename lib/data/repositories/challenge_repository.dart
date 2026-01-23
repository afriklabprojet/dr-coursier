import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/api_constants.dart';
import '../../core/network/api_client.dart';

final challengeRepositoryProvider = Provider<ChallengeRepository>((ref) {
  return ChallengeRepository(ref.read(dioProvider));
});

class ChallengeRepository {
  final Dio _dio;

  ChallengeRepository(this._dio);

  /// Récupérer les challenges et bonus actifs
  Future<Map<String, dynamic>> getChallenges() async {
    try {
      final response = await _dio.get(ApiConstants.challenges);
      return response.data['data'];
    } catch (e) {
      throw Exception('Failed to fetch challenges: $e');
    }
  }

  /// Réclamer la récompense d'un défi complété
  Future<Map<String, dynamic>> claimReward(int challengeId) async {
    try {
      final response = await _dio.post('${ApiConstants.challenges}/$challengeId/claim');
      return response.data['data'];
    } catch (e) {
      if (e is DioException) {
        throw Exception(e.response?.data['message'] ?? 'Erreur lors de la réclamation');
      }
      throw Exception('Failed to claim reward: $e');
    }
  }

  /// Récupérer les bonus actifs
  Future<List<Map<String, dynamic>>> getActiveBonuses() async {
    try {
      final response = await _dio.get(ApiConstants.bonuses);
      return (response.data['data'] as List).cast<Map<String, dynamic>>();
    } catch (e) {
      throw Exception('Failed to fetch bonuses: $e');
    }
  }

  /// Calculer le bonus potentiel pour une livraison
  Future<Map<String, dynamic>> calculateBonus(double baseEarnings) async {
    try {
      final response = await _dio.post(
        '${ApiConstants.bonuses}/calculate',
        data: {'base_earnings': baseEarnings},
      );
      return response.data['data'];
    } catch (e) {
      throw Exception('Failed to calculate bonus: $e');
    }
  }
}
