// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_group_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(UserGroupService)
const userGroupServiceProvider = UserGroupServiceProvider._();

final class UserGroupServiceProvider
    extends $AsyncNotifierProvider<UserGroupService, Set<LocalGroupDto>> {
  const UserGroupServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userGroupServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userGroupServiceHash();

  @$internal
  @override
  UserGroupService create() => UserGroupService();
}

String _$userGroupServiceHash() => r'3a5513afbed3e557f4bfcc6221832c36acd84060';

abstract class _$UserGroupService extends $AsyncNotifier<Set<LocalGroupDto>> {
  FutureOr<Set<LocalGroupDto>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<Set<LocalGroupDto>>, Set<LocalGroupDto>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Set<LocalGroupDto>>, Set<LocalGroupDto>>,
              AsyncValue<Set<LocalGroupDto>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(groupById)
const groupByIdProvider = GroupByIdFamily._();

final class GroupByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<LocalGroupDto?>,
          LocalGroupDto?,
          FutureOr<LocalGroupDto?>
        >
    with $FutureModifier<LocalGroupDto?>, $FutureProvider<LocalGroupDto?> {
  const GroupByIdProvider._({
    required GroupByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'groupByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$groupByIdHash();

  @override
  String toString() {
    return r'groupByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<LocalGroupDto?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LocalGroupDto?> create(Ref ref) {
    final argument = this.argument as String;
    return groupById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$groupByIdHash() => r'8e8485b96fd0837f8c4dc719977ef2de91738583';

final class GroupByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<LocalGroupDto?>, String> {
  const GroupByIdFamily._()
    : super(
        retry: null,
        name: r'groupByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GroupByIdProvider call(String groupId) =>
      GroupByIdProvider._(argument: groupId, from: this);

  @override
  String toString() => r'groupByIdProvider';
}

@ProviderFor(activeGroups)
const activeGroupsProvider = ActiveGroupsProvider._();

final class ActiveGroupsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Set<LocalGroupDto>>,
          Set<LocalGroupDto>,
          FutureOr<Set<LocalGroupDto>>
        >
    with
        $FutureModifier<Set<LocalGroupDto>>,
        $FutureProvider<Set<LocalGroupDto>> {
  const ActiveGroupsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'activeGroupsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$activeGroupsHash();

  @$internal
  @override
  $FutureProviderElement<Set<LocalGroupDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Set<LocalGroupDto>> create(Ref ref) {
    return activeGroups(ref);
  }
}

String _$activeGroupsHash() => r'51791894bb2bc2701a868d5fde855c52b87dd383';

@ProviderFor(orderedGroups)
const orderedGroupsProvider = OrderedGroupsProvider._();

final class OrderedGroupsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<LocalGroupDto>>,
          List<LocalGroupDto>,
          FutureOr<List<LocalGroupDto>>
        >
    with
        $FutureModifier<List<LocalGroupDto>>,
        $FutureProvider<List<LocalGroupDto>> {
  const OrderedGroupsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'orderedGroupsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$orderedGroupsHash();

  @$internal
  @override
  $FutureProviderElement<List<LocalGroupDto>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<LocalGroupDto>> create(Ref ref) {
    return orderedGroups(ref);
  }
}

String _$orderedGroupsHash() => r'd6c9fb1bad23f80f667fc0677a6ae12626fe8a8d';

@ProviderFor(groupByIdActivated)
const groupByIdActivatedProvider = GroupByIdActivatedFamily._();

final class GroupByIdActivatedProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  const GroupByIdActivatedProvider._({
    required GroupByIdActivatedFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'groupByIdActivatedProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$groupByIdActivatedHash();

  @override
  String toString() {
    return r'groupByIdActivatedProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    final argument = this.argument as String;
    return groupByIdActivated(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupByIdActivatedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$groupByIdActivatedHash() =>
    r'da2fe9a4e5d68bed683918b0c3e9836fcaa0342a';

final class GroupByIdActivatedFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<bool>, String> {
  const GroupByIdActivatedFamily._()
    : super(
        retry: null,
        name: r'groupByIdActivatedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GroupByIdActivatedProvider call(String groupId) =>
      GroupByIdActivatedProvider._(argument: groupId, from: this);

  @override
  String toString() => r'groupByIdActivatedProvider';
}

@ProviderFor(groupByIdWithoutState)
const groupByIdWithoutStateProvider = GroupByIdWithoutStateFamily._();

final class GroupByIdWithoutStateProvider
    extends
        $FunctionalProvider<
          AsyncValue<LocalGroupDto>,
          LocalGroupDto,
          FutureOr<LocalGroupDto>
        >
    with $FutureModifier<LocalGroupDto>, $FutureProvider<LocalGroupDto> {
  const GroupByIdWithoutStateProvider._({
    required GroupByIdWithoutStateFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'groupByIdWithoutStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$groupByIdWithoutStateHash();

  @override
  String toString() {
    return r'groupByIdWithoutStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<LocalGroupDto> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<LocalGroupDto> create(Ref ref) {
    final argument = this.argument as String;
    return groupByIdWithoutState(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupByIdWithoutStateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$groupByIdWithoutStateHash() =>
    r'8dbd0d6024cc1243e0e5637c99a058c7a3d0afdc';

final class GroupByIdWithoutStateFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<LocalGroupDto>, String> {
  const GroupByIdWithoutStateFamily._()
    : super(
        retry: null,
        name: r'groupByIdWithoutStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GroupByIdWithoutStateProvider call(String groupId) =>
      GroupByIdWithoutStateProvider._(argument: groupId, from: this);

  @override
  String toString() => r'groupByIdWithoutStateProvider';
}
