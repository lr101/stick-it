// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'no_user_group_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NoUserGroupService)
const noUserGroupServiceProvider = NoUserGroupServiceFamily._();

final class NoUserGroupServiceProvider
    extends $AsyncNotifierProvider<NoUserGroupService, LocalGroupDto> {
  const NoUserGroupServiceProvider._({
    required NoUserGroupServiceFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'noUserGroupServiceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$noUserGroupServiceHash();

  @override
  String toString() {
    return r'noUserGroupServiceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  NoUserGroupService create() => NoUserGroupService();

  @override
  bool operator ==(Object other) {
    return other is NoUserGroupServiceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$noUserGroupServiceHash() =>
    r'9b08715e8473568f27c005679f79ab49fbdfed2f';

final class NoUserGroupServiceFamily extends $Family
    with
        $ClassFamilyOverride<
          NoUserGroupService,
          AsyncValue<LocalGroupDto>,
          LocalGroupDto,
          FutureOr<LocalGroupDto>,
          String
        > {
  const NoUserGroupServiceFamily._()
    : super(
        retry: null,
        name: r'noUserGroupServiceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  NoUserGroupServiceProvider call(String groupId) =>
      NoUserGroupServiceProvider._(argument: groupId, from: this);

  @override
  String toString() => r'noUserGroupServiceProvider';
}

abstract class _$NoUserGroupService extends $AsyncNotifier<LocalGroupDto> {
  late final _$args = ref.$arg as String;
  String get groupId => _$args;

  FutureOr<LocalGroupDto> build(String groupId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<LocalGroupDto>, LocalGroupDto>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<LocalGroupDto>, LocalGroupDto>,
              AsyncValue<LocalGroupDto>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
