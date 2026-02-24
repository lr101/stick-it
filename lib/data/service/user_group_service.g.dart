// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_group_service.dart';

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

@ProviderFor(groupById)
const groupByIdProvider = GroupByIdFamily._();

final class GroupByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<GroupEntity?>,
          GroupEntity?,
          Stream<GroupEntity?>
        >
    with $FutureModifier<GroupEntity?>, $StreamProvider<GroupEntity?> {
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
  $StreamProviderElement<GroupEntity?> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<GroupEntity?> create(Ref ref) {
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

String _$groupByIdHash() => r'9904c8cf7fbc805cfb2f549d18071e98ae4315dd';

final class GroupByIdFamily extends $Family
    with $FunctionalFamilyOverride<Stream<GroupEntity?>, String> {
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

String _$userGroupServiceHash() => r'fdb24760cb783beed089765cfd37a27de709ba0f';

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
          AsyncValue<GroupEntity?>,
          GroupEntity?,
          FutureOr<GroupEntity?>
        >
    with $FutureModifier<GroupEntity?>, $FutureProvider<GroupEntity?> {
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
  $FutureProviderElement<GroupEntity?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<GroupEntity?> create(Ref ref) {
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
    r'dfe30fd9b45c5bbc5217042aca4496fd430587a2';

final class GroupByIdWithoutStateFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<GroupEntity?>, String> {
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
