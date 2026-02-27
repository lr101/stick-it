
import 'package:buff_lisa/data/entity/member_entity.dart';
import 'package:buff_lisa/data/repository/isar_repo.dart';
import 'package:buff_lisa/util/core/cache_api.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:buff_lisa/util/core/in_memory_cache_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'member_repository.g.dart';


abstract class IMemberRepository implements CacheApi<MembersEntity> {}

class MemberRepository extends CacheImpl<MembersEntity> implements IMemberRepository {

  MemberRepository({required super.box, required super.isar, super.maxItems, super.ttlDuration = const Duration(days: 1)});

}

class MemberRepositoryWeb extends InMemoryCache<MembersEntity> implements IMemberRepository {
  MemberRepositoryWeb();
}

@Riverpod(keepAlive: true)
IMemberRepository memberRepository(Ref ref) {
  if (kIsWeb) {
    return MemberRepositoryWeb();
  } else {
    final isar = ref.watch(isarRepoProvider);
    return MemberRepository(isar: isar, box: isar.membersEntitys);
  }
} 
