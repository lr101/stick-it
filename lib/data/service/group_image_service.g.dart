// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_image_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$groupImageByIdHash() => r'744a07f7c58608c69635a320964cfd2182f89d90';

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

/// See also [groupImageById].
@ProviderFor(groupImageById)
const groupImageByIdProvider = GroupImageByIdFamily();

/// See also [groupImageById].
class GroupImageByIdFamily extends Family<AsyncValue<GroupImageDto?>> {
  /// See also [groupImageById].
  const GroupImageByIdFamily();

  /// See also [groupImageById].
  GroupImageByIdProvider call(
    String groupId,
  ) {
    return GroupImageByIdProvider(
      groupId,
    );
  }

  @override
  GroupImageByIdProvider getProviderOverride(
    covariant GroupImageByIdProvider provider,
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
  String? get name => r'groupImageByIdProvider';
}

/// See also [groupImageById].
class GroupImageByIdProvider extends AutoDisposeFutureProvider<GroupImageDto?> {
  /// See also [groupImageById].
  GroupImageByIdProvider(
    String groupId,
  ) : this._internal(
          (ref) => groupImageById(
            ref as GroupImageByIdRef,
            groupId,
          ),
          from: groupImageByIdProvider,
          name: r'groupImageByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupImageByIdHash,
          dependencies: GroupImageByIdFamily._dependencies,
          allTransitiveDependencies:
              GroupImageByIdFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  GroupImageByIdProvider._internal(
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
  Override overrideWith(
    FutureOr<GroupImageDto?> Function(GroupImageByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupImageByIdProvider._internal(
        (ref) => create(ref as GroupImageByIdRef),
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
  AutoDisposeFutureProviderElement<GroupImageDto?> createElement() {
    return _GroupImageByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupImageByIdProvider && other.groupId == groupId;
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
mixin GroupImageByIdRef on AutoDisposeFutureProviderRef<GroupImageDto?> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupImageByIdProviderElement
    extends AutoDisposeFutureProviderElement<GroupImageDto?>
    with GroupImageByIdRef {
  _GroupImageByIdProviderElement(super.provider);

  @override
  String get groupId => (origin as GroupImageByIdProvider).groupId;
}

String _$groupProfilePictureByIdHash() =>
    r'3103bedc4640bcacdffa8734bc2583dd69ddeb4e';

/// See also [groupProfilePictureById].
@ProviderFor(groupProfilePictureById)
const groupProfilePictureByIdProvider = GroupProfilePictureByIdFamily();

/// See also [groupProfilePictureById].
class GroupProfilePictureByIdFamily extends Family<AsyncValue<Uint8List?>> {
  /// See also [groupProfilePictureById].
  const GroupProfilePictureByIdFamily();

  /// See also [groupProfilePictureById].
  GroupProfilePictureByIdProvider call(
    String groupId,
  ) {
    return GroupProfilePictureByIdProvider(
      groupId,
    );
  }

  @override
  GroupProfilePictureByIdProvider getProviderOverride(
    covariant GroupProfilePictureByIdProvider provider,
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
  String? get name => r'groupProfilePictureByIdProvider';
}

/// See also [groupProfilePictureById].
class GroupProfilePictureByIdProvider
    extends AutoDisposeFutureProvider<Uint8List?> {
  /// See also [groupProfilePictureById].
  GroupProfilePictureByIdProvider(
    String groupId,
  ) : this._internal(
          (ref) => groupProfilePictureById(
            ref as GroupProfilePictureByIdRef,
            groupId,
          ),
          from: groupProfilePictureByIdProvider,
          name: r'groupProfilePictureByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupProfilePictureByIdHash,
          dependencies: GroupProfilePictureByIdFamily._dependencies,
          allTransitiveDependencies:
              GroupProfilePictureByIdFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  GroupProfilePictureByIdProvider._internal(
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
  Override overrideWith(
    FutureOr<Uint8List?> Function(GroupProfilePictureByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupProfilePictureByIdProvider._internal(
        (ref) => create(ref as GroupProfilePictureByIdRef),
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
  AutoDisposeFutureProviderElement<Uint8List?> createElement() {
    return _GroupProfilePictureByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupProfilePictureByIdProvider && other.groupId == groupId;
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
mixin GroupProfilePictureByIdRef on AutoDisposeFutureProviderRef<Uint8List?> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupProfilePictureByIdProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List?>
    with GroupProfilePictureByIdRef {
  _GroupProfilePictureByIdProviderElement(super.provider);

  @override
  String get groupId => (origin as GroupProfilePictureByIdProvider).groupId;
}

String _$groupProfilePictureSmallByIdHash() =>
    r'95e7e60a55115f08d89af5c5f1712090150a44e1';

/// See also [groupProfilePictureSmallById].
@ProviderFor(groupProfilePictureSmallById)
const groupProfilePictureSmallByIdProvider =
    GroupProfilePictureSmallByIdFamily();

/// See also [groupProfilePictureSmallById].
class GroupProfilePictureSmallByIdFamily
    extends Family<AsyncValue<Uint8List?>> {
  /// See also [groupProfilePictureSmallById].
  const GroupProfilePictureSmallByIdFamily();

  /// See also [groupProfilePictureSmallById].
  GroupProfilePictureSmallByIdProvider call(
    String groupId,
  ) {
    return GroupProfilePictureSmallByIdProvider(
      groupId,
    );
  }

  @override
  GroupProfilePictureSmallByIdProvider getProviderOverride(
    covariant GroupProfilePictureSmallByIdProvider provider,
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
  String? get name => r'groupProfilePictureSmallByIdProvider';
}

/// See also [groupProfilePictureSmallById].
class GroupProfilePictureSmallByIdProvider
    extends AutoDisposeFutureProvider<Uint8List?> {
  /// See also [groupProfilePictureSmallById].
  GroupProfilePictureSmallByIdProvider(
    String groupId,
  ) : this._internal(
          (ref) => groupProfilePictureSmallById(
            ref as GroupProfilePictureSmallByIdRef,
            groupId,
          ),
          from: groupProfilePictureSmallByIdProvider,
          name: r'groupProfilePictureSmallByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupProfilePictureSmallByIdHash,
          dependencies: GroupProfilePictureSmallByIdFamily._dependencies,
          allTransitiveDependencies:
              GroupProfilePictureSmallByIdFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  GroupProfilePictureSmallByIdProvider._internal(
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
  Override overrideWith(
    FutureOr<Uint8List?> Function(GroupProfilePictureSmallByIdRef provider)
        create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupProfilePictureSmallByIdProvider._internal(
        (ref) => create(ref as GroupProfilePictureSmallByIdRef),
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
  AutoDisposeFutureProviderElement<Uint8List?> createElement() {
    return _GroupProfilePictureSmallByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupProfilePictureSmallByIdProvider &&
        other.groupId == groupId;
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
mixin GroupProfilePictureSmallByIdRef
    on AutoDisposeFutureProviderRef<Uint8List?> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupProfilePictureSmallByIdProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List?>
    with GroupProfilePictureSmallByIdRef {
  _GroupProfilePictureSmallByIdProviderElement(super.provider);

  @override
  String get groupId =>
      (origin as GroupProfilePictureSmallByIdProvider).groupId;
}

String _$groupPinImageByIdHash() => r'f9cfeab4d6ce42d99dd1f0d82e2251a87a66d0d0';

/// See also [groupPinImageById].
@ProviderFor(groupPinImageById)
const groupPinImageByIdProvider = GroupPinImageByIdFamily();

/// See also [groupPinImageById].
class GroupPinImageByIdFamily extends Family<AsyncValue<Uint8List?>> {
  /// See also [groupPinImageById].
  const GroupPinImageByIdFamily();

  /// See also [groupPinImageById].
  GroupPinImageByIdProvider call(
    String groupId,
  ) {
    return GroupPinImageByIdProvider(
      groupId,
    );
  }

  @override
  GroupPinImageByIdProvider getProviderOverride(
    covariant GroupPinImageByIdProvider provider,
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
  String? get name => r'groupPinImageByIdProvider';
}

/// See also [groupPinImageById].
class GroupPinImageByIdProvider extends AutoDisposeFutureProvider<Uint8List?> {
  /// See also [groupPinImageById].
  GroupPinImageByIdProvider(
    String groupId,
  ) : this._internal(
          (ref) => groupPinImageById(
            ref as GroupPinImageByIdRef,
            groupId,
          ),
          from: groupPinImageByIdProvider,
          name: r'groupPinImageByIdProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$groupPinImageByIdHash,
          dependencies: GroupPinImageByIdFamily._dependencies,
          allTransitiveDependencies:
              GroupPinImageByIdFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  GroupPinImageByIdProvider._internal(
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
  Override overrideWith(
    FutureOr<Uint8List?> Function(GroupPinImageByIdRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GroupPinImageByIdProvider._internal(
        (ref) => create(ref as GroupPinImageByIdRef),
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
  AutoDisposeFutureProviderElement<Uint8List?> createElement() {
    return _GroupPinImageByIdProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GroupPinImageByIdProvider && other.groupId == groupId;
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
mixin GroupPinImageByIdRef on AutoDisposeFutureProviderRef<Uint8List?> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _GroupPinImageByIdProviderElement
    extends AutoDisposeFutureProviderElement<Uint8List?>
    with GroupPinImageByIdRef {
  _GroupPinImageByIdProviderElement(super.provider);

  @override
  String get groupId => (origin as GroupPinImageByIdProvider).groupId;
}

String _$groupImageServiceHash() => r'5507e528a07572e7d0335acd7362bc94648b601f';

/// See also [GroupImageService].
@ProviderFor(GroupImageService)
final groupImageServiceProvider = AsyncNotifierProvider<GroupImageService,
    Map<String, GroupImageDto>>.internal(
  GroupImageService.new,
  name: r'groupImageServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$groupImageServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GroupImageService = AsyncNotifier<Map<String, GroupImageDto>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
