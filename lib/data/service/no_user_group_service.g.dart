// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'no_user_group_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$noUserGroupServiceHash() =>
    r'442ea5a77d28cea58ac2c837b485fc58e050d7be';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$NoUserGroupService
    extends BuildlessAsyncNotifier<LocalGroupDto> {
  late final String groupId;

  FutureOr<LocalGroupDto> build(
    String groupId,
  );
}

/// See also [NoUserGroupService].
@ProviderFor(NoUserGroupService)
const noUserGroupServiceProvider = NoUserGroupServiceFamily();

/// See also [NoUserGroupService].
class NoUserGroupServiceFamily extends Family<AsyncValue<LocalGroupDto>> {
  /// See also [NoUserGroupService].
  const NoUserGroupServiceFamily();

  /// See also [NoUserGroupService].
  NoUserGroupServiceProvider call(
    String groupId,
  ) {
    return NoUserGroupServiceProvider(
      groupId,
    );
  }

  @override
  NoUserGroupServiceProvider getProviderOverride(
    covariant NoUserGroupServiceProvider provider,
  ) {
    return call(
      provider.groupId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'noUserGroupServiceProvider';
}

/// See also [NoUserGroupService].
class NoUserGroupServiceProvider
    extends AsyncNotifierProviderImpl<NoUserGroupService, LocalGroupDto> {
  /// See also [NoUserGroupService].
  NoUserGroupServiceProvider(
    String groupId,
  ) : this._internal(
          () => NoUserGroupService()..groupId = groupId,
          from: noUserGroupServiceProvider,
          name: r'noUserGroupServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$noUserGroupServiceHash,
          dependencies: NoUserGroupServiceFamily._dependencies,
          allTransitiveDependencies:
              NoUserGroupServiceFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  NoUserGroupServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.groupId,
  }) : super.internal();

  final String groupId;

  @override
  FutureOr<LocalGroupDto> runNotifierBuild(
    covariant NoUserGroupService notifier,
  ) {
    return notifier.build(
      groupId,
    );
  }

  @override
  Override overrideWith(NoUserGroupService Function() create) {
    return ProviderOverride(
      origin: this,
      override: NoUserGroupServiceProvider._internal(
        () => create()..groupId = groupId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        groupId: groupId,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<NoUserGroupService, LocalGroupDto>
      createElement() {
    return _NoUserGroupServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NoUserGroupServiceProvider && other.groupId == groupId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, groupId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NoUserGroupServiceRef on AsyncNotifierProviderRef<LocalGroupDto> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _NoUserGroupServiceProviderElement
    extends AsyncNotifierProviderElement<NoUserGroupService, LocalGroupDto>
    with NoUserGroupServiceRef {
  _NoUserGroupServiceProviderElement(super.provider);

  @override
  String get groupId => (origin as NoUserGroupServiceProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
