// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geojson_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DistrictService)
const districtServiceProvider = DistrictServiceProvider._();

final class DistrictServiceProvider
    extends $NotifierProvider<DistrictService, MapInfoDto?> {
  const DistrictServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'districtServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$districtServiceHash();

  @$internal
  @override
  DistrictService create() => DistrictService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MapInfoDto? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MapInfoDto?>(value),
    );
  }
}

String _$districtServiceHash() => r'3105ddce80480b3aa0027e3cba2ed281bae8d107';

abstract class _$DistrictService extends $Notifier<MapInfoDto?> {
  MapInfoDto? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MapInfoDto?, MapInfoDto?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MapInfoDto?, MapInfoDto?>,
              MapInfoDto?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
