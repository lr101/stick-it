
import 'package:buff_lisa/data/entity/member_entity.dart';
import 'package:buff_lisa/util/core/cache_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'member_repository.g.dart';

class MemberRepository extends CacheImpl<MembersEntity> {

  MemberRepository(): super("membersRepository", ttlDuration: Duration(days: 1));

}

@Riverpod(keepAlive: true)
MemberRepository memberRepository(Ref ref) => MemberRepository();