// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'courier_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CourierProfile _$CourierProfileFromJson(Map<String, dynamic> json) =>
    _CourierProfile(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
      status: json['status'] as String,
      vehicleType: json['vehicle_type'] as String,
      plateNumber: json['plate_number'] as String? ?? '',
      rating: (json['rating'] as num).toDouble(),
      completedDeliveries: (json['completed_deliveries'] as num).toInt(),
      earnings: (json['earnings'] as num).toDouble(),
    );

Map<String, dynamic> _$CourierProfileToJson(_CourierProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'status': instance.status,
      'vehicle_type': instance.vehicleType,
      'plate_number': instance.plateNumber,
      'rating': instance.rating,
      'completed_deliveries': instance.completedDeliveries,
      'earnings': instance.earnings,
    };
