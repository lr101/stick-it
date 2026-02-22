
import 'package:buff_lisa/data/entity/member_entity.dart';
import 'package:buff_lisa/data/repository/isar_repo.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'member_repository.g.dart';

class MemberRepository extends CacheImpl<MembersEntity> {

  MemberRepository({required super.box, required super.isar, super.maxItems, super.ttlDuration = const Duration(days: 1)});

}

@Riverpod(keepAlive: true)
MemberRepository memberRepository(Ref ref) {
  final isar = ref.watch(isarRepoProvider);
  return MemberRepository(isar: isar, box: isar.membersEntitys);
} 
