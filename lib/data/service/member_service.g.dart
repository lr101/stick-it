// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MemberService)
const memberServiceProvider = MemberServiceFamily._();

final class MemberServiceProvider
    extends $StreamNotifierProvider<MemberService, List<MemberEntity>> {
  const MemberServiceProvider._({
    required MemberServiceFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'memberServiceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$memberServiceHash();

  @override
  String toString() {
    return r'memberServiceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MemberService create() => MemberService();

  @override
  bool operator ==(Object other) {
    return other is MemberServiceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$memberServiceHash() => r'd88c7bdf0ffc03972129d21f18a6cc10c86d8ff5';

final class MemberServiceFamily extends $Family
    with
        $ClassFamilyOverride<
          MemberService,
          AsyncValue<List<MemberEntity>>,
          List<MemberEntity>,
          Stream<List<MemberEntity>>,
          String
        > {
  const MemberServiceFamily._()
    : super(
        retry: null,
        name: r'memberServiceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MemberServiceProvider call(String groupId) =>
      MemberServiceProvider._(argument: groupId, from: this);

  @override
  String toString() => r'memberServiceProvider';
}

abstract class _$MemberService extends $StreamNotifier<List<MemberEntity>> {
  late final _$args = ref.$arg as String;
  String get groupId => _$args;

  Stream<List<MemberEntity>> build(String groupId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref as $Ref<AsyncValue<List<MemberEntity>>, List<MemberEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<MemberEntity>>, List<MemberEntity>>,
              AsyncValue<List<MemberEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
