// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geojson_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(GeojsonService)
const geojsonServiceProvider = GeojsonServiceProvider._();

final class GeojsonServiceProvider
    extends $AsyncNotifierProvider<GeojsonService, List<Polygon<Object>>> {
  const GeojsonServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'geojsonServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$geojsonServiceHash();

  @$internal
  @override
  GeojsonService create() => GeojsonService();
}

String _$geojsonServiceHash() => r'34477e1211d38de2aa885b7f26fd4e703dd0f03c';

abstract class _$GeojsonService extends $AsyncNotifier<List<Polygon<Object>>> {
  FutureOr<List<Polygon<Object>>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<AsyncValue<List<Polygon<Object>>>, List<Polygon<Object>>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<Polygon<Object>>>,
                List<Polygon<Object>>
              >,
              AsyncValue<List<Polygon<Object>>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

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

String _$districtServiceHash() => r'678bc9955ea9e95fa76abdefac0b3e6de02761be';

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
