// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_data_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GlobalDataService)
const globalDataServiceProvider = GlobalDataServiceProvider._();

final class GlobalDataServiceProvider
    extends $NotifierProvider<GlobalDataService, GlobalDataDto> {
  const GlobalDataServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'globalDataServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$globalDataServiceHash();

  @$internal
  @override
  GlobalDataService create() => GlobalDataService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GlobalDataDto value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GlobalDataDto>(value),
    );
  }
}

String _$globalDataServiceHash() => r'e4281575bf51ae5456daf4e3694243ac85d3ae31';

abstract class _$GlobalDataService extends $Notifier<GlobalDataDto> {
  GlobalDataDto build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<GlobalDataDto, GlobalDataDto>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<GlobalDataDto, GlobalDataDto>,
              GlobalDataDto,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(AuthService)
const authServiceProvider = AuthServiceProvider._();

final class AuthServiceProvider
    extends $AsyncNotifierProvider<AuthService, bool> {
  const AuthServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authServiceHash();

  @$internal
  @override
  AuthService create() => AuthService();
}

String _$authServiceHash() => r'c5e69c64abcaabf82fb42dc9d93e6305cba96df0';

abstract class _$AuthService extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<bool>, bool>,
              AsyncValue<bool>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(userId)
const userIdProvider = UserIdProvider._();

final class UserIdProvider extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  const UserIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userIdHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return userId(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$userIdHash() => r'f2c97313ee210fb250e363e4fcf6288210cac59b';

@ProviderFor(CameraTorch)
const cameraTorchProvider = CameraTorchProvider._();

final class CameraTorchProvider extends $NotifierProvider<CameraTorch, bool> {
  const CameraTorchProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cameraTorchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cameraTorchHash();

  @$internal
  @override
  CameraTorch create() => CameraTorch();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$cameraTorchHash() => r'd9b867808565232d7ea3ccb93b3f588211414af4';

abstract class _$CameraTorch extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(LastSeen)
const lastSeenProvider = LastSeenFamily._();

final class LastSeenProvider extends $NotifierProvider<LastSeen, DateTime?> {
  const LastSeenProvider._({
    required LastSeenFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'lastSeenProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$lastSeenHash();

  @override
  String toString() {
    return r'lastSeenProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  LastSeen create() => LastSeen();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is LastSeenProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$lastSeenHash() => r'2116a21cd5c291835d95e9b948f7cd80f579e40f';

final class LastSeenFamily extends $Family
    with
        $ClassFamilyOverride<
          LastSeen,
          DateTime?,
          DateTime?,
          DateTime?,
          String
        > {
  const LastSeenFamily._()
    : super(
        retry: null,
        name: r'lastSeenProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  LastSeenProvider call(String key) =>
      LastSeenProvider._(argument: key, from: this);

  @override
  String toString() => r'lastSeenProvider';
}

abstract class _$LastSeen extends $Notifier<DateTime?> {
  late final _$args = ref.$arg as String;
  String get key => _$args;

  DateTime? build(String key);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<DateTime?, DateTime?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<DateTime?, DateTime?>,
              DateTime?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(lastKnownLocation)
const lastKnownLocationProvider = LastKnownLocationProvider._();

final class LastKnownLocationProvider
    extends $FunctionalProvider<LatLng, LatLng, LatLng>
    with $Provider<LatLng> {
  const LastKnownLocationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'lastKnownLocationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$lastKnownLocationHash();

  @$internal
  @override
  $ProviderElement<LatLng> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LatLng create(Ref ref) {
    return lastKnownLocation(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LatLng value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LatLng>(value),
    );
  }
}

String _$lastKnownLocationHash() => r'32bf99245b9bc078cb9ab20675d6db2f5b6f0191';
