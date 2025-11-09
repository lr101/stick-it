// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(getPinImageInfo)
const getPinImageInfoProvider = GetPinImageInfoFamily._();

final class GetPinImageInfoProvider
    extends
        $FunctionalProvider<
          AsyncValue<PinImageInfo?>,
          PinImageInfo?,
          FutureOr<PinImageInfo?>
        >
    with $FutureModifier<PinImageInfo?>, $FutureProvider<PinImageInfo?> {
  const GetPinImageInfoProvider._({
    required GetPinImageInfoFamily super.from,
    required LocalPinDto super.argument,
  }) : super(
         retry: null,
         name: r'getPinImageInfoProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getPinImageInfoHash();

  @override
  String toString() {
    return r'getPinImageInfoProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PinImageInfo?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PinImageInfo?> create(Ref ref) {
    final argument = this.argument as LocalPinDto;
    return getPinImageInfo(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPinImageInfoProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getPinImageInfoHash() => r'7b2bc5df14f355670077b6886432a86ee0d5cec2';

final class GetPinImageInfoFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PinImageInfo?>, LocalPinDto> {
  const GetPinImageInfoFamily._()
    : super(
        retry: null,
        name: r'getPinImageInfoProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetPinImageInfoProvider call(LocalPinDto pinDto) =>
      GetPinImageInfoProvider._(argument: pinDto, from: this);

  @override
  String toString() => r'getPinImageInfoProvider';
}
