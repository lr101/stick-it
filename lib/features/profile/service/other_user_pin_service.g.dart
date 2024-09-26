// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'other_user_pin_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$otherUserPinHash() => r'72405bb60bb0364d04275ccd93f65afdef11a0c9';

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

/// See also [otherUserPin].
@ProviderFor(otherUserPin)
const otherUserPinProvider = OtherUserPinFamily();

/// See also [otherUserPin].
class OtherUserPinFamily extends Family<AsyncValue<List<LocalPinDto>>> {
  /// See also [otherUserPin].
  const OtherUserPinFamily();

  /// See also [otherUserPin].
  OtherUserPinProvider call(
    String userId,
  ) {
    return OtherUserPinProvider(
      userId,
    );
  }

  @override
  OtherUserPinProvider getProviderOverride(
    covariant OtherUserPinProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'otherUserPinProvider';
}

/// See also [otherUserPin].
class OtherUserPinProvider
    extends AutoDisposeFutureProvider<List<LocalPinDto>> {
  /// See also [otherUserPin].
  OtherUserPinProvider(
    String userId,
  ) : this._internal(
          (ref) => otherUserPin(
            ref as OtherUserPinRef,
            userId,
          ),
          from: otherUserPinProvider,
          name: r'otherUserPinProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$otherUserPinHash,
          dependencies: OtherUserPinFamily._dependencies,
          allTransitiveDependencies:
              OtherUserPinFamily._allTransitiveDependencies,
          userId: userId,
        );

  OtherUserPinProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    FutureOr<List<LocalPinDto>> Function(OtherUserPinRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OtherUserPinProvider._internal(
        (ref) => create(ref as OtherUserPinRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<LocalPinDto>> createElement() {
    return _OtherUserPinProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OtherUserPinProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OtherUserPinRef on AutoDisposeFutureProviderRef<List<LocalPinDto>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _OtherUserPinProviderElement
    extends AutoDisposeFutureProviderElement<List<LocalPinDto>>
    with OtherUserPinRef {
  _OtherUserPinProviderElement(super.provider);

  @override
  String get userId => (origin as OtherUserPinProvider).userId;
}

String _$otherUserPinServiceHash() =>
    r'8c85c35e3d2cb3cb9f1df98385e1ebfa8b6c4a98';

abstract class _$OtherUserPinService
    extends BuildlessAsyncNotifier<List<LocalPinDto>> {
  late final String userId;

  FutureOr<List<LocalPinDto>> build(
    String userId,
  );
}

/// See also [OtherUserPinService].
@ProviderFor(OtherUserPinService)
const otherUserPinServiceProvider = OtherUserPinServiceFamily();

/// See also [OtherUserPinService].
class OtherUserPinServiceFamily extends Family<AsyncValue<List<LocalPinDto>>> {
  /// See also [OtherUserPinService].
  const OtherUserPinServiceFamily();

  /// See also [OtherUserPinService].
  OtherUserPinServiceProvider call(
    String userId,
  ) {
    return OtherUserPinServiceProvider(
      userId,
    );
  }

  @override
  OtherUserPinServiceProvider getProviderOverride(
    covariant OtherUserPinServiceProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'otherUserPinServiceProvider';
}

/// See also [OtherUserPinService].
class OtherUserPinServiceProvider
    extends AsyncNotifierProviderImpl<OtherUserPinService, List<LocalPinDto>> {
  /// See also [OtherUserPinService].
  OtherUserPinServiceProvider(
    String userId,
  ) : this._internal(
          () => OtherUserPinService()..userId = userId,
          from: otherUserPinServiceProvider,
          name: r'otherUserPinServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$otherUserPinServiceHash,
          dependencies: OtherUserPinServiceFamily._dependencies,
          allTransitiveDependencies:
              OtherUserPinServiceFamily._allTransitiveDependencies,
          userId: userId,
        );

  OtherUserPinServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  FutureOr<List<LocalPinDto>> runNotifierBuild(
    covariant OtherUserPinService notifier,
  ) {
    return notifier.build(
      userId,
    );
  }

  @override
  Override overrideWith(OtherUserPinService Function() create) {
    return ProviderOverride(
      origin: this,
      override: OtherUserPinServiceProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<OtherUserPinService, List<LocalPinDto>>
      createElement() {
    return _OtherUserPinServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OtherUserPinServiceProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin OtherUserPinServiceRef on AsyncNotifierProviderRef<List<LocalPinDto>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _OtherUserPinServiceProviderElement
    extends AsyncNotifierProviderElement<OtherUserPinService, List<LocalPinDto>>
    with OtherUserPinServiceRef {
  _OtherUserPinServiceProviderElement(super.provider);

  @override
  String get userId => (origin as OtherUserPinServiceProvider).userId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
