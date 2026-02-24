// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GroupService)
const groupServiceProvider = GroupServiceFamily._();

final class GroupServiceProvider
    extends $StreamNotifierProvider<GroupService, GroupEntity?> {
  const GroupServiceProvider._({
    required GroupServiceFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'groupServiceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$groupServiceHash();

  @override
  String toString() {
    return r'groupServiceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  GroupService create() => GroupService();

  @override
  bool operator ==(Object other) {
    return other is GroupServiceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$groupServiceHash() => r'759390bbb8bb6a8a4eda7e3accf565579006ce36';

final class GroupServiceFamily extends $Family
    with
        $ClassFamilyOverride<
          GroupService,
          AsyncValue<GroupEntity?>,
          GroupEntity?,
          Stream<GroupEntity?>,
          String
        > {
  const GroupServiceFamily._()
    : super(
        retry: null,
        name: r'groupServiceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GroupServiceProvider call(String groupId) =>
      GroupServiceProvider._(argument: groupId, from: this);

  @override
  String toString() => r'groupServiceProvider';
}

abstract class _$GroupService extends $StreamNotifier<GroupEntity?> {
  late final _$args = ref.$arg as String;
  String get groupId => _$args;

  Stream<GroupEntity?> build(String groupId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<GroupEntity?>, GroupEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<GroupEntity?>, GroupEntity?>,
              AsyncValue<GroupEntity?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(UserGroupService)
const userGroupServiceProvider = UserGroupServiceProvider._();

final class UserGroupServiceProvider
    extends $StreamNotifierProvider<UserGroupService, List<GroupEntity>> {
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

String _$userGroupServiceHash() => r'b2b17e5b6d9aa78e0bf57daa8a4396568ea1fbd0';

abstract class _$UserGroupService extends $StreamNotifier<List<GroupEntity>> {
  Stream<List<GroupEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<GroupEntity>>, List<GroupEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<GroupEntity>>, List<GroupEntity>>,
              AsyncValue<List<GroupEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(activeGroups)
const activeGroupsProvider = ActiveGroupsProvider._();

final class ActiveGroupsProvider
    extends
        $FunctionalProvider<
          AsyncValue<Set<GroupEntity>>,
          Set<GroupEntity>,
          FutureOr<Set<GroupEntity>>
        >
    with $FutureModifier<Set<GroupEntity>>, $FutureProvider<Set<GroupEntity>> {
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
  $FutureProviderElement<Set<GroupEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Set<GroupEntity>> create(Ref ref) {
    return activeGroups(ref);
  }
}

String _$activeGroupsHash() => r'e5d7ef886f3600d64c19bca0f8fc43746086e078';

@ProviderFor(orderedGroups)
const orderedGroupsProvider = OrderedGroupsProvider._();

final class OrderedGroupsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<GroupEntity>>,
          List<GroupEntity>,
          FutureOr<List<GroupEntity>>
        >
    with
        $FutureModifier<List<GroupEntity>>,
        $FutureProvider<List<GroupEntity>> {
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
  $FutureProviderElement<List<GroupEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<GroupEntity>> create(Ref ref) {
    return orderedGroups(ref);
  }
}

String _$orderedGroupsHash() => r'90a66bed9252066fc88c4fd459f456d72505c7ed';

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
    r'54a9a6471cfa0c997eed015d7c982a4e3934ac0a';

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
