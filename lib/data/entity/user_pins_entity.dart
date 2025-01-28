
import 'package:buff_lisa/data/entity/cache_entity.dart';
import 'package:buff_lisa/data/entity/pin_entity.dart';
import 'package:hive/hive.dart';

part 'user_pins_entity.g.dart';

@HiveType(typeId: 9)
class UserPinsEntity extends CacheEntity {

  @HiveField(3)
  List<PinEntity> pins = [];

  UserPinsEntity({required this.pins, super.keepAlive = false, super.hits, super.ttl});



  @override
  CacheEntity copyWith({DateTime? ttl, int? hits, bool? keepAlive}) {
    return UserPinsEntity(
      pins: pins,
      ttl: ttl ?? this.ttl,
      hits: hits ?? this.hits,
      keepAlive: keepAlive ?? this.keepAlive,
    );
  }

}
