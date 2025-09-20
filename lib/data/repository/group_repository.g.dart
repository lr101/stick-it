// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(groupRepository)
const groupRepositoryProvider = GroupRepositoryProvider._();

final class GroupRepositoryProvider
    extends
        $FunctionalProvider<GroupRepository, GroupRepository, GroupRepository>
    with $Provider<GroupRepository> {
  const GroupRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'groupRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$groupRepositoryHash();

  @$internal
  @override
  $ProviderElement<GroupRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GroupRepository create(Ref ref) {
    return groupRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GroupRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GroupRepository>(value),
    );
  }
}

String _$groupRepositoryHash() => r'51119577a6fb9b3cadc87be1bd741ef7955662de';

@ProviderFor(noUserGroupRepository)
const noUserGroupRepositoryProvider = NoUserGroupRepositoryProvider._();

final class NoUserGroupRepositoryProvider
    extends
        $FunctionalProvider<
          NoUserGroupRepository,
          NoUserGroupRepository,
          NoUserGroupRepository
        >
    with $Provider<NoUserGroupRepository> {
  const NoUserGroupRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'noUserGroupRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$noUserGroupRepositoryHash();

  @$internal
  @override
  $ProviderElement<NoUserGroupRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  NoUserGroupRepository create(Ref ref) {
    return noUserGroupRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NoUserGroupRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NoUserGroupRepository>(value),
    );
  }
}

String _$noUserGroupRepositoryHash() =>
    r'29f49486540c45e237de0692db29e0cd11b961fe';
