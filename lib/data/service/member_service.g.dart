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
    extends $AsyncNotifierProvider<MemberService, List<MemberDto>> {
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

String _$memberServiceHash() => r'35a9991be1170204ddba2d34239967b23307e751';

final class MemberServiceFamily extends $Family
    with
        $ClassFamilyOverride<
          MemberService,
          AsyncValue<List<MemberDto>>,
          List<MemberDto>,
          FutureOr<List<MemberDto>>,
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

abstract class _$MemberService extends $AsyncNotifier<List<MemberDto>> {
  late final _$args = ref.$arg as String;
  String get groupId => _$args;

  FutureOr<List<MemberDto>> build(String groupId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<List<MemberDto>>, List<MemberDto>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<MemberDto>>, List<MemberDto>>,
              AsyncValue<List<MemberDto>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
