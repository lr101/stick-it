// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$memberServiceHash() => r'3087deae5d1679764ee94de6cd36cbef4f4b8d1a';

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

abstract class _$MemberService
    extends BuildlessAutoDisposeAsyncNotifier<List<MemberDto>> {
  late final String groupId;

  FutureOr<List<MemberDto>> build(
    String groupId,
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
    String groupId,
  ) {
    return MemberServiceProvider(
      groupId,
    );
  }

  @override
  MemberServiceProvider getProviderOverride(
    covariant MemberServiceProvider provider,
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
  String? get name => r'memberServiceProvider';
}

/// See also [MemberService].
class MemberServiceProvider extends AutoDisposeAsyncNotifierProviderImpl<
    MemberService, List<MemberDto>> {
  /// See also [MemberService].
  MemberServiceProvider(
    String groupId,
  ) : this._internal(
          () => MemberService()..groupId = groupId,
          from: memberServiceProvider,
          name: r'memberServiceProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$memberServiceHash,
          dependencies: MemberServiceFamily._dependencies,
          allTransitiveDependencies:
              MemberServiceFamily._allTransitiveDependencies,
          groupId: groupId,
        );

  MemberServiceProvider._internal(
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
  FutureOr<List<MemberDto>> runNotifierBuild(
    covariant MemberService notifier,
  ) {
    return notifier.build(
      groupId,
    );
  }

  @override
  Override overrideWith(MemberService Function() create) {
    return ProviderOverride(
      origin: this,
      override: MemberServiceProvider._internal(
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
  AutoDisposeAsyncNotifierProviderElement<MemberService, List<MemberDto>>
      createElement() {
    return _MemberServiceProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MemberServiceProvider && other.groupId == groupId;
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
mixin MemberServiceRef on AutoDisposeAsyncNotifierProviderRef<List<MemberDto>> {
  /// The parameter `groupId` of this provider.
  String get groupId;
}

class _MemberServiceProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<MemberService,
        List<MemberDto>> with MemberServiceRef {
  _MemberServiceProviderElement(super.provider);

  @override
  String get groupId => (origin as MemberServiceProvider).groupId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
