import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/api_constants.dart';
import '../../core/network/api_client.dart';
import '../models/wallet_data.dart';

final walletRepositoryProvider = Provider<WalletRepository>((ref) {
  return WalletRepository(ref.read(dioProvider));
});

class WalletRepository {
  final Dio _dio;

  WalletRepository(this._dio);

  /// Récupérer les données du wallet (solde, transactions, stats)
  Future<WalletData> getWalletData() async {
    try {
      final response = await _dio.get(ApiConstants.wallet);
      return WalletData.fromJson(response.data['data']);
    } catch (e) {
      if (e is DioException) {
        final statusCode = e.response?.statusCode;
        final message = e.response?.data['message'];
        
        if (statusCode == 403) {
          throw Exception(message ?? 'Profil coursier non trouvé. Veuillez vous connecter avec un compte livreur.');
        } else if (statusCode == 401) {
          throw Exception('Session expirée. Veuillez vous reconnecter.');
        } else if (message != null) {
          throw Exception(message);
        }
      }
      throw Exception('Impossible de charger les données du portefeuille.');
    }
  }

  /// Vérifier si le coursier peut effectuer une livraison
  Future<Map<String, dynamic>> canDeliver() async {
    try {
      final response = await _dio.get(ApiConstants.walletCanDeliver);
      return response.data['data'];
    } catch (e) {
      if (e is DioException && e.response?.statusCode == 403) {
        throw Exception(e.response?.data['message'] ?? 'Profil coursier non trouvé.');
      }
      throw Exception('Impossible de vérifier l\'éligibilité aux livraisons.');
    }
  }

  /// Recharger le wallet
  Future<Map<String, dynamic>> topUp({
    required double amount,
    required String paymentMethod,
    String? paymentReference,
  }) async {
    try {
      final response = await _dio.post(ApiConstants.walletTopUp, data: {
        'amount': amount,
        'payment_method': paymentMethod,
        'payment_reference': paymentReference,
      });
      return response.data['data'];
    } catch (e) {
      if (e is DioException) {
        throw Exception(e.response?.data['message'] ?? 'Erreur lors du rechargement');
      }
      throw Exception('Failed to top up: $e');
    }
  }

  /// Demander un retrait vers Mobile Money
  Future<Map<String, dynamic>> requestPayout({
    required double amount,
    required String paymentMethod,
    required String phoneNumber,
  }) async {
    try {
      final response = await _dio.post(ApiConstants.walletWithdraw, data: {
        'amount': amount,
        'payment_method': paymentMethod,
        'phone_number': phoneNumber,
      });
      return response.data['data'];
    } catch (e) {
      if (e is DioException) {
        throw Exception(e.response?.data['message'] ?? 'Erreur lors de la demande de retrait');
      }
      throw Exception('Failed to request payout: $e');
    }
  }

  /// Récupérer l'historique détaillé des gains avec filtres
  /// [period]: 'all', 'today', 'week', 'month'
  /// [category]: 'all', 'delivery', 'commission', 'bonus', 'deduction', 'topup', 'withdrawal'
  Future<Map<String, dynamic>> getEarningsHistory({
    String period = 'all',
    String category = 'all',
    int page = 1,
    int limit = 30,
  }) async {
    try {
      final response = await _dio.get(
        ApiConstants.walletEarningsHistory,
        queryParameters: {
          'period': period,
          'category': category,
          'page': page,
          'limit': limit,
        },
      );
      return response.data['data'];
    } catch (e) {
      if (e is DioException) {
        throw Exception(e.response?.data['message'] ?? 'Erreur lors de la récupération de l\'historique');
      }
      throw Exception('Failed to fetch earnings history: $e');
    }
  }
}
