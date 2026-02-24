// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_repo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(isarRepo)
const isarRepoProvider = IsarRepoProvider._();

final class IsarRepoProvider extends $FunctionalProvider<Isar, Isar, Isar>
    with $Provider<Isar> {
  const IsarRepoProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isarRepoProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isarRepoHash();

  @$internal
  @override
  $ProviderElement<Isar> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Isar create(Ref ref) {
    return isarRepo(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Isar value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Isar>(value),
    );
  }
}

String _$isarRepoHash() => r'3bad998f3cb7eb5da2d931948cc89ba107cce6ab';
