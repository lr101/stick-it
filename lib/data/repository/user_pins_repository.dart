
import 'package:buff_lisa/data/entity/user_pins_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../util/core/cache_impl.dart';

part 'user_pins_repository.g.dart';

class UserPinsRepository extends CacheImpl<UserPinsEntity> {

  UserPinsRepository(): super("userPinsRepository", ttlDuration: Duration(minutes: 10));

}

@Riverpod(keepAlive: true)
UserPinsRepository userPinsRepository(Ref ref) => UserPinsRepository();