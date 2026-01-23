// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Delivery _$DeliveryFromJson(Map<String, dynamic> json) => _Delivery(
  id: (json['id'] as num).toInt(),
  reference: json['reference'] as String,
  pharmacyName: json['pharmacy_name'] as String,
  pharmacyAddress: json['pharmacy_address'] as String,
  pharmacyPhone: json['pharmacy_phone'] as String?,
  customerName: json['customer_name'] as String,
  customerPhone: json['customer_phone'] as String?,
  deliveryAddress: json['delivery_address'] as String,
  pharmacyLat: (json['pharmacy_latitude'] as num?)?.toDouble(),
  pharmacyLng: (json['pharmacy_longitude'] as num?)?.toDouble(),
  deliveryLat: (json['delivery_latitude'] as num?)?.toDouble(),
  deliveryLng: (json['delivery_longitude'] as num?)?.toDouble(),
  totalAmount: (json['total_amount'] as num).toDouble(),
  deliveryFee: (json['delivery_fee'] as num?)?.toDouble(),
  commission: (json['commission'] as num?)?.toDouble(),
  estimatedEarnings: (json['estimated_earnings'] as num?)?.toDouble(),
  distanceKm: (json['distance_km'] as num?)?.toDouble(),
  status: json['status'] as String,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$DeliveryToJson(_Delivery instance) => <String, dynamic>{
  'id': instance.id,
  'reference': instance.reference,
  'pharmacy_name': instance.pharmacyName,
  'pharmacy_address': instance.pharmacyAddress,
  'pharmacy_phone': instance.pharmacyPhone,
  'customer_name': instance.customerName,
  'customer_phone': instance.customerPhone,
  'delivery_address': instance.deliveryAddress,
  'pharmacy_latitude': instance.pharmacyLat,
  'pharmacy_longitude': instance.pharmacyLng,
  'delivery_latitude': instance.deliveryLat,
  'delivery_longitude': instance.deliveryLng,
  'total_amount': instance.totalAmount,
  'delivery_fee': instance.deliveryFee,
  'commission': instance.commission,
  'estimated_earnings': instance.estimatedEarnings,
  'distance_km': instance.distanceKm,
  'status': instance.status,
  'created_at': instance.createdAt,
};
