// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$memberServiceHash() => r'26f8c94ec81fbccf75e17ce282b3338a8312cdc7';

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

abstract class _$MemberService extends BuildlessAsyncNotifier<List<MemberDto>> {
  late final LocalGroupDto group;

  FutureOr<List<MemberDto>> build(
    LocalGroupDto group,
  );
}

/// See also [MemberService].
@ProviderFor(MemberService)
const memberServiceProvider = MemberServiceFamily();

/// See also [MemberService].
class MemberServiceFamily extends Family<AsyncValue<List<MemberDto>>> {
  /// See also [MemberService].
  const MemberServiceFamily();

  /// See also [MemberService].
  MemberServiceProvider call(
    LocalGroupDto group,
  ) {
    return MemberServiceProvider(
      group,
    );
  }

  @override
  MemberServiceProvider getProviderOverride(
    covariant MemberServiceProvider provider,
  ) {
    return call(
      provider.group,
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
  String? get name => r'memberServiceProvider';
}

/// See also [MemberService].
class MemberServiceProvider
    extends AsyncNotifierProviderImpl<MemberService, List<MemberDto>> {
  /// See also [MemberService].
  MemberServiceProvider(
    LocalGroupDto group,
  ) : this._internal(
          () => MemberService()..group = group,
          from: memberServiceProvider,
          name: r'memberServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$memberServiceHash,
          dependencies: MemberServiceFamily._dependencies,
          allTransitiveDependencies:
              MemberServiceFamily._allTransitiveDependencies,
          group: group,
        );

  MemberServiceProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.group,
  }) : super.internal();

  final LocalGroupDto group;

  @override
  FutureOr<List<MemberDto>> runNotifierBuild(
    covariant MemberService notifier,
  ) {
    return notifier.build(
      group,
    );
  }

  @override
  Override overrideWith(MemberService Function() create) {
    return ProviderOverride(
      origin: this,
      override: MemberServiceProvider._internal(
        () => create()..group = group,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        group: group,
      ),
    );
  }

  @override
  AsyncNotifierProviderElement<MemberService, List<MemberDto>> createElement() {
    return _MemberServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MemberServiceProvider && other.group == group;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, group.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin MemberServiceRef on AsyncNotifierProviderRef<List<MemberDto>> {
  /// The parameter `group` of this provider.
  LocalGroupDto get group;
}

class _MemberServiceProviderElement
    extends AsyncNotifierProviderElement<MemberService, List<MemberDto>>
    with MemberServiceRef {
  _MemberServiceProviderElement(super.provider);

  @override
  LocalGroupDto get group => (origin as MemberServiceProvider).group;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
