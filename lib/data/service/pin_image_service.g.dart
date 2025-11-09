// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_image_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getPinImageAndFetch)
const getPinImageAndFetchProvider = GetPinImageAndFetchFamily._();

final class GetPinImageAndFetchProvider
    extends
        $FunctionalProvider<
          AsyncValue<Uint8List>,
          Uint8List,
          FutureOr<Uint8List>
        >
    with $FutureModifier<Uint8List>, $FutureProvider<Uint8List> {
  const GetPinImageAndFetchProvider._({
    required GetPinImageAndFetchFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getPinImageAndFetchProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getPinImageAndFetchHash();

  @override
  String toString() {
    return r'getPinImageAndFetchProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Uint8List> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Uint8List> create(Ref ref) {
    final argument = this.argument as String;
    return getPinImageAndFetch(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPinImageAndFetchProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getPinImageAndFetchHash() =>
    r'97df963630e1f177a5cfbfd2f4af765d54008235';

final class GetPinImageAndFetchFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Uint8List>, String> {
  const GetPinImageAndFetchFamily._()
    : super(
        retry: null,
        name: r'getPinImageAndFetchProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetPinImageAndFetchProvider call(String pinId) =>
      GetPinImageAndFetchProvider._(argument: pinId, from: this);

  @override
  String toString() => r'getPinImageAndFetchProvider';
}
